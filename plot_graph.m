## Function for plotting graphs
##
## Inputs:  param_graph  arr.  Adjacency matrix
##          param_type   str.  (empty / phy / log)
##
## Output:  Graphical representation

function plot_graph(param_graph, param_type = "phy")
  disp("Plotting graph...")
  ticstart
  globals
    ## Plot physical graph (default)
    if(param_type == "phy")
      nodes = node_xyz(:,1:2);                           # Get node xy list
      edges = getEdges(param_graph,'adjacency')(:,1:2);  # Get edge list
      labels = [1:node_count]';                          # Get node numeric labels
      plot_worker                                        # Call plot worker function

    ## Plot logical graph (usually AFTER a physical graph was plotted)
    elseif(param_type == "log")
      gplot(graph_node_logical, [node_xyz(:,1,1) node_xyz(:,2,1)], "m");
      axis("auto")
      axis("off")
    endif

  ticstop
endfunction
