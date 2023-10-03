## Create a Laplacian matrix using octave-networks-toolbox
##
## Input:  param_graph  arr.  Adjacency matrix
##         param_dir    num.  (1,2,3) Degree to use: 1 = total, 2 = indegree, 3 = outdegree
##
## Output: mat_L        mat.  Laplacian matrix

function mat_L = matrix_laplacian(param_graph, param_dir = 1)
  globals
  if(funcinfo) disp("Creating Laplacian matrix...") endif
  ticstart
    mat_D = matrix_degree(param_graph,param_dir);  # Requires octave-networks-toolbox
    mat_L = mat_D - param_graph;
  ticstop
endfunction