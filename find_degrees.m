## Find degrees using octave-networks-toolbox
##
## Input:  param_graph   arr.  Adjacency matrix
##
## Output: node_degrees  arr.  Node degrees [degree,indegree,outdegree]

function find_degrees(param_graph)
  globals
  if(funcinfo) disp("Finding node degrees, indegrees and outdegrees...") endif
  ticstart
    [deg,indeg,outdeg] = degrees(param_graph);
    node_degrees = [deg;indeg;outdeg];
  ticstop
endfunction