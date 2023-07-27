## Calculate node three dimensional distances in kilometers and altitudes in meters

function calc_node_dist_alts
  globals
    node_dist_alts = zeros(node_count,node_count,3);
    node_dist_alts(:,:,1)  = (node_xyz(:,1) - node_xyz(:,1)') .^ 2;  # Using Arun Giridhar's method for two dimensional distance
    node_dist_alts(:,:,1) += (node_xyz(:,2) - node_xyz(:,2)') .^ 2;  # https://octave.discourse.group/t/technique-exchange-computing-distances-between-points/2939
    node_dist_alts(:,:,1) += (node_xyz(:,3) - node_xyz(:,3)') .^ 2;
    node_dist_alts(:,:,1)  = sqrt(node_dist_alts(:,:,1));
    node_dist_alts(:,:,2) = node_dist_alts(:,:,2) + node_xyz(:,3) .* 1000;
    node_dist_alts(:,:,3) = node_dist_alts(:,:,3) + node_xyz(:,3)' .* 1000;
endfunction