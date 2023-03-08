% Calculate node path losses using ITS model (Itse Tehty Säästömalli)
function calc_node_path_loss_its
  printf("Calculating node path losses using ITS... ")
  ticstart
  globals

  calc_node_dist_alts
  node_path_loss = model_its(node_dist_alts(:,:,1),node_dist_alts(:,:,2),node_dist_alts(:,:,3),q);
  
  ticstop
endfunction