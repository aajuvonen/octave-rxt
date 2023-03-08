% Calculate path losses using modified Hata model, following Siwiak & Bahreini (2007) Eq. (7.17)-(7.23)

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
    if(param_h1 < 30) disp("Warning: terminal 1 height lower than model minimum 30 m") endif
    if(param_h1 > 300) disp("Warning: terminal 1 height exceeds model maximum 300 m") endif
    if(param_h2 < 1) disp("Warning: terminal 2 height lower than model minimum 1 m") endif
    if(param_h2 > 10) disp("Warning: terminal 2 height exceeds model maximum 10 m") endif
    if(param_b < 3) disp("Warning: building percentage lower than model minimum 3 %") endif
    if(param_b > 50) disp("Warning: building percentage exceeds model maximum 50 %") endif
    if(f < 100) disp("Warning: frequency lower than model minimum 100 MHz") endif
    if(f > 3000) disp("Warning: frequency exceeds model maximum 3000 MHz") endif
  endif

  % Eq. (7.17)
  L_ccir = ;


  path_loss_hata = 0;
endfunction