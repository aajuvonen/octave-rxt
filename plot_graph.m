## Function for plotting graphs

function plot_graph(param_graph)
  disp("Plotting graph...")
  ticstart
  globals
    nodes = node_xyz(:,1:2);                           # Get node xy list
    edges = getEdges(param_graph,'adjacency')(:,1:2);  # Get edge list
    labels = [1:node_count]';                          # Get node numeric labels
    plot_worker                                        # Call plot worker function
  ticstop
endfunction