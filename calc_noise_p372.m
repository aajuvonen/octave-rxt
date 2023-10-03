## Calculate urban and galactic noise according to ITU-R P.372-16
##
## Inputs: param_env   Environment     num.  City, residential, rural, quiet rural, galactic noise
##
## Output: N_p372__dB  Noise over kTB  [dB]

function N_p372__dB = calc_noise_p372(param_env = 1)
  globals
  if(funcinfo) disp("Calculating noise factors according to ITU-R P.372-16...") endif

  noise_freqs = [0.3,250; 0.3,250; 0.3,250; 0.3,30; 10,150];
  coeff = [76.8,27.7; 72.5,27.7; 67.2,27.7; 53.6,28.6; 52.0,23.0];

  if(warnings)
    if(f < noise_freqs(param_env,1)) printf("Warning: frequency lower than model minimum %d", noise_freqs(param_env,1)), disp(" MHz") endif
    if(f > noise_freqs(param_env,2)) printf("Warning: frequency exceeds model maximum %d", noise_freqs(param_env,2)), disp(" MHz") endif
  endif

  N_p372__dB = param_env;

  for i = 1:size(param_env,1)
    for j = 1:size(param_env,2)
      N_p372__dB(i,j) = coeff(N_p372__dB(i,j), 1) - coeff(N_p372__dB(i,j), 2) .* log10(f__MHz);
    endfor
  endfor

endfunction