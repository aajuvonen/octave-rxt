## Plot beyond-the-horizon loss model curve

function plot_model_overhor(h_1__meter, h_2__meter)
  globals
  if(funcinfo) disp("Plotting beyond-the-horizon path loss curve... ") endif
  ticstart
    close all                                                      # Close all plots
    axis_dist = [1:400];                                           # Distance vector
    path_loss = model_overhor(axis_dist, h_1__meter, h_2__meter);  # Calculate path loss
    plot(path_loss);
    xlabel("Distance [km]");
    ylabel("Loss [dB]");
  ticstop
endfunction