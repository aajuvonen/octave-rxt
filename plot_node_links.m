% Plot node jamfree links
function plot_node_links
  disp("Plotting node jamfree links...")
  tic
  globals
  nodes = node_xyz (:,1:2);                             % Get node xy list
  edges = getEdges(graph_node_link,'adjacency')(:,1:2); % Get edge list
  labels = [1:node_count]';                             % Get node numeric labels
  plot_worker;                                          % Call plot worker function
  toc
endfunction