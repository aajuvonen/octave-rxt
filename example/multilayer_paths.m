disp("Exemplary multilayer graphs")
disp("   Artturi Juvonen 2023")
disp("   artturi@juvonen.eu")
disp("")

## Ambient parameters
T_0 = 270;                              # [K]    Ambient temperature
QNH = 961;                              # [hPa]  Atmospheric pressure
q = 50;                                 # [%]    Channel time availability
L_sf_std__dB = 9;                       # [dB]   Path loss variation standard deviation
L_sf__dB = L_sf_std__dB * norm_inv(q);  # [dB]   Path loss variation for the corresponding time availability
calc_k_factor;                          # Calculate Earth effective radius factor K

## Receiver parameters simulating TETRA
f__MHz = 400;                           # [MHz]  Transceiver frequency
B__Hz = 25e3;                           # [Hz]   Transceiver bandwidth
N_F__dB = 10;                           # [dB]   Transceiver noise figure
SNR_req__dB = 15;                       # [dB]   Transceiver signal-to-noise ratio requirement
calc_rx_params;                         # Calculate receiver parameters

## Node 3D-coordinates
node_xyz = [20.194,14.617,0.002;12.872,32.761,0.010;37.279,19.865,0.006;24.941,21.819,0.005;22.575,32.132,0.001;11.233,27.961,0.010;24.818,17.711,0.010;25.788,27.591,0.002;21.888,27.870,0.002;13.139,17.800,0.007;13.135,37.876,0.004;23.435,36.312,0.003;13.962,21.043,0.009;31.935,12.145,0.009;27.045,31.655,0.008;12.707,22.606,0.008;16.360,21.629,0.008;31.502,17.950,0.007;30.289,39.787,0.005;29.274,27.727,0.009];
% node_xyz = [61.556,53.945,0.001;66.410,53.744,0.005;43.017,94.629,0.008;18.223,82.636,0.002;73.556,32.049,0.003;23.531,21.165,0.005;96.940,10.892,0.004;88.237,97.749,0.004;12.046,50.171,0.010;33.356,88.881,0.008;80.452,16.080,0.008;77.427,89.386,0.008;10.562,50.680,0.002;46.283,85.974,0.003;64.035,27.566,0.005;95.590,61.273,0.003;12.511,50.124,0.005;23.594,43.101,0.003;16.671,42.263,0.007;58.568,59.708,0.001];

## Number of transceivers
node_count = rows(node_xyz);

## Node EIRP [W]
node_tx_pwr(:,1) = [25;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1];

## Node transmittance status [bool]
node_tx_pwr(:,2) = ones(1, rows(node_tx_pwr));

calc_node_path_loss_hata_mod(1, 0.5);   # Calculate path losses using modified Hata model
calc_node_rx_pwr;                       # Calculate node received powers
calc_node_cnr;                          # Calculate node carrier-to-noise ratios

draw_graph_node_link;                   # Draw graph for node links

if(graphtools) disp(" * Call 'find_cliques(graph_node_link)' to find strongly connected components") endif
if(graphtools) disp(" * Call 'find_degrees(graph_node_link)' to find node degrees, indegrees and outdegrees") endif