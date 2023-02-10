% Calculate node radio horizons 
function calc_node_d_hor
  printf("Calculating node radio horizons... ")
  tic
  globals
  node_d_hor_single = zeros(node_count,node_count);                     % Initialise vector
  node_d_hor_single = calc_d_hor((node_xyz(:,3).*1000),0);              % Calculate singular radio horizons
  node_d_hor = zeros(node_count,node_count,2);                          % Initialise vector
  node_d_hor(:,:,1) += (node_xyz(:,3).*1000);                           % Node altitudes in [m] in rows
  node_d_hor(:,:,2) += (node_xyz(:,3)'.*1000);                          % Node altitudes in [m] in cols
  node_d_hor(:,:,2) = node_d_hor(:,:,2).*~eye(size(node_d_hor(:,:,2))); % Replace diagonal with zeros
  node_d_hor = calc_d_hor(node_d_hor(:,:,1),node_d_hor(:,:,2));         % Calculate total radio horizons
  disp(toc)
  disp("   Call 'plot_node_d_hor' to plot graph")
endfunction