## Calculate path loss using trans horizon model, following Siwiak & Bahreini (2007) Eq. (7.25)
##
## Inputs:  d__km          distance           [km]
##          h_1__meter     terminal 1 height  [m]
##          h_1__meter     terminal 2 height  [m]
##
## Output:  L_overhor__dB  path loss          [dB]

function L_overhor__dB = model_overhor(d__km, h_1__meter, h_2__meter)
  globals

  ## Calculate radio horizon distance
  d_hor = calc_d_hor(h_1__meter, h_2__meter);

  ## Eq. (7.25)
  factor1 = -20 * log10((h_1__meter * h_2__meter) .\ (d__km * 1000).^2);
  factor2 = -10 * log10((1 + (d__km / (6 * d_hor)).^ 7) / 1 +(d__km / d_hor).^ 3);
  factor3 = -d__km ./ (13 + 77 * (d_hor ./ d__km));
  factor4 = (22 + (f__MHz / 2000)) * log10(100 / f__MHz);

  L_overhor__dB = factor1 + factor2 + factor3 + factor4;
endfunction