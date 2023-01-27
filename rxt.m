% Ambient parameters
c = 299792458;                  % [m/s]  Speed of light
k = 1.38064852*10^-23;          % [J/K]  Bolzmann's constant
T_0 = 290;                      % [K]    Ambient temperature

function retval = num2db(val)   % Convert a linear number to decibels
  retval = 10*log10(val);       % Input: numeric
endfunction                     % Output: decibel [dB]

function retval = db2num(val)   % Convert desibels to a linear number
  retval = 10^(val/10);         % Input: decibel [dB]
endfunction                     % Output: numeric

function retval = watt2dbm(val) % Convert Watts [W] to decibelmilliwatts [dBm]
  retval = 30 + num2db(val);    % Input: Watt [W]
endfunction                     % Output: decibelmilliwatt [dBm]

% Transceiver parameters #1
f = 100;                        % [MHz]  Transceiver frequency
lambda = c/(f*10^6);            % [m]    Transceiver wave length
B = 25000;                      % [Hz]   Transceiver bandwidth
N_F = 10;                       % [dB]   Transceiver noise figure
global SNR_req;                 % [dB]   Transceiver signal-to-noise ratio requirement
SNR_req = 10;
N_ktb = k*T_0*B;                % [W/Hz] Transceiver thermal noise
N_0 = watt2dbm(N_ktb);          % [dBm]  Transceiver thermal noise in decibelmilliwatts

% Channel parameters
r_0 = 1000;                     % [m]    Path loss reference distance
global alpha;                   % num.   Path loss exponent
alpha = 2;
L_ref = ((4*pi*r_0)/lambda)^2;  % num.   Path loss in reference distance
global L_0;                     % [dB]   Path loss in reference distance in decibels
L_0 = num2db(L_ref);
L_sf = 6;                       % [dB]   Path loss variation standard deviation
global L_sf_p;                  % [dB]   Path loss variation for 95% confidence
L_sf_p = L_sf*1.644853627;

% Transceiver parameters #2
global N_tot;                   % [dBm]  Transceiver noise floor
N_tot = N_0 + N_F + L_sf_p;
global S_min;                   % [dBm]  Transceiver detection threshold
S_min = N_tot + SNR_req;
L_int = 0;                      % [dB]   Transceiver cumulative internal losses
G_pro = 0;                      % [dB]   Transceiver processing gain
G_ant = 0;                      % [dB]   Transceiver antenna gain

% Simulation parameters
global node_xyz;                % [km]   Node relative x, y, and z coordinates
global node_dist;               % [km]   Node absolute distances
global node_tx_pwr;             % [W]    Node transmitted power
global node_rx_pwr;             % [dBm]  Node received power
global node_cnr;                % [dB]   Node carrier-to-noise ratio
global node_jsr;                % [dB]   Node jamming-to-signal ratio

% 30x, 3d nodes
%node_xyz = [385.62,70.96,10.00;306.91,238.32,4202.55;289.31,243.26,5480.51;79.43,70.30,6099.78;427.86,411.94,2900.30;404.48,260.81,7980.01;154.90,336.15,5444.78;143.87,358.15,2126.84;84.39,360.22,6425.41;139.90,297.57,574.49;368.31,208.33,931.15;192.95,77.71,7700.98;227.28,140.75,242.09;397.31,433.21,68.62;359.93,383.01,2358.52;347.25,407.21,2203.79;223.22,158.32,6469.10;168.63,376.82,849.74;99.95,401.07,6076.26;174.17,82.22,7512.76;398.77,390.32,181.29;408.80,211.88,4507.32;283.09,353.25,7193.26;417.55,348.61,134.66;428.24,212.94,2912.96;237.83,405.47,3856.77;113.95,101.15,7130.51;414.01,428.20,5438.20;314.99,295.82,6499.48;254.68,399.82,7550.49];

% 30x 2d nodes
%node_xyz = [385.62,70.96,0;306.91,238.32,0;289.31,243.26,0;79.43,70.30,0;427.86,411.94,0;404.48,260.81,0;154.90,336.15,0;143.87,358.15,0;84.39,360.22,0;139.90,297.57,0;368.31,208.33,0;192.95,77.71,0;227.28,140.75,0;397.31,433.21,0;359.93,383.01,0;347.25,407.21,0;223.22,158.32,0;168.63,376.82,0;99.95,401.07,0;174.17,82.22,0;398.77,390.32,0;408.80,211.88,0;283.09,353.25,0;417.55,348.61,0;428.24,212.94,0;237.83,405.47,0;113.95,101.15,0;414.01,428.20,0;314.99,295.82,0;254.68,399.82,0];

