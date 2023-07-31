## Draw graphs with octave-matgeom and octave-networks-toolbox

function plot_worker(param_type = "phy")
  globals

    if(param_type == "phy")
      figure(1, "position", [320,240,512,512]);                  # Set figure dimensions
      plot(nodes(:,1), nodes(:,2), ".k", "markersize",8);        # Draw nodes

      ## Get plot axis scale
      axisscale = 10 ^ length(num2str(ceil((max(max(node_xyz(1:rows(nodes),:,:)))))) - 1) / 4;

      drawDirectedEdges(nodes, edges);                           # Draw directed edges

    elseif(param_type == "log")
      figure(1, "position", [320,240,1024,512]);                 # Set figure dimensions
      subplot(1,2,2)                                             # Use subplot 2 for logical layer 

      ## Get plot axis scale
      axisscale = 10 ^ length(num2str(ceil((max(max(node_xyz))))) - 1) / 4;

      drawGraphEdges(nodes, edges);                              # Draw undirected edges
    endif

    plot_labels = drawNodeLabels(nodes, labels(1:rows(nodes)));  # Draw node labels
    set(plot_labels, "fontsize", 12);                            # Resize node label font

    ## Set plot axis value
    axisval = ceil((max(max(node_xyz))) / axisscale) * axisscale;
    
    ## Set plot axes
    axis([0 axisval 0 axisval], "equal");
    if(param_type == "log")
      axis("off")
    endif

endfunction