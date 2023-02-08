% Calculate node received powers using free space loss with parametric path loss exponent
function calc_node_path_loss_fsl
  disp("Calculating node path losses using free space loss...")
  tic
  global node_dist;
  global node_path_loss;
  global node_tx_pwr;
  global node_rx_pwr;
  global L_0;
  global alpha;
  node_path_loss = -1*(L_0 + 10*log10(node_dist.^alpha));
  toc
endfunction