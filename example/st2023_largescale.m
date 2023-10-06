disp("Aeronautical interference calculations - large scale")
disp("Transceivers simulating aeronautical voice radios")
disp("Sotatieteiden päivät 2023 - 12.10.2023")
disp("   Artturi Juvonen 2023")
disp("   artturi@juvonen.eu")
disp("")

## Disable outputs
hints = false;

## Receiver parameters simulating aeronautical transceivers
f__MHz = 100;                            # [MHz]  Transceiver frequency
B__Hz = 25000;                           # [Hz]   Transceiver bandwidth
N_F__dB = 10;                            # [dB]   Transceiver noise figure
SNR_req__dB = 10;                        # [dB]   Transceiver signal-to-noise ratio requirement
calc_rx_params;                          # Calculate receiver parameters

## Number of transceivers
node_count = 500;

## Node 3D-coordinates in kilometers
node_xyz = [rand*500,rand*500,rand];

## Node EIRP [W], the first node is the jammer
node_tx_pwr = [50, 1];

for i = 1:(node_count - 1)
  node_xyz = [node_xyz; rand*500,rand*500,rand*10];
  node_tx_pwr = [node_tx_pwr; 15, 1];
endfor

## Radio propagation calculations
calc_node_path_loss_fsl;                 # Calculate path losses using parametric variant of ITU-R P.525-4 spreading loss model
calc_node_rx_pwr;                        # Calculate node received powers
calc_node_cnr;                           # Calculate node carrier-to-noise ratios
calc_node_jsr;                           # Calculate node jamming-to-signal ratios

## Graph drawing
draw_graph_node_jsr;                     # Draw graph for jamming-to-signal ratio

## Find node degrees
find_degrees(graph_node_jsr);

## Draw a logical graph from strongly connected components
draw_graph_node_logical(graph_node_jsr);

## Plot graphs
plot_graph(graph_node_jsr, graph_node_logical);