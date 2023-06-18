## Calculate free space loss with parametric path loss exponent 
##
## Inputs:  dist__km     distance            [km]
##          param_alpha  path loss exponent  num.  (2)
##
## Output:  L_fsl__dB    path loss           [dB]

function L_fsl__dB = model_fsl(dit__km, param_alpha = 2)
  globals
    lambda = c / (f * 10^6);                        # [m]    Transceiver wave length
    r_0 = 1000;                                     # [m]    Path loss reference distance
    L_ref = ((4 * pi * r_0) / lambda)^param_alpha;  # num.   Path loss in reference distance
    L_0 = num2db(L_ref);                            # [dB]   Path loss in reference distance in decibels

    ## Multiply reference loss by node distances
    L_fsl__dB = -(L_0 + 10 * log10(dist__km.^param_alpha));
endfunction