## Plot ITU-R P.1238-11 path loss model curve

function plot_model_p1238(param_los = 1,param_env = 1)
  disp("Plotting ITU-R P.1238-11 path loss curve... ")
  ticstart
  globals
    close all                                               # Close all plots
    axis_dist = [1:100];                                    # Distance vector
    path_loss = model_p1238(axis_dist,param_los,param_env); # Calculate path loss
    plot(path_loss);
    xlabel("Distance [m]");
    ylabel("Loss [dB]");
  ticstop
endfunction