% Calculate node carrier-to-noise ratios
function calc_node_cnr
  disp("Calculating node carrier-to-noise ratios...")
  tic
  global node_cnr;
  global node_rx_pwr;
  global N_tot;
  node_cnr = node_rx_pwr - N_tot;
  toc
endfunction