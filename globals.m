settings

% Natual constants
global c;                         % [m/s]  Speed of light
global k_B;                       % [J/K]  Bolzmann's constant
global norm_inv;                  % Inverse of the standard normal cumulative distribution
global alpha_curve;               % Precalculated alphas

% Ambient parameters
global T_0;                       % [K]    Ambient temperature
global QNH;                       % [hPa]  Atmospheric pressure
global WVP;                       % [hPa]  Water vapour pressure
global RRI;                       % [N]    Radio refractivity index
global K;                         % num.   Earth effective radius factor
global q;                         % [%]    Channel time availability
global L_sf_std;                  % [dB]   Path loss variation standard deviation
global L_sf;                      % [dB]   Path loss variation for the corresponding time availability

% Receiver parameters
global f;                         % [MHz]  Transceiver frequency
global B;                         % [Hz]   Transceiver bandwidth
global N_F;                       % [dB]   Transceiver noise figure
global SNR_req;                   % [dB]   Transceiver signal-to-noise ratio requirement
global N_tot;                     % [dBm]  Transceiver noise floor
global S_min;                     % [dBm]  Transceiver detection threshold
global L_int;                     % [dB]   Transceiver cumulative internal losses
global G_pro;                     % [dB]   Transceiver processing gain
global G_ant;                     % [dB]   Transceiver antenna gain

% Simulation parameters
global node_xyz;                  % [km]   Node relative x, y, and z coordinates
global node_dist;                 % [km]   Node absolute distances in three dimensional space
global node_dist_alts;            % var.   Node absolute distances in three dimensional space [km] and altitudes [m]
global node_geodist_alts;         % var.   Node great circle path distances [km] and altitudes [m]
global node_d_hor;                % [km]   Node total radio horizon distances
global node_d_hor_single;         % [km]   Node radio horizon distances to spherical Earth
global node_path_loss;            % [dB]   Node path losses
global node_tx_pwr;               % [W]    Node transmitted power
global node_rx_pwr;               % [dBm]  Node received power
global node_cnr;                  % [dB]   Node carrier-to-noise ratio
global node_jsr;                  % [dB]   Node jamming-to-signal ratio
global node_count;                % num.   Node count
global node_link_capacity;        % [b/s]  Node link channel capacity

% Plotting variables
global nodes;                     % Graph node list
global edges;                     % Graph edge list
global labels;                    % Graph labels

% Generated graphs
global graph_node_link;           % Graph for node links
global graph_node_jsr;            % Graph for jamming-to-signal ratio