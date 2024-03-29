## Graph node links

function draw_graph_node_link
  globals
  if(funcinfo) disp("Graphing node links... ") endif
  ticstart
    graph_node_link = node_rx_pwr;
    graph_node_link(~isfinite(graph_node_link)) = -Inf;
    graph_node_link = graph_node_link > S_min__dBm;
  ticstop
  if(hints) disp("   Node link adjacency matrix generated to 'graph_node_links'") endif
  if(hints) disp("   Call 'plot_graph(graph_node_link)' to plot graph") endif
endfunction