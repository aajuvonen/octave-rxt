## Calculate node arithmetic mean distance 
##
## Input:  param_nodes  arr.  Optionally input node index array, by default are nodes are calculated

function dist_mean = calc_node_dist_mean(param_nodes)
  globals
    ## By default calculate distances for all nodes
    if(!exist("param_nodes"))
      param_nodes = 1:node_count;
    endif
    calc_node_dist(param_nodes);
    dist_mean = mean(nonzeros(triu(node_dist)));
endfunction