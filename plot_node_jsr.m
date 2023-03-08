% Plot node links under jamming
function plot_node_jsr
  printf("Plotting node links under jamming... ")
  ticstart
  globals

  nodes = node_xyz (:,1:2);                             % Get node xy list
  edges = getEdges(graph_node_jsr,'adjacency')(:,1:2);  % Get edge list
  labels = [1:node_count]';                             % Get node numeric labels
  plot_worker;                                          % Call plot worker function
  
  ticstop
endfunction