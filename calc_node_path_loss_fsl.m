% Calculate node received powers using free space loss with parametric path loss exponent 
function calc_node_path_loss_fsl
  printf("Calculating node path losses using free space loss... ")
  tic
  globals
  calc_node_dist
  node_path_loss = model_fsl(node_dist,2);
  disp(toc)
endfunction