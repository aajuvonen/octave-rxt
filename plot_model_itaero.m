## Plot itaero model curve

function plot_model_itaero(param_h1,param_h2,param_timeq = 50)
  disp("Plotting itaero path loss curve... ")
  tictart
  globals
    close all                 # Close all plots
    axis_dist = [1:400];      # Distance vector

    ## Calculate path loss
    path_loss = model_itaero(axis_dist,param_h1,param_h2,param_timeq);
    plot(path_loss);
    xlabel("Distance [km]");
    ylabel("Loss [dB]");
  ticstop
endfunction