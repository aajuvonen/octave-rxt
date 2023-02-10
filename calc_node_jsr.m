% Calculate node jamming-to-signal ratios
% Input: jammer node index (optional)
function calc_node_jsr(jammer)
  disp("Calculating node jamming-to-signal ratios...")
  tic
  globals
  if isempty(jammer)
    jammer = 1;
  end
  node_jsr = node_rx_pwr - node_rx_pwr(jammer,:);
  node_jsr (jammer,:) = -1*S_min + node_rx_pwr (jammer,:);
  toc
endfunction