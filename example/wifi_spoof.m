disp("Exemplary Wi-Fi hotspot deauthentication simulation")
disp("Transceivers simulating 802.11n Wi-Fi")
disp("   Artturi Juvonen 2023")
disp("   artturi@juvonen.eu")
disp("")

####################
## PHYSICAL LAYER ##
####################

## Ambient parameters
T_0 = 270;                               # [K]    Ambient temperature
q = 50;                                  # [%]    Channel time availability
L_sf_std__dB = 9;                        # [dB]   Path loss variation standard deviation
L_sf__dB = L_sf_std__dB * norm_inv(q);   # [dB]   Path loss variation for the corresponding time availability

## Calculate OFDM processing gain for 802.11n PHY MCS7
n_sc = 64;                               # num.   Number of OFDM sub channels
n_osc = 52;                              # num.   Number of occupied OFDM sub channels
r_code = 5/6;                            # num.   Code rate for 64QAM
r_sym__b = log2(64) * n_osc;             # [b]    Gross bits per 64QAM symbol
r_data__b = r_code * r_sym__b;           # [b]    Data bits per symbol
t_s__s = 4e-6;                           # [s]    Symbol duration (4 ms)
t_gi__s = 8e-7;                          # [s]    Guard interval (800 ns)
t_u__s = t_s__s - t_gi__s;               # [s]    Utilized symbol duration
r_ofdm__bps = r_data__b * (1 / t_s__s);  # [b/s]  Data rate

## Receiver parameters simulating 802.11n Wi-Fi
f__MHz = 2437;                           # [MHz]  Transceiver frequency
B__Hz = 1 / t_u__s * n_sc;               # [Hz]   Transceiver bandwidth
B_ofdm__Hz = B__Hz * (n_osc / n_sc);     # [Hz]   OFDM occupied bandwidth
N_F__dB = 8;                             # [dB]   Transceiver noise figure
SNR_req__dB = 25;                        # [dB]   Transceiver signal-to-noise ratio requirement
calc_rx_params;                          # Calculate receiver parameters

## Node physical layer 3D-coordinates in meters
node_xyz = [2+rand*5,2+rand*5,1+rand*2; 2+rand*5,2+rand*5,1+rand*2; 2+rand*5,2+rand*5,1+rand*2];

## Attacker 3D-coordinates in meters
node_xyz = [node_xyz; 5+rand*5,5+rand*5,1+rand*2; 5+rand*5,5+rand*5,1+rand*2];

## Number of transceivers
node_count = rows(node_xyz);

## Node EIRP [W] (20 dBm for Wi-Fi, 1 W for attackers)
node_tx_pwr(:,1) = [dbm2watt(20); dbm2watt(20); dbm2watt(20); 1; 1];

## Node transmittance status [bool]
node_tx_pwr(:,2) = ones(1, rows(node_tx_pwr));

node_xyz = node_xyz / 1000;
calc_node_path_loss_fsl(3);              # Calculate path losses using free space loss with a loss exponent alpha = 3
node_xyz = node_xyz * 1000;

calc_node_rx_pwr;                        # Calculate node received powers

## Node 5 (attacker 2) needs to receive only 4 (attacker 1)
node_rx_pwr(1:3,5) = -Inf;               # Discard connections other than those connected to node 4 (attacker 1)

## Only node 1 (hotstpot) needs to receive node 5 (attacker 2)
node_rx_pwr(5,2:end) = -Inf;

calc_node_cnr;                           # Calculate node carrier-to-noise ratios
draw_graph_node_link;                    # Draw graph for node links


###################
## LOGICAL LAYER ##
###################

node_xyz_orig = node_xyz;                # Copy node_xyz

## Amount of x-offset in logical component drawing
x_offset_log = (ceil(max(max(node_xyz))) / 10) * 10;

## Create a single node graph as an additional logical component
graph_node_logical = 0;
x_offset_log2 = [1:rows(graph_node_logical)];
x_offset_log2 = x_offset_log2 .* x_offset_log ./ 10;
node_xyz = [node_xyz_orig; x_offset_log, 5 + rand * 5, 0];
node_xyz(rows(node_xyz_orig) + 1:end,1,1) += x_offset_log2';
clear x_offset_log x_offset_log2

## Create combined graph with the physical component and the logical components
graph_node_combined = edit_graph_mash(graph_node_link, graph_node_logical);

## The physical node 1 represents a hotspot
## Connect physical node 1 to logical node 6, which connects the router to the server
graph_node_combined(rows(graph_node_link) + 1, 1) = 1;
graph_node_combined(1, rows(graph_node_link) + 1) = 1;

## Number of transceivers
node_count = rows(graph_node_combined);

## Plot graphs
plot_graph(graph_node_link, graph_node_combined);