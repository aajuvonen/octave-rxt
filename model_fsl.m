% Calculate free space loss with parametric path loss exponent 
% Inputs: distance [km], path loss exponent
% Output: path loss [dB]
function path_loss_fsl = model_fsl(param_dist,param_alpha)
  globals
  lambda = c/(f*10^6);              % [m]    Transceiver wave length
  r_0 = 1000;                       % [m]    Path loss reference distance
  alpha = param_alpha;              % num.   Path loss exponent
  L_ref = ((4*pi*r_0)/lambda)^2;    % num.   Path loss in reference distance
  L_0 = num2db(L_ref);              % [dB]   Path loss in reference distance in decibels

  % Multiply reference loss by node distances
  path_loss_fsl = -1*(L_0 + 10*log10(param_dist.^param_alpha));
endfunction