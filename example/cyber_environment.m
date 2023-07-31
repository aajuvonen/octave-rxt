disp("Exemplary logically connected cyber environment")
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
node_xyz = [5+rand*10,15+rand*10,1+rand*2; 5+rand*10,15+rand*10,1+rand*2; 5+rand*10,15+rand*10,1+rand*2];

## Number of transceivers
node_count = rows(node_xyz);

## Node EIRP [W] (20 dBm for Wi-Fi)
node_tx_pwr(:,1) = [dbm2watt(20); dbm2watt(20); dbm2watt(20)];

## Node transmittance status [bool]
node_tx_pwr(:,2) = ones(1, rows(node_tx_pwr));

% calc_node_path_loss_p1238;               # Calculate path losses using modified Hata model

node_xyz = node_xyz / 1000;
calc_node_path_loss_fsl;               # Calculate path losses using modified Hata model
node_xyz = node_xyz * 1000;

calc_node_rx_pwr;                        # Calculate node received powers
calc_node_cnr;                           # Calculate node carrier-to-noise ratios
draw_graph_node_link;                    # Draw graph for node links


###################
## LOGICAL LAYER ##
###################

## Amount of x-offset in logical component drawing
x_offset_log = (ceil(max(max(node_xyz))) / 10) * 10;

## Clone physical nodes as a logical component
node_xyz_log = [node_xyz; node_xyz];
node_xyz_log(rows(node_xyz) + 1, 1, 1) += x_offset_log;
node_xyz_log((rows(node_xyz) + 1):end, 3, 1) = 0;

## Create a random tree graph
graph_cyber = edgeL2adj(canonicalNets(10, "tree", 3));
node_xyz_log = [node_xyz_log; x_offset_log * 2 + rand * 15, x_offset_log * 2 + rand * 15, 0; x_offset_log * 2 + rand * 15, x_offset_log * 2 + rand * 15, 0; x_offset_log * 2 + rand * 15, x_offset_log * 2 + rand * 15, 0; x_offset_log * 2 + rand * 15, x_offset_log * 2 + rand * 15, 0; x_offset_log * 2 + rand * 15, x_offset_log * 2 + rand * 15, 0; x_offset_log * 2 + rand * 15, x_offset_log * 2 + rand * 15, 0; x_offset_log * 2 + rand * 15, x_offset_log * 2 + rand * 15, 0; x_offset_log * 2 + rand * 15, x_offset_log * 2 + rand * 15, 0; x_offset_log * 2 + rand * 15, x_offset_log * 2 + rand * 15, 0; x_offset_log * 2 + rand * 15, x_offset_log * 2 + rand * 15, 0];
graph_combined = edit_graph_mash(edit_graph_mash(graph_node_link, ones(rows(node_xyz), rows(node_xyz))), graph_cyber);

## Number of transceivers
node_count = rows(graph_combined);

## Plot graphs
plot_graph(graph_node_link, graph_combined);