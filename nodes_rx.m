## Function for listing receiving nodes
##
## Inputs:  param_graph  arr.  Adjacency matrix
##          param_node   num.  Node index
##
## Output:  retval       arr.  Node list
##
## TODO: add support for node arrays

function retval = nodes_rx(param_graph, param_node)
  edges = getEdges(param_graph,'adjacency')(:,1:2);  # Get edge list
  retval = edges(edges(:,1) == param_node,2)';       # Output receiving nodes
endfunction