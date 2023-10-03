## Calculate node received powers using ITU-R P.1238-11

function calc_node_path_loss_p1238(param_los = 1, param_env = 1)
  globals
  if(funcinfo) disp("Calculating node path losses using ITU-R P.1238-11... ") endif
  ticstart
    calc_node_dist
    node_path_loss = model_p1238(node_dist,param_los,param_env);
  ticstop
endfunction