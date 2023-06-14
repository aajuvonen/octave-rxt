## Calculate free space loss with parametric path loss exponent 
##
## Inputs:            distance  [km]
##          path loss exponent  num.
##
## Output:           path loss  [dB]

function path_loss_fsl = model_fsl(param_dist,param_alpha = 2)
  globals
    lambda = c/(f*10^6);                         # [m]    Transceiver wave length
    r_0 = 1000;                                  # [m]    Path loss reference distance
    L_ref = ((4 * pi * r_0)/lambda)^param_alpha; # num.   Path loss in reference distance
    L_0 = num2db(L_ref);                         # [dB]   Path loss in reference distance in decibels

    ## Multiply reference loss by node distances
    path_loss_fsl = -(L_0 + 10*log10(param_dist.^param_alpha));
endfunction