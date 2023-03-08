% Combine multiple graphs to a single graph
function mash_graphs(A,B)
  graph_mashed = cat(2,A,zeros(rows(A),columns(B)));
  graph_mashed = cat(1,graph_mashed,[zeros(rows(B),columns(A)) B]);
  if(hints) disp("   Combined adjacency matrix generated to 'graph_mashed") endif
endfunction