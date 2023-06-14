## Calculate node received powers

function calc_node_rx_pwr
  disp("Calculating node received powers... ")
  ticstart
  globals
    node_rx_pwr = node_path_loss + watt2dbm(node_tx_pwr(:,1).*node_tx_pwr(:,2));
  ticstop
endfunction