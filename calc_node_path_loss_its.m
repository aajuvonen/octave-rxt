% Calculate node path losses using ITS model (Itse Tehty Säästömalli)
function calc_node_path_loss_its
  printf("Calculating node path losses using ITS... ")
  tic
  globals
  lambda = c/(f*10^6);                          % [m]    Transceiver wave length
  r_0 = 1000;                                   % [m]    Path loss reference distance
  L_ref = ((4*pi*r_0)/lambda)^2;                % num.   Path loss in reference distance
  L_0 = num2db(L_ref);                          % [dB]   Path loss in reference distance in decibels
  alpha = alpha_curve(q);                       % num.   Path loss exponent

  % Multiply reference loss by node distances
  node_path_loss = -1*(L_0 + 10*log10(node_dist.^alpha));

  % Approximate diffraction phase losses for distances d_hor < d < dist_dif
  dist_dif = node_d_hor.*1.05;                  % Maximum distance for diffraction
  loss_dif = node_dist - node_d_hor;            % Path distance after radio horizon
  loss_dif = loss_dif.*(loss_dif>0);            % Clamp path distance to range 0...Inf
  loss_dif = loss_dif.*(loss_dif<dist_dif);     % Clamp to range d < dist_dif
  loss_dif.*6.7;                                % Diffraction phase loss of 6.7 dB per km
  
  % Approximate scattering phase losses for distances d > dist_dif
  loss_sca = node_dist - node_d_hor - dist_dif; % Path distance after diffraction
  loss_sca = loss_sca.*(loss_sca>0);            % Clamp path distance to range 0...Inf
  loss_sca.*0.5;                                % Scattering phase loss of 0.5 dB per km

  % Sum diffraction and scattering phases to path loss
  node_path_loss -= loss_dif + loss_sca;
  disp(toc)
endfunction