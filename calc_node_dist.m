## Calculate node three dimensional distances 

function calc_node_dist
  globals
    node_dist  = (node_xyz(:,1) - node_xyz(:,1)') .^ 2; # Using Arun Giridhar's method for three dimensional distance
    node_dist += (node_xyz(:,2) - node_xyz(:,2)') .^ 2; # https://octave.discourse.group/t/technique-exchange-computing-distances-between-points/2939
    node_dist += (node_xyz(:,3) - node_xyz(:,3)') .^ 2;
    node_dist = sqrt (node_dist);
endfunction