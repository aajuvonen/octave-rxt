## Plot modified Hata loss model curve

function plot_model_hata_mod(param_h1,param_h2,param_u = 0,param_u_r = 0,param_b = 15.849)
  disp("Plotting modified Hata loss path loss curve... ")
  ticstart
  globals
    close all                        # Close all plots
    axis_dist = [1:40];              # Distance vector
    h1 = zeros(size(axis_dist));
    h2 = zeros(size(axis_dist));
    h1 += param_h1;                  # Terminal 1 vector
    h2 += param_h2;                  # Terminal 2 vector

    ## Calculate path loss
    path_loss = model_hata_mod(axis_dist,h1,h2,param_u,param_u_r,param_b);
    plot(path_loss);
    xlabel("Distance [km]");
    ylabel("Loss [dB]");
  ticstop
endfunction