## Calculate node jamming rings
##
## Inputs:  param_jammer  jammer node index   ind.  (1st)   Jammer node's index, default is 1
##          P_vic__watt   victim TX power     [W]           Victim nodes' transmit power, default is average power (excluding non-transmitters)
##          n_vic         victim channels     int.  (1)     Number of jammed channels, default is 1
##          d_vic__km     victim distance     [km]  (avg.)  Distance between jammed nodes, default is average distance (excluding jammer)
##          param_alpha   path loss exponent  num.  (2)     Loss exponent, default is 2 (equivalent to free space spreading loss)
##          JCR           required JCR        num.  (1)     Required jamming-to-carrier ratio (default 1:1)
##          L_jam         power loss factor   num.  (4)     Power loss factor per victim channels, default is 4 (-6.02 dB)
##
## Output:            distance  [km]

function calc_node_jam_ring(param_jammer = 1, P_vic__watt, n_vic = 1, d_vic__km, param_alpha = 2, JCR = 1, L_jam = 4)
  disp("Calculating node jamming rings... ")
  ticstart
  globals
    ## If the victim's distance relative to each other is not given, calculate node average distance excluding the jammer 
    if(!exist("d_vic__km"))
      nodes = 1:node_count;
      calc_node_dist(nodes(nodes(nodes(nodes > 0) <= node_count) != param_jammer));
      d_vic__km = mean(node_dist,'all');
    endif

    ## If victim TX power is not set, find average power excluding non-transmitters
    % if(!exist("P_vic__watt")
      % unfinished 15 Jun 2023
    % endif

    node_jam_ring = zeros(n_vic, 1);
    for i = 1:n_vic
      node_jam_ring(i) = d_vic__km * L_jam^((1 - i) / param_alpha) * ((JCR * P_vic__watt) / node_tx_pwr(param_jammer))^(-1 / param_alpha);
    endfor
  ticstop
  if(hints) disp("   Call 'plot_node_jam_ring' to plot graph") endif
endfunction