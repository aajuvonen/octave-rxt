% Plot node singular radio horizons
function plot_node_d_hor
  printf("Plotting node singular horizons... ")
  ticstart
  globals

  pkg load matgeom;
    drawCircle(node_xyz(:,1),node_xyz(:,2),node_d_hor_single);
  pkg unload matgeom;
  
  ticstop
endfunction