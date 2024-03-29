disp("Exemplary aeronautical interference calculations")
disp("Transceivers simulating aeronautical voice radios")
disp("   Artturi Juvonen 2023")
disp("   artturi@juvonen.eu")
disp("")

## Ambient parameters
T_0 = 270;                              # [K]    Ambient temperature
QNH = 961;                              # [hPa]  Atmospheric pressure
q = 50;                                 # [%]    Channel time availability
L_sf_std__dB = 6;                       # [dB]   Path loss variation standard deviation
L_sf__dB = L_sf_std__dB * norm_inv(q);  # [dB]   Path loss variation for the corresponding time availability
calc_k_factor;                          # Calculate Earth effective radius factor K

## Receiver parameters simulating aeronautical transceivers
f__MHz = 100;                           # [MHz]  Transceiver frequency
B__Hz = 25000;                          # [Hz]   Transceiver bandwidth
N_F__dB = 10;                           # [dB]   Transceiver noise figure
SNR_req__dB = 10;                       # [dB]   Transceiver signal-to-noise ratio requirement
calc_rx_params;                         # Calculate receiver parameters

## UNFINISHED PARAMETERS BEGIN
## Missing calculation routines
## Missing antenna files and directivity data
L_int__dB = 0;                          # [dB]   Transceiver cumulative internal losses
G_pro__dB = 0;                          # [dB]   Transceiver processing gain
G_ant__dB = 0;                          # [dB]   Transceiver antenna gain
## UNFINISHED PARAMETERS END

## Node 3D-coordinates in kilometers
node_xyz = [368.31,208.33,0.14;306.91,238.32,1.14;289.31,243.26,3.16;79.43,70.3,9.54;427.86,411.94,4.1;404.48,260.81,2.06;204.9,336.15,6.58;143.87,358.15,6.94;54.39,360.22,2.58;139.9,297.57,0.52;385.62,70.96,10.48;192.95,77.71,3.02;227.28,140.75,9.26;397.31,433.21,1.2;259.93,383.01,9.34;327.25,407.21,3.94;223.22,208.32,9.68;168.63,376.82,6.58;99.95,401.07,1.34;174.17,82.22,7.54;398.77,390.32,10.22;408.8,211.88,2.76;283.09,353.25,8.04;417.55,348.61,9.08;428.24,212.94,8.02;237.83,405.47,3.4;113.95,101.15,10.28;414.01,428.2,10.3;314.99,295.82,2.14;93.11,409.86,7.74;349.64,295.1,2.42;104.33,146.04,6.52;163.26,130.89,1.52;110.91,314.08,4.1;406.21,326.87,2.86;56.61,85.55,8.54;269.2,174.11,0.66;446.42,394.55,3.58;307.47,254.65,1.1;336.68,215.87,3.82;250.1,386.84,5.88;145.72,348.9,3.22;326.94,380.85,5.52;326.07,402.31,10.04;219.53,333.48,1.96;253.71,385.76,5.9;226.39,205.02,9.26;394.09,372.45,7.18;99.7,303.65,5.94;235.45,102.79,7.64];

## Number of transceivers
node_count = rows(node_xyz);

## Node EIRP [W]
node_tx_pwr(:,1) = [100;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15];

## Node transmittance status [bool]
node_tx_pwr(:,2) = [1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,0,1,1,0,0,1,1,0,1,1,1,1,1,1,0,0,1,1,0,1,0,1,1,1,0,1,1,0,1,1,1,1,1];
# node_tx_pwr(:,2) = ones(1, rows(node_tx_pwr));

% calc_node_path_loss_fsl;               # Calculate path losses using parametric variant of ITU-R P.525-4 spreading loss model
calc_node_path_loss_itaero;             # Calculate path losses using itaero model
calc_node_rx_pwr;                       # Calculate node received powers
calc_node_cnr;                          # Calculate node carrier-to-noise ratios
calc_node_jsr(1);                       # Calculate node jamming-to-signal ratios

draw_graph_node_link;                   # Draw graph for node links
draw_graph_node_jsr;                    # Draw graph for jamming-to-signal ratio

if(graphtools) disp(" * Call 'find_cliques(graph_node_jsr)' to find strongly connected components") endif
if(graphtools) disp(" * Call 'find_degrees(graph_node_jsr)' to find node degrees, indegrees and outdegrees") endif

plot_graph(graph_node_jsr);             # Plot JSR graph