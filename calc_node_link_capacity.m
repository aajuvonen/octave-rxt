## Calculate node link channel capacity

function calc_node_link_capacity
  disp("Calculating node link channel capacities... ")
  ticstart
  globals
    node_link_capacity = B * log2(1 + dbm2watt(node_rx_pwr - N_tot));
  ticstop
endfunction