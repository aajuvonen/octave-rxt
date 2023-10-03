## Calculate node received powers using modified Hata model

function calc_node_path_loss_hata_mod(param_u = 0, param_u_r = 0, param_b = 15.849)
  globals
  if(funcinfo) disp("Calculating node path losses using modified Hata... ") endif
  ticstart
    calc_node_dist_alts
    node_path_loss = model_hata_mod(node_dist_alts(:,:,1),node_dist_alts(:,:,2),node_dist_alts(:,:,3),param_u,param_u_r,param_b);
  ticstop
endfunction