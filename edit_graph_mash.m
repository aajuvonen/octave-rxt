## Combine multiple graphs to a single graph
##
## Input:    graph_a       Adjacency matrix of the first graph
##           graph_b       Adjacency matrix of the second graph
##
## Output:   graph_mashed  Adjacency matrix of the combined graph

function graph_mashed = edit_graph_mash(graph_a, graph_b)
  globals
    graph_mashed = cat(2, graph_a, zeros(rows(graph_a), columns(graph_b)));
    graph_mashed = logical(cat(1, graph_mashed, [zeros(rows(graph_b), columns(graph_a)) graph_b]));
endfunction