## Plot node jamming rings

function plot_node_jam_ring(param_jammer = 1)
  globals
  if(funcinfo) disp("Plotting node jamming rings... ") endif
  ticstart
    for i = 1:length(node_jam_ring)
      drawCircle(node_xyz(param_jammer,1), node_xyz(param_jammer,2), node_jam_ring(i));
    endfor
  ticstop
endfunction