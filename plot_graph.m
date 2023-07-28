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

    ## Prerequisites for logical and physical graph drawing
    if(exist("param_graph_log"))
      ## Save original values
      node_xyz_orig = node_xyz;
      node_count_orig = node_count;
      graph_node_logical_orig = graph_node_logical;

      # Amount of x-offset for the logical nodes
      plot_offset__km = 30;

      ## Append physical layer node_xyz with an xy-offset clone set of nodes
      node_xyz = [node_xyz; [node_xyz(:,1,1) + plot_offset__km, node_xyz(:,2,1), zeros(rows(node_xyz),1)]];

      ## Offset the node 1's logical connection array by node count
      graph_node_logical = edit_graph_mash(zeros(node_count, node_count), graph_node_logical);

      ## Double the node count in order to draw the physical and logical layers to the same plot
      node_count *= 2;
    endif

    ## Plot physical graph (default)
    nodes = node_xyz(:,1:2);                                # Get node xy list
    edges = getEdges(param_graph_phy, 'adjacency')(:,1:2);  # Get edge list
    labels = [1:node_count]';                               # Get node numeric labels
    plot_worker                                             # Call plot worker function

    ## Plot logical graph AFTER a physical graph was plotted
    if(exist("param_graph_log"))
      gplot(graph_node_logical, [node_xyz(:,1,1) node_xyz(:,2,1)], "m");
      axis("auto")
      axis("off")
    endif

  ticstop
endfunction