## Calculate node received powers

function calc_node_rx_pwr
  globals
  if(funcinfo) disp("Calculating node received powers... ") endif
  ticstart
    node_rx_pwr = node_path_loss + watt2dbm(node_tx_pwr(:,1) .* node_tx_pwr(:,2));
  ticstop
endfunction