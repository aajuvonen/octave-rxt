## Graph jamming-to-signal ratio

function draw_graph_node_jsr
  disp("Graphing jamming-to-signal ratio... ")
  ticstart
  globals
    graph_node_jsr = node_jsr;
    graph_node_jsr = graph_node_jsr > SNR_req__dB;
    graph_node_jsr(logical(eye(node_count))) = 0;
  ticstop
  if(hints) disp("   Jamming-to-signal ratio adjacency matrix generated to 'graph_node_jsr'") endif
  if(hints) disp("   Call 'plot_graph(graph_node_jsr)' to plot graph") endif
endfunction