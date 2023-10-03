disp("Aeronautical interference calculations")
disp("Transceivers simulating aeronautical voice radios")
disp("Sotatieteiden päivät 2023 - 12.10.2023")
disp("   Artturi Juvonen 2023")
disp("   artturi@juvonen.eu")
disp("")

## Disable outputs
counter = false;
hints = false;

## Receiver parameters simulating aeronautical transceivers
f__MHz = 100;                            # [MHz]  Transceiver frequency
B__Hz = 25000;                           # [Hz]   Transceiver bandwidth
N_F__dB = 10;                            # [dB]   Transceiver noise figure
SNR_req__dB = 10;                        # [dB]   Transceiver signal-to-noise ratio requirement
calc_rx_params;                          # Calculate receiver parameters

## Node 3D-coordinates in kilometers
node_xyz = [100+rand*20,10+rand*20,rand; 25+rand*100, 25+rand*100, rand*10; 25+rand*100, 25+rand*100, rand*10; 25+rand*100, 25+rand*100, rand*10; 25+rand*100, 25+rand*100, rand*10; 100+rand*100, 100+rand*100, rand*10; 100+rand*100, 100+rand*100, rand*10; 100+rand*100, 100+rand*100, rand*10; 100+rand*100, 100+rand*100, rand*10];

## Number of transceivers
node_count = rows(node_xyz);

## Node EIRP [W], the first node is the jammer, and the rest are aircraft
node_tx_pwr(:,1) = [50;15;15;15;15;15;15;15;15];

## Node transmittance status [bool]
node_tx_pwr(:,2) = ones(1, node_count);

## Radio propagation calculations
calc_node_path_loss_fsl;                 # Calculate path losses using parametric variant of ITU-R P.525-4 spreading loss model
calc_node_rx_pwr;                        # Calculate node received powers
calc_node_cnr;                           # Calculate node carrier-to-noise ratios
calc_node_jsr;                           # Calculate node jamming-to-signal ratios

## Graph drawing
draw_graph_node_link;                    # Draw graph for node links
draw_graph_node_jsr;                     # Draw graph for jamming-to-signal ratio

## Edit JSR-graph to separate blue and red components
graph_node_jsr(1,2:5) = 0;               # Ignore jammer for blue force
graph_blue = graph_node_link(2:5, 2:5);  # Blue force graph
graph_red = graph_node_jsr(6:9, 6:9);    # Red force graph
graph_node_jsr(2:end,2:end) = edit_graph_mash(graph_blue, graph_red);

## Find node degrees
find_degrees(graph_node_jsr);

## Draw a logical graph from strongly connected components
draw_graph_node_logical(graph_node_jsr);

## Calculate the 1st clique's nodes' mean distance
dist_mean = calc_node_dist_mean(node_clique_1);

## Calculate jamming ring distance to the 1st clique
calc_node_jam_ring(1,15,1,dist_mean,2,0.1);

## Plot graphs
plot_graph(graph_node_jsr, graph_node_logical);

## Plot jamming ring
subplot(1,2,1),plot_node_jam_ring