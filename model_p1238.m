% Calculate path loss with ITU-R P.1238-11

% Inputs:            distance  [m]
%               line-of-sight  bool   (LoS / NLos)
%                 environment  int.   (1 = office, 2 = corridor, 3 = industrial)

% Output:           path loss  [dB]

function path_loss_p1238 = model_p1238(param_dist,param_los = 1,param_env = 1)
  globals
  coeff_row = 2 * param_env - param_los;

  % Valid frequencies and loss coefficients from ITU-R P.1238-11 table 2
  loss_freqs = [300,83500,2,27;300,82000,4,30;300,83500,2,160;625,83500,4,94;625,70280,2,101;625,70280,5,108];
  loss_coeff = [1.46,34.62,2.03,3.76;2.46,29.53,2.38,5.04;1.63,28.12,2.25,4.07;2.77,29.27,2.48,7.63;2.31,24.52,2.06,2.69;3.79,21.01,1.34,9.05];

  if(warnings)
    if(f < loss_freqs(coeff_row,1)) printf("Warning: frequency lower than model minimum %d", loss_freqs(coeff_row,1)), disp(" MHz") endif
    if(f > loss_freqs(coeff_row,2)) printf("Warning: frequency exceeds model maximum %d", loss_freqs(coeff_row,2)), disp(" MHz") endif
    if(param_dist < loss_freqs(coeff_row,3)) printf("Warning: distance lower than model minimum %d", loss_freqs(coeff_row,1)), disp(" m") endif
    if(param_dist > loss_freqs(coeff_row,4)) printf("Warning: distance exceeds model maximum %d", loss_freqs(coeff_row,2)), disp(" m") endif
  endif

  % Loss coefficients
  alpha = loss_coeff(coeff_row,1);
  beeta = loss_coeff(coeff_row,2);
  gamma = loss_coeff(coeff_row,3);
  sigma = loss_coeff(coeff_row,4);

  % Eq. (1), with added factor sigma
  path_loss_p1238 = 10 * alpha .* log10(param_dist) + beeta + 10 * gamma * log10(f) + norm_inv(q) * sigma;
endfunction