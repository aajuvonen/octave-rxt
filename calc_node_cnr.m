% Calculate node carrier-to-noise ratios
function calc_node_cnr
  disp("Calculating node carrier-to-noise ratios...")
  tic
  globals
  node_cnr = node_rx_pwr - N_tot;
  toc
endfunction