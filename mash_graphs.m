% Combine multiple graphs to a single graph
%
% Input:    graph_a       Adjacency matrix of the first graph
%           graph_b       Adjacency matrix of the second graph
% Output:   graph_mashed  Adjacency matrix of the combined graph

function graph_mashed = mash_graphs(graph_a,graph_b)
  globals
    graph_mashed = cat(2,A,zeros(rows(graph_a),columns(graph_b)));
    graph_mashed = cat(1,graph_mashed,[zeros(rows(graph_b),columns(graph_a)) graph_b]);
  if(hints) disp("   Combined adjacency matrix generated to 'graph_mashed") endif
endfunction