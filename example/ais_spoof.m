disp("Exemplary AIS jamming calculations")
disp("Transceivers simulating maritime voice radios")
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
f__MHz = 150;                           # [MHz]  Transceiver frequency
B__Hz = 25000;                          # [Hz]   Transceiver bandwidth
N_F__dB = 10;                           # [dB]   Transceiver noise figure
SNR_req__dB = 10;                       # [dB]   Transceiver signal-to-noise ratio requirement
calc_rx_params;                         # Calculate receiver parameters

## Node #1 is an AIS ground node
## Node #2 is a maritime vessel
## Node #3 is ground-based attacker, equipped with a software-defined radio
## Node #4 is an AIS backend server

## Node 3D-coordinates in kilometers
node_xyz = [node_xyz; rand*25, rand*25, rand*0.1];  # Ground AIS node
node_xyz = [node_xyz; rand*50, rand*50, 0.003];     # maritime vessel
node_xyz = [node_xyz; node_xyz(1,1,1)+rand*10, node_xyz(1,2,1)+rand*10, 0.03];  # Ground-based attacker

## Number of transceivers
node_count = rows(node_xyz);

## Node EIRP [W]
node_tx_pwr(:,1) = [25; 25; 25];

## Node transmittance status [bool]
node_tx_pwr(:,2) = ones(1, rows(node_tx_pwr));

calc_node_path_loss_overhor;            # Calculate path loss using itaero
calc_node_rx_pwr;                       # Calculate node received powers

## Node 3 (attacker) doesn't need to receive anyone
node_rx_pwr(1:2,3) = -Inf;              # Discard inbound arcs to node 3

calc_node_cnr;                          # Calculate node carrier-to-noise ratios

## If CNR exceeds 12 dB, add FM processing gain
node_cnr(~isfinite(node_cnr)) = -Inf;   # Replace infinite CNRs with negative infinities

## Calculate FM processing gain, and if CNR exceeds 12 dB, add it to CNR
beeta_fm = 0.5;                         # AIS FM modulation index
node_cnr(node_cnr > 12) += 4.77 + 20 * log10(beeta_fm);

draw_graph_node_link;                   # Draw graph for node links


###################
## LOGICAL LAYER ##
###################

## Logical node coordinates
node_xyz = [node_xyz; node_xyz(1,1,1), node_xyz(1,2,1)-20, 0];  # AIS backend server

## Create a single node graph as an additional logical component
graph_node_logical = 0;

## Create combined graph with the physical component and the logical components
graph_node_combined = edit_graph_mash(graph_node_link, graph_node_logical);

## Connect physical node 1 to logical node 4, which connects the ground AIS node to its backend server
graph_node_combined(1, 4) = 1;
graph_node_combined(4, 1) = 1;

## Number of transceivers
node_count = rows(graph_node_combined);

## Plot graphs
plot_graph(graph_node_link, graph_node_combined);