## Calculate path loss using trans horizon model, following Siwiak & Bahreini (2007) Eq. (7.25)
##
## Inputs:            distance  [km]
##           terminal 1 height  [m]
##           terminal 2 height  [m]
##
## Output:           path loss  [dB]

function path_loss_overhor = model_overhor(param_dist,param_h1,param_h2)
  globals

  ## Calculate radio horizon distance
  d_hor = calc_d_hor(param_h1,param_h2);

  ## Eq. (7.25)
  factor1 = -20 * log10((param_h1 * param_h2) .\ (param_dist * 1000).^2);
  factor2 = -10 * log10((1+(param_dist / (6 * d_hor)).^7) / 1+(param_dist / d_hor).^3);
  factor3 = -param_dist ./ (13 + 77*(d_hor ./ param_dist));
  factor4 = (22 + (f / 2000)) * log10(100 / f);

  path_loss_overhor = factor1 + factor2 + factor3 + factor4;
endfunction