## Calculate path losses using modified Hata model, following Siwiak & Bahreini (2007) Eq. (7.11)-(7.23)
##
## Inputs:  d__km       distance           [km]   (1...100)
##          h_1_meter   terminal 1 height  [m]    (30...300)
##          h_2__meter  terminal 2 height  [m]    (1...10)
##          param_u     urban factor       bool   (0 / 1)       0 = small/medium city (buildings <= 15 m), 1 = large city (buildings > 15 m)
##          patam_u_r   city size          num.   (0...1)       0 = open area, 0.5 = suburban area, 1 = urban area
##          param_b     buildings          [%]    (3...50)      Percentage of buildings on the land (nominally 15.849 %)
##          f__MHz      frequency          [MHz]  (100...3000)
##
## Output:  L_hata__dB  path loss          [dB]

function L_hata__dB = model_hata_mod(d__km, h_1__meter, h_2__meter, param_u = 0, param_u_r = 0, param_b = 15.849)
  globals

  if(warnings)
    if(d__km < 1) disp("Warning: distance lower than model minimum 1 km") endif
    if(d__km > 100) disp("Warning: distance exceeds model maximum 100 km") endif
    d_hor = calc_d_hor(h_1__meter, h_2__meter);
    if(d__km > d_hor) disp("Warning: distance exceeds radio horizon") endif
    if(h_1__meter < 30) disp("Warning: terminal 1 height lower than model minimum 30 m") endif
    if(h_1__meter > 300) disp("Warning: terminal 1 height exceeds model maximum 300 m") endif
    if(h_2__meter < 1) disp("Warning: terminal 2 height lower than model minimum 1 m") endif
    if(h_2__meter > 10) disp("Warning: terminal 2 height exceeds model maximum 10 m") endif
    if(param_b < 3) disp("Warning: building percentage lower than model minimum 3 %") endif
    if(param_b > 50) disp("Warning: building percentage exceeds model maximum 50 %") endif
    if(f__MHz < 100) disp("Warning: frequency lower than model minimum 100 MHz") endif
    if(f__MHz > 3000) disp("Warning: frequency exceeds model maximum 3000 MHz") endif
  endif
  
    if(d__km == 0)
      L_hata__dB = Inf;
    else
      a_m = (0.7 - 1.1 * log10(f__MHz)) .* h_2__meter + 1.56 * log10(f__MHz) - 0.8;  # Eq. (7.12)
      a_2 = 1.1 - 8.29 * log10(1.54 .* h_2__meter).^2;                               # Eq. (7.13)
      a_4 = 4.97 - 3.2 * log10(11.75 .* h_2__meter).^2;                              # Eq. (7.14)
      L_ps = -2 * log10(f__MHz / 28)^2 - 5.4;                                        # Eq. (7.15)
      L_po = -4.78 * log10(f__MHz)^2 + 18.33 * log10(f__MHz) - 40.94;                # Eq. (7.16)
      F_1 = (300^4) / (f__MHz^4 + 300^4);                                            # Eq. (7.17)
      F_2 = (f__MHz^4) / (300^4 + f__MHz^4);                                         # Eq. (7.18)
      S_ks_1 = 27 + (f__MHz/230);
      S_ks_2 = 17 .* (h_1__meter + 20);
      S_ks_3 = 17 .* (h_1__meter + 20) + d__km.^2;
      S_ks_4 = 1.3 - (abs(f__MHz - 55) / 750);
      S_ks = S_ks_1 * log10(S_ks_2 ./ S_ks_3) + S_ks_4;                              # Eq. (7.19)
      S_o = (1-param_u_r) * ((1-2*param_u_r) * L_po + 4 * param_u_r * L_ps);         # Eq. (7.20)
      a_x = (1-param_u) * a_m + param_u * (a_2 * F_1 + a_4 * F_2);                   # Eq. (7.21)
      B_o = 25 * log10(param_b) - 30;                                                # Eq. (7.22)
      L_ccir  = 69.55 + 26.16 * log10(f__MHz) - 13.82 .* log10(h_1__meter);
      L_ccir += (44.9 - 6.55 .* log10(h_1__meter)) .* log10(d__km);
      L_ccir += a_x;                                                                 # Eq. (7.11)
      L_hata__dB = -(L_ccir + S_o - S_ks + B_o);                                     # Eq. (7.23)
    endif
endfunction