## Calculate node carrier-to-noise ratios

function calc_node_cnr
  globals
  if(funcinfo) disp("Calculating node carrier-to-noise ratios... ") endif
  ticstart
    node_cnr = node_rx_pwr - N_tot__dBm;
  ticstop
endfunction