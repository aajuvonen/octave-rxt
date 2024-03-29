## Calculate node received powers using free space loss with parametric path loss exponent 

function calc_node_path_loss_fsl(param_alpha = 2)
  globals
  if(funcinfo) disp(["Calculating node path losses using free space loss with alpha " num2str(param_alpha) "..."]) endif
  ticstart
    calc_node_dist
    node_path_loss = model_fsl(node_dist,param_alpha);
  ticstop
endfunction