% 50x 3 nodes
node_xyz = [368.31,208.33,126.66;306.91,238.32,4202.55;289.31,243.26,5480.51;79.43,70.30,6099.78;427.86,411.94,2900.30;404.48,260.81,7980.01;204.90,336.15,5444.78;143.87,358.15,2126.84;54.39,360.22,6425.41;139.90,297.57,574.49;385.62,70.96,931.15;192.95,77.71,7700.98;227.28,140.75,242.09;397.31,433.21,68.62;259.93,383.01,2358.52;327.25,407.21,2203.79;223.22,208.32,6469.10;168.63,376.82,849.74;99.95,401.07,6076.26;174.17,82.22,7512.76;398.77,390.32,181.29;408.80,211.88,4507.32;283.09,353.25,7193.26;417.55,348.61,134.66;428.24,212.94,2912.96;237.83,405.47,3856.77;113.95,101.15,7130.51;414.01,428.20,5438.20;314.99,295.82,6499.48;93.11,409.86,3524.40;349.64,295.10,4262.07;104.33,146.04,5298.26;163.26,130.89,4943.16;110.91,314.08,3755.03;406.21,326.87,6927.89;56.61,85.55,5267.58;269.20,174.11,4933.30;446.42,394.55,7661.20;307.47,254.65,5225.17;336.68,215.87,618.20;250.10,386.84,2434.62;145.72,348.90,1387.73;326.94,380.85,780.17;326.07,402.31,7794.93;219.53,333.48,224.28;253.71,385.76,7947.47;226.39,205.02,7733.64;394.09,372.45,6290.33;99.70,303.65,5665.39;235.45,102.79,3286.27];

% node_xyz = node_xyz(1:20,:);
node_count = length(node_xyz);  % num.   Number of transceivers

% 30x nodes
node_tx_pwr = [100;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15];
% node_tx_pwr = node_tx_pwr(1:20,:);

% Calculate node distances using Arun Giridhar's method
% https://octave.discourse.group/t/technique-exchange-computing-distances-between-points/2939
function calc_node_dist
  global node_xyz;
  global node_dist;
  node_dist  = (node_xyz(:,1) - node_xyz(:,1)') .^ 2;
  node_dist += (node_xyz(:,2) - node_xyz(:,2)') .^ 2;
  node_dist += (node_xyz(:,3) - node_xyz(:,3)') .^ 2;
  node_dist = sqrt (node_dist);
endfunction

calc_node_dist;

% Calculate node received powers
function calc_node_rx_pwr
  global node_dist;
  global node_tx_pwr;
  global node_rx_pwr;
  global L_0;
  global alpha;
  node_rx_pwr = -1*(L_0 + 10*log10(node_dist.^alpha) - watt2dbm(node_tx_pwr));
endfunction
  
calc_node_rx_pwr;

% Calculate node carrier-to-noise ratios
function calc_node_cnr
  disp("Calculating node carrier-to-noise ratios...")
  tic
  global node_cnr;
  global node_rx_pwr;
  global N_tot;
  node_cnr = node_rx_pwr - N_tot;
  toc
endfunction

calc_node_cnr;

% Calculate node jamming-to-signal ratios
% Input: jammer node index (optional)
function calc_node_jsr(jammer)
  disp("Calculating node jamming-to-signal ratios...")
  tic
  global node_tx_pwr;
  global node_rx_pwr;
  global node_jsr;
  global S_min
  if isempty(jammer)
    jammer = 1;
  end
  node_jsr = node_rx_pwr - node_rx_pwr(jammer,:);
  node_jsr (jammer,:) = -1*S_min + node_rx_pwr (jammer,:);
  toc
endfunction

calc_node_jsr(1);

% Graph node links
global graph_node_link;

function draw_graph_node_link
  disp("Graphing node links...")
  tic
  global node_rx_pwr;
  global graph_node_link;
  global S_min;
  graph_node_link = node_rx_pwr;
  graph_node_link(~isfinite(graph_node_link)) = -Inf;
  graph_node_link = graph_node_link > S_min;
  toc
endfunction

draw_graph_node_link;

% Graph jamming-to-signal ratio
global graph_node_jsr;

function draw_graph_node_jsr
  disp("Graphing jamming-to-signal ratio...")
  tic
  global node_jsr;
  global graph_node_jsr;
  global SNR_req;
  graph_node_jsr = node_jsr;
  graph_node_jsr(~isfinite(graph_node_jsr)) = 0;
  graph_node_jsr = graph_node_jsr > SNR_req;
  toc
endfunction

draw_graph_node_jsr;