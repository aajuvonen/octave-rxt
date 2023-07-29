## Draw graphs with octave-matgeom and octave-networks-toolbox

function plot_worker(param_type = "phy")
  globals

    if(param_type == "phy")
      figure(1, "position", [320,240,512,512]);
      plot(nodes(:,1), nodes(:,2), ".k", "markersize",8);  # Draw nodes
      drawDirectedEdges(nodes, edges);                     # Draw directed edges

    elseif(param_type == "log")
      figure(1, "position", [320,240,1024,512]);
      subplot(1,2,2)
      drawGraphEdges(nodes, edges);                        # Draw undirected edges
    endif

    plot_labels = drawNodeLabels(nodes, labels);         # Draw node labels
    set(plot_labels, "fontsize", 12);                    # Resize node label font

    axisscale = 10 ^ length(num2str(ceil((max(max(node_xyz))))) - 1) / 2;
    axisval = ceil((max(max(node_xyz))) / axisscale) * axisscale;        # Get plot axis value
    % axisval = ceil((max(max(node_xyz))) / 50) * 50;        # Get plot axis value

    axis([0 axisval 0 axisval], "equal");                  # Set plot axes

    if(param_type == "log")
      axis("off")
    endif

endfunction