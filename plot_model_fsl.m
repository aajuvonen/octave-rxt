% Plot free space loss model curve
function plot_model_fsl(param_alpha)
  printf("Plotting free space loss path loss curve... ")
  tic
  globals
  close all;                                            % Close all plots
  axis_dist = [1:400];                                  % Distance vector
  path_loss = model_fsl(axis_dist,param_alpha);         % Calculate path loss
  plot(path_loss);
  xlabel("Distance [km]");
  ylabel("Loss [dB]");
  disp(toc)
endfunction