## Calculate node jamming-to-signal ratios
## Input: jammer node index

function calc_node_jsr(jammer = 1)
  disp("Calculating node jamming-to-signal ratios... ")
  ticstart
  globals
    node_jsr = node_rx_pwr - node_rx_pwr(jammer,:);
    node_jsr(jammer,:) = -1*S_min + node_rx_pwr(jammer,:);
  ticstop
endfunction