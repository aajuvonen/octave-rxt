disp("Exemplary multilayer graphs")
disp("   Artturi Juvonen 2023")
disp("   artturi@juvonen.eu")
disp("")

####################
## PHYSICAL LAYER ##
####################

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
node_xyz = [20.194,14.617,0.03;12.872,32.761,0.010;37.279,19.865,0.006;24.941,21.819,0.005;22.575,32.132,0.001;11.233,27.961,0.010;24.818,17.711,0.010;25.788,27.591,0.002;21.888,27.870,0.002;13.139,17.800,0.007;13.135,37.876,0.004;23.435,36.312,0.003;13.962,21.043,0.009;31.935,12.145,0.009;27.045,31.655,0.008;12.707,22.606,0.008;16.360,21.629,0.008;31.502,17.950,0.007;30.289,39.787,0.005;29.274,27.727,0.009];

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


###################
## LOGICAL LAYER ##
###################

## Initialize an empty graph for logical connections and find physical layer's strongly connected components
graph_nodes_log = zeros(node_count, node_count);
find_cliques(graph_node_link);

## Loop through node cliques and populate the logical graph accordingly
for i = 1:node_clique_count
  for j = eval(['node_clique_' num2str(i)])
    graph_nodes_log(j, eval(['node_clique_' num2str(i)])) = 1;
  endfor
endfor

plot_log_offset__km = 30;               # Horizontal offset in logical layer plotting 

## Append physical layer node_xyz with an xy-offset clone set of nodes
node_xyz = [node_xyz; [node_xyz(:,1,1) + plot_log_offset__km, node_xyz(:,2,1), zeros(rows(node_xyz),1)]];

## Offset the node 1's logical connection array by node count
graph_nodes_log = edit_graph_mash(zeros(node_count, node_count), graph_nodes_log);

node_count *= 2;                        # Double the node count in order to draw the physical and logical layers to the same plot
plot_graph(graph_node_link)             # Plot physical layer graph

## Plot logical layer graph and remove axis
gplot(graph_nodes_log, [node_xyz(:,1,1) node_xyz(:,2,1)], "m");
axis("auto")
axis("off")