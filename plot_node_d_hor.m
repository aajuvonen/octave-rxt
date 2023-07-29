## Plot node singular radio horizons
##
## Input:   node index array

function plot_node_d_hor(param_nodes)
  disp("Plotting node singular horizons... ")
  ticstart
  globals
    if(!exist("param_nodes"))
      param_nodes = 1:node_count;  # Default to include all nodes
    endif
    drawCircle(node_xyz(param_nodes,1), node_xyz(param_nodes,2), node_d_hor_single(1:length(param_nodes)));
  ticstop
endfunction