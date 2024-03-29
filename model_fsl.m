## Calculate free space loss with parametric path loss exponent 
##
## Inputs:  dist__km     distance            [km]
##          param_alpha  path loss exponent  num.  (2)
##
## Output:  L_fsl__dB    path loss           [dB]

function L_fsl__dB = model_fsl(dist__km, param_alpha = 2)
  globals
    lambda__meter = c / (f__MHz * 10^6);                          # [m]    Transceiver wave length
    r_0__meter = 1000;                                            # [m]    Path loss reference distance
    L_ref = ((4 * pi * r_0__meter) / lambda__meter)^param_alpha;  # num.   Path loss in reference distance
    L_0__dB = num2db(L_ref);                                      # [dB]   Path loss in reference distance in decibels

    ## Multiply reference loss by node distances
    L_fsl__dB = -(L_0__dB + 10 * log10(dist__km .^ param_alpha));
endfunction