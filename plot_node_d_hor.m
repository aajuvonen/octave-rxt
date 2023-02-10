% Plot node singular radio horizons
function plot_node_d_hor
  disp("Plotting node singular horizons...")
  tic
  globals
  pkg load matgeom;
    drawCircle(node_xyz(:,1),node_xyz(:,2),node_d_hor_single);
  pkg unload matgeom;
  toc
endfunction