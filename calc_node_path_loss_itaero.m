## Calculate node path losses using itaero model

function calc_node_path_loss_itaero
  disp("Calculating node path losses using itaero... ")
  ticstart
  globals
    calc_node_dist_alts
    node_path_loss = model_itaero(node_dist_alts(:,:,1),node_dist_alts(:,:,2),node_dist_alts(:,:,3),q);
  ticstop
endfunction