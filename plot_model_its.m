% Plot ITS model curve
function plot_model_its(param_h1,param_h2,param_timeq = 50)
  disp("Plotting ITS-model path loss curve... ")
  tictart
  globals

  close all;                                                      % Close all plots
  axis_dist = [1:400];                                            % Distance vector
  path_loss = model_its(axis_dist,param_h1,param_h2,param_timeq); % Calculate path loss
  plot(path_loss);
  xlabel("Distance [km]");
  ylabel("Loss [dB]");

  ticstop
endfunction