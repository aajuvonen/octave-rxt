disp("Exemplary GPS jamming calculations")
disp("Transceivers simulating GPS receivers and satellites")
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
L_sf_std__dB = 6;                       # [dB]   Path loss variation standard deviation
L_sf__dB = L_sf_std__dB * norm_inv(q);  # [dB]   Path loss variation for the corresponding time availability
calc_k_factor;                          # Calculate Earth effective radius factor K

## Receiver parameters simulating aeronautical transceivers
f__MHz = 1575;                          # [MHz]  Transceiver frequency
B__Hz = 1.023e6;                        # [Hz]   Transceiver bandwidth
r_data__bps = 50;                       # [b/s]  Data rate
N_F__dB = 10;                           # [dB]   Transceiver noise figure
SNR_req__dB = 10;                       # [dB]   Transceiver signal-to-noise ratio requirement
calc_rx_params;                         # Calculate receiver parameters

## Node 1 is a ground based GPS receiver
## Node 2 is a GPS satellite
## Node 3 is a ground based attacker
## Node 4 is a backend server

## Node 3D-coordinates in kilometers
node_xyz = [rand*10, rand*10, 0.1];                # Ground based GPS receiver
node_xyz = [node_xyz; rand*10, rand*10, 20180];  # GPS satellite, almost directly above the receiver
node_xyz = [node_xyz; node_xyz(1,1,1) + rand*2, node_xyz(1,2,1) + rand*2, 0.005];  # Ground based attacker

## Number of transceivers
node_count = rows(node_xyz);

## Node EIRP [W]
node_tx_pwr(:,1) = [0, 20, 20];

## Node transmittance status [bool]
node_tx_pwr(:,2) = [0, 1, 1];

## The GPS satellite has an antenna gain of about 14 dB, so it's added to node 2 EIRP
node_tx_pwr(2,1) *= db2num(15);

calc_node_path_loss_fsl;                # Calculate path losses using parametric variant of ITU-R P.525-4 spreading loss model
calc_node_rx_pwr;                       # Calculate node received powers

## The GPS C-signal provides processing gain relative to its chiprate and bitrate
G_pro__dB = 10*log10(B__Hz / r_data__bps);
node_rx_pwr += G_pro__dB;               # Add processing gain to node received powers

calc_node_cnr;                          # Calculate node carrier-to-noise ratios
calc_node_jsr(3);                       # Calculate node jamming-to-signal ratios

draw_graph_node_link;                   # Draw graph for node links
draw_graph_node_jsr;                    # Draw graph for jamming-to-signal ratio


###################
## LOGICAL LAYER ##
###################

## Logical node coordinates
node_xyz = [node_xyz; node_xyz(1,1,1), node_xyz(1,2,1)+10, 0];  # Backend server using GPS time

## Create a single node graph as an additional logical component
graph_node_logical = 0;

## Create combined graph with the physical component and the logical components
graph_node_combined = edit_graph_mash(graph_node_link, graph_node_logical);

## Connect physical node 1 to logical node 4, which connects the ground GPS node to its backend server
graph_node_combined(1, 4) = 1;
graph_node_combined(4, 1) = 1;

## Number of transceivers
node_count = rows(graph_node_combined);

## Plot graphs
plot_graph(graph_node_link, graph_node_combined);