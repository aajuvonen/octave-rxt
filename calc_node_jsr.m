## Calculate node jamming-to-signal ratios
##
## Input: param_jammer node index

function calc_node_jsr(param_jammer = 1)
  disp("Calculating node jamming-to-signal ratios... ")
  ticstart
  globals
    node_jsr = node_rx_pwr - node_rx_pwr(param_jammer,:);
    node_jsr(param_jammer,:) = -1 * S_min__dBm + node_rx_pwr(param_jammer,:);
  ticstop
endfunction