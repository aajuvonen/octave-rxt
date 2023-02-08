% Calculate node received powers using free space loss with parametric path loss exponent 
function calc_node_path_loss_fsl
  disp("Calculating node path losses using free space loss...")
  tic
  global f;
  global c;
  global node_dist;
  global node_path_loss;

  lambda = c/(f*10^6);              % [m]    Transceiver wave length
  r_0 = 1000;                       % [m]    Path loss reference distance
  alpha = 2;                        % num.   Path loss exponent
  L_ref = ((4*pi*r_0)/lambda)^2;    % num.   Path loss in reference distance
  L_0 = num2db(L_ref);              % [dB]   Path loss in reference distance in decibels

  % Multiply reference loss by node distances
  node_path_loss = -1*(L_0 + 10*log10(node_dist.^alpha));
  toc
endfunction