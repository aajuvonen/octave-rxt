% Calculate node received powers
function calc_node_rx_pwr
  disp("Calculating node received powers...")
  tic
  global node_dist;
  global node_path_loss;
  global node_tx_pwr;
  global node_rx_pwr;
  node_rx_pwr = node_path_loss + watt2dbm(node_tx_pwr(:,1).*node_tx_pwr(:,2));
  toc
endfunction