% Graph jamming-to-signal ratio
function draw_graph_node_jsr
  disp("Graphing jamming-to-signal ratio...")
  tic
  global node_jsr;
  global graph_node_jsr;
  global SNR_req;
  graph_node_jsr = node_jsr;
  graph_node_jsr(~isfinite(graph_node_jsr)) = 0;
  graph_node_jsr = graph_node_jsr > SNR_req;
  toc
endfunction