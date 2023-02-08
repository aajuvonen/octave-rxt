% Calculate node received powers using free space loss with parametric path loss exponent
function calc_node_rx_pwr_fsl
  disp("Calculating node received powers using free space loss...")
  disp("To calculate using ITU-R P.528-5, call 'calc_node_rx_pwr_p528'")
  tic
  global node_dist;
  global node_tx_pwr;
  global node_rx_pwr;
  global L_0;
  global alpha;
  node_rx_pwr = -1*(L_0 + 10*log10(node_dist.^alpha) - watt2dbm(node_tx_pwr));
  toc
endfunction