## Calculate urban and galactic noise according to ITU-R P.372-16
##
## Inputs: param_env  Environment           num.  City, residential, rural, quiet rural, galactic noise
##
## Output: N_u__dB    Urban noise over kTB  [dB]

function N_u__dB = calc_noise_p372(param_env = 1)
  globals
  noise_freqs = [0.3,250; 0.3,250; 0.3,250; 0.3,30; 10,150];
  coeff = [76.8,27.7; 72.5,27.7; 67.2,27.7; 53.6,28.6; 52.0,23.0];

  if(warnings)
    if(f < noise_freqs(param_env,1)) printf("Warning: frequency lower than model minimum %d", noise_freqs(param_env,1)), disp(" MHz") endif
    if(f > noise_freqs(param_env,2)) printf("Warning: frequency exceeds model maximum %d", noise_freqs(param_env,2)), disp(" MHz") endif
  endif

  N_u__dB = coeff(param_env,1) - coeff(param_env,2) * log10(f);
endfunction