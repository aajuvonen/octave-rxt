% Calculate path losses using ITS model (Itse Tehty Säästömalli)
% Inputs: distance [km], terminal 1 height [m], terminal 2 height [m], time availability [%]
% Output: path loss [dB]
function path_loss_its = model_its(param_dist,param_h1,param_h2,param_timeq)
  globals
  lambda = c/(f*10^6);                                      % [m]    Transceiver wave length
  r_0 = 1000;                                               % [m]    Path loss reference distance
  L_ref = ((4*pi*r_0)/lambda)^2;                            % num.   Path loss in reference distance
  L_0 = num2db(L_ref);                                      % [dB]   Path loss in reference distance in decibels
  alpha = alpha_curve(param_timeq);                         % num.   Path loss exponent

  % Multiply reference loss by node distances
  path_loss_its = -1*(L_0 + 10*log10(param_dist.^alpha));

  % Calculate radio horizon distance
  d_hor = calc_d_hor(param_h1,param_h2);

  % Approximate diffraction phase losses for distances d_hor < d < dist_dif
  dist_dif = d_hor*1.05;                                    % Maximum distance for diffraction
  loss_dif = param_dist - d_hor;                            % Path distance after radio horizon
  loss_dif = loss_dif.*(loss_dif>0);                        % Clamp path distance to range 0...Inf
  loss_dif_inner = loss_dif.*(loss_dif<(dist_dif - d_hor)); % Clamp to range d < dist_dif
  loss_dif_outer = loss_dif.*(loss_dif>(dist_dif - d_hor)); % Clamp to range d < dist_dif
  loss_dif = loss_dif_inner.*6.7;                           % Diffraction phase loss of 6.7 dB per km
  loss_dif += max(loss_dif).*(loss_dif_outer>0);            % Fill the rest of the matrix with the highest value
  
  % Approximate scattering phase losses for distances d > dist_dif
  loss_sca = param_dist - dist_dif;                         % Path distance after diffraction
  loss_sca = loss_sca.*(loss_sca>0);                        % Clamp path distance to range 0...Inf
  loss_sca = loss_sca.*0.5;                                 % Scattering phase loss of 0.5 dB per km

  % Sum diffraction and scattering phases to path loss
  path_loss_its = path_loss_its - loss_dif - loss_sca;
endfunction