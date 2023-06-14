## Find degrees using octave-networks-toolbox
##
## Input:   param_graph  arr.  Adjacency matrix
##
## Output: node_degrees  arr.  Node degrees [degree,indegree,outdegree]

function find_degrees(param_graph)
  disp("Finding node degrees, indegrees and outdegrees...")
  ticstart
  globals
    [deg,indeg,outdeg] = degrees(param_graph);
    node_degrees = [deg;indeg;outdeg];
  ticstop
endfunction