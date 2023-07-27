disp("Exemplary multilayer graphs")
disp("   Artturi Juvonen 2023")
disp("   artturi@juvonen.eu")
disp("")

## Receiver parameters simulating TETRA
f__MHz = 400;                           # [MHz]  Transceiver frequency
B__Hz = 25e3;                           # [Hz]   Transceiver bandwidth
N_F__dB = 10;                           # [dB]   Transceiver noise figure
SNR_req__dB = 15;                       # [dB]   Transceiver signal-to-noise ratio requirement
calc_rx_params;                         # Calculate receiver parameters

## Node 3D-coordinates
node_xyz = [20.194,14.617,0.002;12.872,32.761,0.010;37.279,19.865,0.006;24.941,21.819,0.005;22.575,32.132,0.001;11.233,27.961,0.010;24.818,17.711,0.010;25.788,27.591,0.002;21.888,27.870,0.002;13.139,17.800,0.007;13.135,37.876,0.004;23.435,36.312,0.003;13.962,21.043,0.009;31.935,12.145,0.009;27.045,31.655,0.008;12.707,22.606,0.008;16.360,21.629,0.008;31.502,17.950,0.007;30.289,39.787,0.005;29.274,27.727,0.009];

## Number of transceivers
node_count = length(node_xyz);

## Node EIRP [W]
node_tx_pwr(:,1) = [25;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1];

## Node transmittance status [bool]
node_tx_pwr(:,2) = ones(1, length(node_tx_pwr));

calc_node_path_loss_hata_mod;           # Calculate path losses using itaero model
calc_node_rx_pwr;                       # Calculate node received powers
calc_node_cnr;                          # Calculate node carrier-to-noise ratios

draw_graph_node_link;                   # Draw graph for node links

if(graphtools) disp(" * Call 'find_cliques(graph_node_link)' to find strongly connected components") endif
if(graphtools) disp(" * Call 'find_degrees(graph_node_link)' to find node degrees, indegrees and outdegrees") endif