## Function for listing transmitting nodes
##
## Inputs:  param_graph  arr.  Adjacency matrix
##          param_node   num.  Node index
##
## Output:  retval       arr.  Node list
##
## TODO: add support for node arrays

function retval = nodes_tx(param_graph, param_node)
  edges = getEdges(param_graph,'adjacency')(:,1:2);  # Get edge list
  retval = edges(edges(:,2) == param_node,1)';       # Output transmitting nodes
endfunction