## Create a degree matrix
##
## Input:  param_graph  arr.  Adjacency matrix
##         param_dir    num.  (1,2,3) Degree to use: 1 = total, 2 = indegree, 3 = outdegree
##
## Output: mat_D        mat.  Degree matrix

function mat_D = matrix_degree(param_graph, param_dir = 1)
  globals
  if(funcinfo) disp("Creating degree matrix...") endif
  ticstart
    find_degrees(param_graph);               # Requires octave-networks-toolbox
    mat_D = diag(node_degrees(param_dir,:))
  ticstop
endfunction