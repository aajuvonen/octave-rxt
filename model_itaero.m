## Calculate path losses using the itaero model (Itse Tehty Aeromalli), curve fitted to ITU-R P.528-5 line-of-sight propagatio mode
##
## Inputs:            distance  [km]
##           terminal 1 height  [m]
##           terminal 2 height  [m]
##           time availability  [%]
##
## Output:           path loss  [dB]

function path_loss_itaero = model_itaero(param_dist,param_h1,param_h2,param_timeq = 50)
  globals

  if(warnings)
    if(f < 100) disp("Warning: the model performs best with frequencies above 100 MHz") endif
    if(param_h1 < 1000 || param_h2 < 1000) disp("Warning: the model performs best with altitudes above 1000 m") endif
  endif

  lambda = c/(f*10^6);                                                    # [m]    Transceiver wave length
  r_0 = 1000;                                                             # [m]    Path loss reference distance
  L_ref = ((4*pi*r_0)/lambda)^2;                                          # num.   Path loss in reference distance
  L_0 = num2db(L_ref);                                                    # [dB]   Path loss in reference distance in decibels
  alpha = alpha_curve(param_timeq);                                       # num.   Path loss exponent

  ## Multiply reference loss by node distances
  path_loss_itaero = -(L_0 + 10*log10(param_dist.^alpha));

  ## Calculate radio horizon distance
  d_hor = calc_d_hor(param_h1,param_h2);

  ## Approximate diffraction losses for distances d_hor < d < dist_dif
  dist_dif = d_hor * 1.2;                                                 # Maximum distance for diffraction
  loss_dif = param_dist - d_hor;                                          # Path distance after radio horizon
  loss_dif_inner = loss_dif.*(loss_dif>0);                                # Clamp path distance to range 0...Inf
  loss_dif_outer = (param_dist >= dist_dif).*(dist_dif - d_hor);          # Clamp path distance to range d >= dist_dif
  loss_dif_inner = loss_dif_inner.*(1-(loss_dif_outer > 0));              # Clamp path distance to range d < dist_dif
  loss_dif = (loss_dif_inner + loss_dif_outer).*0.35;                     # Diffraction loss
                                                                          # TODO: larger incidence angles should increase rate of diffration
  
  ## Approximate scattering losses for distances d > dist_dif
  loss_sca = param_dist - dist_dif;                                       # Path distance after diffraction
  loss_sca = loss_sca.*(loss_sca>0);                                      # Clamp path distance to range 0...Inf
  loss_sca = loss_sca.*(0.368421 / (1.85779 + alpha_curve(param_timeq))); # Scattering loss
  
  ## Sum diffraction and scattering modes to path loss
  path_loss_itaero = path_loss_itaero - loss_dif - loss_sca;
endfunction