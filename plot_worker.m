## Draw graphs with octave-matgeom and octave-networks-toolbox

function plot_worker
  globals
    axisval = ceil((max(max(node_xyz))) / 50) * 50;        # Get plot axis value
    axis([0 axisval 0 axisval], "equal");                  # Set plot axes
    pkg load matgeom;                                      # Load matgeom
      drawDirectedEdges(nodes, edges);                     # Draw directed edges
      plot_labels = drawNodeLabels(nodes, labels);         # Draw node labels
      set(plot_labels, "fontsize", 12);                    # Resize node label font
      plot(nodes(:,1), nodes(:,2), ".k", "markersize",8);  # Draw nodes
    pkg unload matgeom;                                    # Unload matgeom
endfunction