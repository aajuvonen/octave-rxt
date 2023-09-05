disp("Exemplary ACARS jamming calculations")
disp("Transceivers simulating aeronautical voice radios")
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
f__MHz = 125;                           # [MHz]  Transceiver frequency
B__Hz = 25000;                          # [Hz]   Transceiver bandwidth
N_F__dB = 10;                           # [dB]   Transceiver noise figure
SNR_req__dB = 10;                       # [dB]   Transceiver signal-to-noise ratio requirement
calc_rx_params;                         # Calculate receiver parameters

## Node #1 is a ground ACARS node
## Node #2 is a ground-based attacker, equipped with a software-defined radio
## Node #3 is an ACARS backend server
## Node #4 is an attacker's backend server

## Node 3D-coordinates in kilometers
node_xyz = [node_xyz; rand*100,rand*100,rand*0.1];  # Ground ACARS node
node_xyz = [node_xyz; node_xyz(1,1,1)+rand*10, node_xyz(1,2,1)+rand*10, rand*0.1];  # Ground-based attacker

## Number of transceivers
node_count = rows(node_xyz);

## Node EIRP [W]
node_tx_pwr(:,1) = [15; 15];

## Node transmittance status [bool]
node_tx_pwr(:,2) = ones(1, rows(node_tx_pwr));

calc_node_path_loss_itaero;             # Calculate path loss using itaero
calc_node_rx_pwr;                       # Calculate node received powers
calc_node_cnr;                          # Calculate node carrier-to-noise ratios
draw_graph_node_link;                   # Draw graph for node links


###################
## LOGICAL LAYER ##
###################

## Logical node coordinates
node_xyz = [node_xyz; node_xyz(1,1,1), node_xyz(1,2,1)-20, 0];  # ACARS backend server
node_xyz = [node_xyz; node_xyz(2,1,1), node_xyz(2,2,1)-20, 0];  # attacker's backend server

graph_node_logical = [0 0; 0 0];        # The logical component has two backend servers with no links

## Create combined graph with the physical component and the logical components
graph_node_combined = edit_graph_mash(graph_node_link, graph_node_logical);

## Connect physical node 1 to logical node 3, which connects the ground ACARS node to its backend server
graph_node_combined(1, 3) = 1;
graph_node_combined(3, 1) = 1;

## Number of transceivers
node_count = rows(graph_node_combined);

## Plot graphs
plot_graph(graph_node_link, graph_node_combined);