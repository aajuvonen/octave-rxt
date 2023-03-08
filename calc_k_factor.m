% Calculate Earth effective radius factor K
function calc_k_factor
  globals
  WVP = 6.1094*exp(17.625*(T_0-273.15)/(T_0-30.11));  % Water vapour pressure using August-Roche-Magnus -formula
  RRI = (77.6/T_0)*(QNH+(4810*WVP)/T_0);              % Radio refractivity index using ITU-R P.453-14 Eq. (7)
  K = 1/(1-0.04665*exp(0.005577*RRI));                % K-factor using Siwiak & Bahreini (2007) Eq. (4.14)
endfunction