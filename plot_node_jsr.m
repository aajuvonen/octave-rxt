% Plot node links under jamming
function plot_node_jsr
  disp("Plotting node links under jamming...")
  tic
  global node_xyz;
  global node_count;
  global graph_node_jsr;
  global nodes;
  global edges;
  global labels;
  nodes = node_xyz (:,1:2);                             % Get node xy list
  edges = getEdges(graph_node_jsr,'adjacency')(:,1:2);  % Get edge list
  labels = [1:node_count]';                             % Get node numeric labels
  plot_worker;                                          % Call plot worker function
  toc
endfunction