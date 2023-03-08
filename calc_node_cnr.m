% Calculate node carrier-to-noise ratios
function calc_node_cnr
  printf("Calculating node carrier-to-noise ratios... ")
  ticstart
  globals
  
  node_cnr = node_rx_pwr - N_tot;
  
  ticstop
endfunction