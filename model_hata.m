% Calculate path losses using modified Hata model, following Siwiak & Bahreini (2007) Eq. (7.11)-(7.23)

% Inputs:            distance  [km]  (1...100)
%           terminal 1 height  [m]   (30...300)
%           terminal 2 height  [m]   (1...10)
%                urban factor  num.  (0 / 1)
%                   city size  num.  (0...1)
%                   buildings  [%]   (3...50)
%                   frequency  [MHz] (100...3000)

% Output:           path loss  [dB]

function path_loss_hata = model_hata(param_dist,param_h1,param_h2,param_u1 = 0,param_u2 = 0,param_b = 15.849)
  globals

  if(warnings)
    if(param_dist > 100) disp("Warning: distance exceeds model maximum 100 km") endif
    d_hor = calc_d_hor(param_h1,param_h2);
    if(param_dist > d_hor) disp("Warning: distance exceeds radio horizon") endif
    if(param_h1 < 30) disp("Warning: terminal 1 height lower than model minimum 30 m") endif
    if(param_h1 > 300) disp("Warning: terminal 1 height exceeds model maximum 300 m") endif
    if(param_h2 < 1) disp("Warning: terminal 2 height lower than model minimum 1 m") endif
    if(param_h2 > 10) disp("Warning: terminal 2 height exceeds model maximum 10 m") endif
    if(param_b < 3) disp("Warning: building percentage lower than model minimum 3 %") endif
    if(param_b > 50) disp("Warning: building percentage exceeds model maximum 50 %") endif
    if(f < 100) disp("Warning: frequency lower than model minimum 100 MHz") endif
    if(f > 3000) disp("Warning: frequency exceeds model maximum 3000 MHz") endif
  endif

  
  a_m = (0.7 - 1.1 * log10(f)) * param_h2 + 1.56 * log10(f) - 0.8;  % Eq. (7.12)
  a_2 = 1.1 - 8.29 * log10(1.54 * param_h2)^2;                      % Eq. (7.13)
  a_4 = 4.97 - 3.2 * log10(11.75 * param_h2)^2;                     % Eq. (7.14)
  L_ps = -2 * log10(f / 28)^2 - 5.4;                                % Eq. (7.15)
  L_po = -4.78 * log10(f)^2 + 18.33 * log10(f) - 40.94;             % Eq. (7.16)
  F_1 = (300^4) / (f^4 + 300^4);                                    % Eq. (7.17)
  F_2 = (f^4) / (300^4 + f^4);                                      % Eq. (7.18)
  S_ks_1 = (27 + f/230);
  S_ks_2 = 17 * (param_h1 + 20);
  S_ks_3 = 17 * (param_h1 + 20) + param_dist^2;
  S_ks_4 = 1.3 - (abs(f - 55)) / 750;
  S_ks = S_ks_1 * log10(S_ks_2 / S_ks_3) + S_ks_4;                  % Eq. (7.19)
  S_o = (1-param_u2) * ((1-2*param_u2) * L_po + 4*param_u2 * L_ps); % Eq. (7.20)
  a_x = (1-param_u1) * a_m + param_u1 * (a_2 * F_1 + a_4 * F_2);    % Eq. (7.21)
  B_o = 25 * log10(param_b) - 30;                                   % Eq. (7.22)
  L_ccir  = 69.55 + 26.16 * log10(f) - 13.82 * log10(param_h1);
  L_ccir += (44.9 - 6.55 * log10(param_h1)) * log10(param_dist);
  L_ccir += a_x;                                                    % Eq. (7.11)

  path_loss_hata = -(L_ccir + S_o - S_ks + B_o);
endfunction