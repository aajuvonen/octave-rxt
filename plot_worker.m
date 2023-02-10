% Draw graphs with octave-matgeom and octave-networks-toolbox
function plot_worker
  globals
  close all;                                            % Close all plots
  axis([0 500 0 500],"equal");                          % Set plot axes to 0...500
  pkg load matgeom;                                     % Load matgeom
    drawDirectedEdges(nodes,edges);                     % Draw directed edges
    plot_labels = drawNodeLabels(nodes,labels);         % Draw node labels
    set(plot_labels,"fontsize",12);                     % Resize node label font
    plot(nodes(:,1),nodes(:,2),".k","markersize",8);    % Draw nodes
  pkg unload matgeom;                                   % Unload matgeom
endfunction