## Function for plotting graphs
##
## Inputs:  param_graph_phy  arr.  Adjacency matrix for physical layer
##          param_graph_log  arr.  Adjacency matrix for logical layer
##
## Output:  Graphical representation

function plot_graph(param_graph_phy, param_graph_log)
  disp("Plotting graph...")
  ticstart
  globals

    ## Prerequisite for drawing both physical and logical layers
    if(exist("param_graph_log"))
      subplot(1,2,1)
    endif

    ## Plot physical graph (default)
    nodes = node_xyz(1:rows(param_graph_phy),1:2);            # Get node xy list
    edges = getEdges(param_graph_phy, 'adjacency')(:,1:2);    # Get edge list
    labels = [1:node_count]';                                 # Get node numeric labels
    plot_worker("phy")                                        # Call plot worker function

    ## Plot physical and logical graph
    if(exist("param_graph_log"))
      nodes = node_xyz(:,1:2);                                # Get node xy list
      subplot(1,2,2)                                          # Use subplot 2 for logical layer
      edges = getEdges(param_graph_log, 'adjacency')(:,1:2);  # Get edge list
      plot_worker("log")                                      # Call plot worker function
    endif

  ticstop
endfunction