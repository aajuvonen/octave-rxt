## Calculate node jamming-to-signal ratios
##
## Inputs:  param_jammer  jammer node index   ind.  (1st)   Jammer node's index, default is 1
##          param_victim  victim node indices ind.  (All)   Victim nodes' indices, default is all

function calc_node_jsr(param_jammer = 1, param_victim)
  globals
  if(funcinfo) disp("Calculating node jamming-to-signal ratios... ") endif
  ticstart
    if(!exist("param_victim"))
      param_victim = 1:node_count;
    endif

    mask_jammer = ones(1, node_count) * -Inf;
    mask_jammer(param_victim) = node_rx_pwr(1, param_victim);

    node_jsr = node_rx_pwr - mask_jammer;
    node_jsr(param_jammer,:) = -1 * S_min__dBm + node_rx_pwr(param_jammer,:);
  ticstop
endfunction