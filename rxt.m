% Ambient parameters
global c; c = 299792458;          % [m/s]  Speed of light
global k; k = 1.38064852*10^-23;  % [J/K]  Bolzmann's constant
global T_0; T_0 = 290;            % [K]    Ambient temperature

function retval = num2db(val)     % Convert a linear number to decibels
  retval = 10*log10(val);         % Input: numeric
endfunction                       % Output: decibel [dB]

function retval = db2num(val)     % Convert desibels to a linear number
  retval = 10^(val/10);           % Input: decibel [dB]
endfunction                       % Output: numeric

function retval = watt2dbm(val)   % Convert Watts [W] to decibelmilliwatts [dBm]
  retval = 30 + num2db(val);      % Input: Watt [W]
endfunction                       % Output: decibelmilliwatt [dBm]

% Transceiver parameters #1
f = 100;                          % [MHz]  Transceiver frequency
lambda = c/(f*10^6);              % [m]    Transceiver wave length
B = 25000;                        % [Hz]   Transceiver bandwidth
N_F = 10;                         % [dB]   Transceiver noise figure
global SNR_req; SNR_req = 10;     % [dB]   Transceiver signal-to-noise ratio requirement
N_ktb = k*T_0*B;                  % [W/Hz] Transceiver thermal noise
N_0 = watt2dbm(N_ktb);            % [dBm]  Transceiver thermal noise in decibelmilliwatts

% Channel parameters
r_0 = 1000;                       % [m]    Path loss reference distance
global alpha; alpha = 2;          % num.   Path loss exponent
L_ref = ((4*pi*r_0)/lambda)^2;    % num.   Path loss in reference distance
global L_0; L_0 = num2db(L_ref);  % [dB]   Path loss in reference distance in decibels
L_sf = 6;                         % [dB]   Path loss variation standard deviation
L_sf_p = L_sf*1.644853627;        % [dB]   Path loss variation for 95% confidence


% Transceiver parameters #2
global N_tot; N_tot = N_0 + N_F + L_sf_p; % [dBm]  Transceiver noise floor
global S_min; S_min = N_tot + SNR_req;    % [dBm]  Transceiver detection threshold
L_int = 0;                        % [dB]   Transceiver cumulative internal losses
G_pro = 0;                        % [dB]   Transceiver processing gain
G_ant = 0;                        % [dB]   Transceiver antenna gain

% Simulation parameters
global node_xyz;                  % [km]   Node relative x, y, and z coordinates
global node_dist;                 % [km]   Node absolute distances
global node_tx_pwr;               % [W]    Node transmitted power
global node_rx_pwr;               % [dBm]  Node received power
global node_cnr;                  % [dB]   Node carrier-to-noise ratio
global node_jsr;                  % [dB]   Node jamming-to-signal ratio
global node_count;

% Node 3D-coordinates
node_xyz = [368.31,208.33,0.14;306.91,238.32,1.14;289.31,243.26,3.16;79.43,70.3,9.54;427.86,411.94,4.1;404.48,260.81,2.06;204.9,336.15,6.58;143.87,358.15,6.94;54.39,360.22,2.58;139.9,297.57,0.52;385.62,70.96,10.48;192.95,77.71,3.02;227.28,140.75,9.26;397.31,433.21,1.2;259.93,383.01,9.34;327.25,407.21,3.94;223.22,208.32,9.68;168.63,376.82,6.58;99.95,401.07,1.34;174.17,82.22,7.54;398.77,390.32,10.22;408.8,211.88,2.76;283.09,353.25,8.04;417.55,348.61,9.08;428.24,212.94,8.02;237.83,405.47,3.4;113.95,101.15,10.28;414.01,428.2,10.3;314.99,295.82,2.14;93.11,409.86,7.74;349.64,295.1,2.42;104.33,146.04,6.52;163.26,130.89,1.52;110.91,314.08,4.1;406.21,326.87,2.86;56.61,85.55,8.54;269.2,174.11,0.66;446.42,394.55,3.58;307.47,254.65,1.1;336.68,215.87,3.82;250.1,386.84,5.88;145.72,348.9,3.22;326.94,380.85,5.52;326.07,402.31,10.04;219.53,333.48,1.96;253.71,385.76,5.9;226.39,205.02,9.26;394.09,372.45,7.18;99.7,303.65,5.94;235.45,102.79,7.64];
node_count = length(node_xyz);    % num.   Number of transceivers

% Node transceiver parameters 
node_tx_pwr = [100;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15];

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

% Calculate node received powers using free space loss ITU-R P.525-4 with parametric path loss exponent
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

% Plot node jamfree links
function plot_node_links
  disp("Plotting node jamfree links...")
  tic
  global node_xyz;
  global node_count;
  global graph_node_link;
  global nodes;
  global edges;
  global labels;

  nodes = node_xyz (:,1:2);                             % Get node xy list
  edges = getEdges(graph_node_link,'adjacency')(:,1:2); % Get edge list
  labels = [1:node_count]';                             % Get node numeric labels
  plot_worker;                                          % Call plot worker function
  toc
endfunction

% Plot node links under jamming
function plot_node_jsr
  disp("Plotting node links under jamming...")
  tic
  global node_xyz;
  global node_count;
  global graph_node_jsr;
  global nodes;
  global edges;
  global labels;

  nodes = node_xyz (:,1:2);                             % Get node xy list
  edges = getEdges(graph_node_jsr,'adjacency')(:,1:2);  % Get edge list
  labels = [1:node_count]';                             % Get node numeric labels
  plot_worker;                                          % Call plot worker function
  toc
endfunction

% Draw graphs with octave-matgeom and octave-networks-toolbox
function plot_worker
  global nodes;
  global edges;
  global labels;

  close all;                                            % Close all plots
  axis([0 500 0 500],"equal");                          % Set plot axes to 0...500
  pkg load matgeom;                                     % Load matgeom
  drawDirectedEdges(nodes,edges);                       % Draw directed edges
  plot_labels = drawNodeLabels(nodes,labels);           % Draw node labels
  set(plot_labels,"fontsize",12);                       % Resize node label font
  plot(nodes(:,1),nodes(:,2),".k","markersize",8);      % Draw nodes
  pkg unload matgeom;                                   % Unload matgeom
endfunction