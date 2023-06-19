## Calculate path losses using the itaero model (Itse Tehty Aeromalli tm)
## The curve is fitted to ITU-R P.528-5 line-of-sight propagatio mode
##
## Inputs:  d__km         distance           [km]
##          h_1__meter    terminal 1 height  [m]
##          h_2__meter    terminal 2 height  [m]
##          q__percent    time availability  [%]
##
## Output:  L_itaero__dB  path loss          [dB]

function L_itaero__dB = model_itaero(d__km, h_1__meter, h_2__meter, q__percent = 50)
  globals
  constants

  if(warnings)
    if(f__MHz < 100) disp("Warning: the model performs best with frequencies above 100 MHz") endif
    if(h_1__meter < 1000 || h_2__meter < 1000) disp("Warning: the model performs best with altitudes above 1000 m") endif
  endif

  lambda__meter = c / (f__MHz * 10^6);                                              # [m]    Transceiver wave length
  r_0__meter = 1000;                                                                # [m]    Path loss reference distance
  L_ref = ((4 * pi * r_0__meter) / lambda__meter)^2;                                # num.   Path loss in reference distance
  L_0__dB = num2db(L_ref);                                                          # [dB]   Path loss in reference distance in decibels
  alpha = alpha_curve(q__percent);                                                  # num.   Path loss exponent

  ## Multiply reference loss by node distances
  L_itaero__dB = -(L_0__dB + 10 * log10(d__km .^ alpha));

  ## Calculate radio horizon distance
  d_hor__km = calc_d_hor(h_1__meter, h_2__meter);

  ## Approximate diffraction losses for distances d_hor < d < dist_dif
  dist_dif__km = d_hor__km * 1.2;                                                   # Maximum distance for diffraction
  loss_dif__dB = d__km - d_hor__km;                                                 # Path distance after radio horizon
  loss_dif_inner = loss_dif__dB .* (loss_dif__dB > 0);                              # Clamp path distance to range 0...Inf
  loss_dif_outer = (d__km >= dist_dif__km) .* (dist_dif__km - d_hor__km);           # Clamp path distance to range d >= dist_dif
  loss_dif_inner = loss_dif_inner .* (1 - (loss_dif_outer > 0));                    # Clamp path distance to range d < dist_dif
  loss_dif__dB = (loss_dif_inner + loss_dif_outer) .* 0.35;                         # Diffraction loss
                                                                                    # TODO: larger incidence angles should increase rate of diffration
  
  ## Approximate scattering losses for distances d > dist_dif
  loss_sca__dB = d__km - dist_dif__km;                                              # Path distance after diffraction
  loss_sca__dB = loss_sca__dB .* (loss_sca__dB > 0);                                # Clamp path distance to range 0...Inf
  loss_sca__dB = loss_sca__dB .* (0.368421 / (1.85779 + alpha_curve(q__percent)));  # Scattering loss
  
  ## Sum diffraction and scattering modes to path loss
  L_itaero__dB = L_itaero__dB - loss_dif__dB - loss_sca__dB;
endfunction