% Graph node links
function draw_graph_node_link
  disp("Graphing node links...")
  tic
  globals
  graph_node_link = node_rx_pwr;
  graph_node_link(~isfinite(graph_node_link)) = -Inf;
  graph_node_link = graph_node_link > S_min;
  toc
  disp(" > Node link adjacency matrix generated to 'graph_node_links'")
endfunction