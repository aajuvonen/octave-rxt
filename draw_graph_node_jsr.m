% Graph jamming-to-signal ratio
function draw_graph_node_jsr
  printf("Graphing jamming-to-signal ratio... ")
  ticstart
  globals

  graph_node_jsr = node_jsr;
  graph_node_jsr(~isfinite(graph_node_jsr)) = 0;
  graph_node_jsr = graph_node_jsr > SNR_req;
  
  ticstop
  if(hints) disp("   Jamming-to-signal ratio adjacency matrix generated to 'graph_node_jsr'") endif
  if(hints) disp("   Call 'plot_node_jsr' to plot graph") endif
endfunction