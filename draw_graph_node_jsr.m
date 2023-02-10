% Graph jamming-to-signal ratio
function draw_graph_node_jsr
  printf("Graphing jamming-to-signal ratio... ")
  tic
  globals
  graph_node_jsr = node_jsr;
  graph_node_jsr(~isfinite(graph_node_jsr)) = 0;
  graph_node_jsr = graph_node_jsr > SNR_req;
  disp(toc)
  disp("   Jamming-to-signal ratio adjacency matrix generated to 'graph_node_jsr'")
  disp("   Call 'plot_node_jsr' to plot graph")
endfunction