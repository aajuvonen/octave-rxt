## Calculate node three dimensional distances 
##
## Input:  param_nodes  arr.  Optionally input node index array, by default are nodes are calculated

function calc_node_dist(param_nodes)
  globals
    ## By default calculate distances for all nodes
    if(!exist("param_nodes"))
      param_nodes = 1:node_count;
    endif
    node_dist  = (node_xyz(param_nodes,1) - node_xyz(param_nodes,1)') .^ 2;  # Using Arun Giridhar's method for three dimensional distance
    node_dist += (node_xyz(param_nodes,2) - node_xyz(param_nodes,2)') .^ 2;  # https://octave.discourse.group/t/technique-exchange-computing-distances-between-points/2939
    node_dist += (node_xyz(param_nodes,3) - node_xyz(param_nodes,3)') .^ 2;
    node_dist  = sqrt(node_dist);
endfunction