% Calculate node great circle path distances and altitudes
function calc_node_geodist_alts
  global node_xyz;
  global node_count;
  global node_geodist_alts;
  node_geodist_alts = zeros(node_count,node_count,3);
  node_geodist_alts(:,:,1)  = (node_xyz(:,1) - node_xyz(:,1)') .^ 2; % Using Arun Giridhar's method for two dimensional distance
  node_geodist_alts(:,:,1) += (node_xyz(:,2) - node_xyz(:,2)') .^ 2; % https://octave.discourse.group/t/technique-exchange-computing-distances-between-points/2939
  node_geodist_alts(:,:,1)  = sqrt (node_geodist_alts(:,:,1));
  node_geodist_alts(:,:,2) = node_geodist_alts(:,:,2) + node_xyz(:,3)*1000;
  node_geodist_alts(:,:,3) = node_geodist_alts(:,:,3) + node_xyz(:,3)'*1000;
endfunction