% ITS path loss model (Itse Tehty Säästömalli)
function loss_its = its(d,h1,h2,f,p,q)
  c = 299792458;                                % [m/s]  Speed of light
  lambda = c/(f*10^6);                          % [m]    Transceiver wave length
  r_0 = 1000;                                   % [m]    Path loss reference distance
  L_ref = ((4*pi*r_0)/lambda)^2;                % num.   Path loss in reference distance
  L_0 = 10*log10(L_ref);                        % [dB]   Path loss in reference distance in decibels

  % Precalculated alphas, curve fitted to ITU-R P.528-4 line of sight propagation phase
  alpha_curve = [1.874,1.889,1.898,1.905,1.911,1.916,1.920,1.924,1.928,1.931,1.934,1.936,1.939,1.942,1.944,1.946,1.948,1.951,1.953,1.955,1.956,1.958,1.960,1.962,1.964,1.965,1.967,1.968,1.970,1.972,1.973,1.975,1.976,1.978,1.979,1.981,1.982,1.983,1.985,1.986,1.988,1.989,1.990,1.992,1.993,1.995,1.996,1.997,1.999,2.000,2.001,2.003,2.004,2.005,2.007,2.008,2.010,2.011,2.013,2.014,2.016,2.018,2.019,2.021,2.023,2.025,2.027,2.029,2.031,2.033,2.036,2.038,2.041,2.043,2.046,2.049,2.052,2.055,2.058,2.061,2.065,2.069,2.073,2.077,2.082,2.086,2.092,2.097,2.103,2.110,2.117,2.124,2.133,2.143,2.154,2.167,2.183,2.203,2.235];
  alpha = alpha_curve(q);

  % Multiply reference loss by node distances
  path_loss = -1*(L_0 + 10*log10(d^alpha));

  % Approximate diffraction phase losses for distances d_hor < d < dist_dif
  d_hor = 3.571*sqrt(4/3)*(sqrt(h1)+sqrt(h2));  % Calculate radio horizon distance
  dist_dif = d_hor.*1.05;                       % Maximum distance for diffraction
  loss_dif = d - d_hor;                         % Path distance after radio horizon
  loss_dif = loss_dif.*(loss_dif>0);            % Clamp path distance to range 0...Inf
  loss_dif = loss_dif.*(loss_dif<dist_dif);     % Clamp to range d < dist_dif
  loss_dif.*-6.7;                               % Diffraction phase loss of 6.7 dB per km
  
  % Approximate scattering phase losses for distances d > dist_dif
  loss_sca = d - d_hor - dist_dif; % Path distance after diffraction
  loss_sca = loss_sca.*(loss_sca>0);            % Clamp path distance to range 0...Inf
  loss_sca.*-0.5;                               % Scattering phase loss of 0.5 dB per km

  % Sum diffraction and scattering phases to path loss
  loss_its = -1* path_loss + loss_dif + loss_sca;
  loss_its(~isfinite(loss_its)) = 0;
endfunction