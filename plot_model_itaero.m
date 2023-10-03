## Plot itaero model curve

function plot_model_itaero(h_1__meter, h_2__meter, q_percent = 50)
  globals
  if(funcinfo) disp("Plotting itaero path loss curve... ") endif
  tictart
    close all             # Close all plots
    axis_dist = [1:400];  # Distance vector

    ## Calculate path loss
    path_loss = model_itaero(axis_dist,h_1__meter,h_2__meter,q_percent);
    plot(path_loss);
    xlabel("Distance [km]");
    ylabel("Loss [dB]");
  ticstop
endfunction