## Calculate node link channel capacity

function calc_node_link_capacity
  globals
  if(funcinfo) disp("Calculating node link channel capacities... ") endif
  ticstart
    node_link_capacity = B__Hz * log2(1 + dbm2watt(node_rx_pwr - N_tot__dBm));
  ticstop
endfunction