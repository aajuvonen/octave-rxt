## Calculate Earth effective radius factor K

function calc_k_factor
  globals
    calc_rri
    K = 1 / (1 - 0.04665 * exp(0.005577 * RRI));  # K-factor using Siwiak & Bahreini (2007) Eq. (4.14)
endfunction