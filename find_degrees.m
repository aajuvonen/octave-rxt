## Find degrees using octave-networks-toolbox
##
## Input:   param_graph  arr.  An adjacency matrix of the graph to be sliced
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