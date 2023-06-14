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

  ## Precalculated alphas, curve fitted to ITU-R P.528-5 line-of-sight propagatio mode
  alpha_curve = [1.558,1.610,1.643,1.667,1.687,1.705,1.720,1.733,1.745,1.757,1.767,1.777,1.786,1.795,1.803,1.811,1.819,1.826,1.833,1.840,1.847,1.853,1.860,1.866,1.872,1.878,1.884,1.889,1.895,1.900,1.906,1.911,1.916,1.922,1.927,1.932,1.937,1.942,1.947,1.952,1.957,1.962,1.966,1.971,1.976,1.981,1.986,1.990,1.995,2.000,2.009,2.018,2.026,2.035,2.044,2.053,2.062,2.071,2.080,2.089,2.098,2.107,2.116,2.125,2.135,2.144,2.154,2.164,2.174,2.184,2.194,2.204,2.214,2.225,2.236,2.247,2.259,2.270,2.282,2.295,2.307,2.320,2.334,2.348,2.363,2.378,2.394,2.411,2.429,2.449,2.469,2.492,2.517,2.544,2.576,2.613,2.658,2.719,2.814];

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