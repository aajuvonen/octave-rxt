## Calculate node received powers using trans horizon model

function calc_node_path_loss_overhor
  disp("Calculating node path losses using trans horizon model... ")
  ticstart
  globals
    calc_node_dist_alts
    node_path_loss = model_overhor(node_dist_alts(:,:,1),node_dist_alts(:,:,2),node_dist_alts(:,:,3));
  ticstop
endfunction