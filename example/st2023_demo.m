disp("Aeronautical interference calculations")
disp("Transceivers simulating aeronautical voice radios")
disp("Sotatieteiden päivät 2023 - 11.10.2023")
disp("   Artturi Juvonen 2023")
disp("   artturi@juvonen.eu")
disp("")

## Ambient parameters
T_0 = 270;                              # [K]    Ambient temperature
QNH = 961;                              # [hPa]  Atmospheric pressure
q = 50;                                 # [%]    Channel time availability
L_sf_std__dB = 6;                       # [dB]   Path loss variation standard deviation
L_sf__dB = L_sf_std__dB * norm_inv(q);  # [dB]   Path loss variation for the corresponding time availability

## Receiver parameters simulating aeronautical transceivers
f__MHz = 100;                           # [MHz]  Transceiver frequency
B__Hz = 25000;                          # [Hz]   Transceiver bandwidth
N_F__dB = 10;                           # [dB]   Transceiver noise figure
SNR_req__dB = 10;                       # [dB]   Transceiver signal-to-noise ratio requirement
calc_rx_params;                         # Calculate receiver parameters

## Node 3D-coordinates in kilometers
node_xyz = [118.31,28.33,0.14; 56.91,88.32,1.14; 86.68,85.87,3.82; 58.8,21.88,2.76; 48.24,62.94,8.02; 128.77,170.32,10.22; 167.55,198.61,9.08; 156.21,176.87,2.86; 144.09,222.45,7.18];

## Number of transceivers
node_count = rows(node_xyz);

## Node EIRP [W]
node_tx_pwr(:,1) = [50;15;15;15;15;15;15;15;15];

## Node transmittance status [bool]
node_tx_pwr(:,2) = ones(1, node_count);

calc_node_path_loss_fsl;                # Calculate path losses using parametric variant of ITU-R P.525-4 spreading loss model
calc_node_rx_pwr;                       # Calculate node received powers
calc_node_cnr;                          # Calculate node carrier-to-noise ratios
calc_node_jsr(1);                       # Calculate node jamming-to-signal ratios

draw_graph_node_link;                   # Draw graph for node links
draw_graph_node_jsr;                    # Draw graph for jamming-to-signal ratio

graph_node_jsr(1,2:5) = 0;             # Ignore jammer for blue force
graph_blue = graph_node_link(2:5,2:5);  # Blue force graph
graph_red = graph_node_jsr(6:9,6:9);    # Red force graph
graph_node_jsr(2:end,2:end) = edit_graph_mash(graph_blue, graph_red);

draw_graph_node_logical(graph_node_jsr);
plot_graph(graph_node_jsr, graph_node_logical);             # Plot JSR graph