settings

## Natual constants
global c;                               # [m/s]  Speed of light
global k_B;                             # [J/K]  Bolzmann's constant
global norm_inv;                        # Inverse of the standard normal cumulative distribution

T_0 = 270;                              # [K]    Ambient temperature
QNH = 961;                              # [hPa]  Atmospheric pressure
q = 50;                                 # [%]    Channel time availability
L_sf_std__dB = 6;                       # [dB]   Path loss variation standard deviation
L_sf__dB = L_sf_std__dB * norm_inv(q);  # [dB]   Path loss variation for the corresponding time availability


## Ambient parameters
global T_0 = 270;                       # [K]    Ambient temperature
global QNH = 961;                       # [hPa]  Atmospheric pressure
global WVP;                             # [hPa]  Water vapour pressure
global RRI;                             # [N]    Radio refractivity index
global K;                               # num.   Earth effective radius factor
global q = 50;                          # [%]    Channel time availability
global L_sf_std__dB = 6;                # [dB]   Path loss variation standard deviation
L_sf__dB = L_sf_std__dB * norm_inv(q);  # [dB]   Path loss variation for the corresponding time availability

## Receiver parameters
global f__MHz;                          # [MHz]  Transceiver frequency
global B__Hz;                           # [Hz]   Transceiver bandwidth
global N_F__dB;                         # [dB]   Transceiver noise figure
global SNR_req__dB;                     # [dB]   Transceiver signal-to-noise ratio requirement
global N_tot__dBm;                      # [dBm]  Transceiver noise floor
global S_min__dBm;                      # [dBm]  Transceiver detection threshold
global L_int__dB = 0;                   # [dB]   Transceiver cumulative internal losses
global G_pro__dB = 0;                   # [dB]   Transceiver processing gain
global G_ant__dB = 0;                   # [dB]   Transceiver antenna gain

## Simulation parameters
global node_xyz;                        # [km]   Node relative x, y, and z coordinates
global node_dist;                       # [km]   Node absolute distances in three dimensional space
global node_dist_alts;                  # var.   Node absolute distances in three dimensional space [km] and altitudes [m]
global node_geodist_alts;               # var.   Node great circle path distances [km] and altitudes [m]
global node_d_hor;                      # [km]   Node total radio horizon distances
global node_d_hor_single;               # [km]   Node radio horizon distances to spherical Earth
global node_jam_ring;                   # [km]   Jamming node's distance to the ring where JSR exceeds required SNR
global node_path_loss;                  # [dB]   Node path losses
global node_tx_pwr;                     # [W]    Node transmitted power
global node_rx_pwr;                     # [dBm]  Node received power
global node_cnr;                        # [dB]   Node carrier-to-noise ratio
global node_jsr;                        # [dB]   Node jamming-to-signal ratio
global node_count;                      # num.   Node count
global node_link_capacity;              # [b/s]  Node link channel capacity

## octave-networks-toolbox related
if(graphtools)
  ## Node cliques
  ## TODO: cleck out find_cliques.m and tell me a sane way to accomplish this.
  for i = 1:50
    eval(['global node_clique_' num2str(i) ';'])
  endfor
  global node_clique_count;             # num.   Node clique count

  ## Node degress
  global node_degrees;                  # arr.   Node degrees [degree,indegree,outdegree]
endif

## Plotting variables
global nodes;                           # Graph node list
global edges;                           # Graph edge list
global labels;                          # Graph labels

## Generated graphs
global graph_node_link;                 # Graph for node links
global graph_node_jsr;                  # Graph for jamming-to-signal ratio
global graph_node_logical;              # Graph for node logical layer