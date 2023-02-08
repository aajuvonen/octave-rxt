% Calculate Earth effective radius factor K
function calc_k_factor
  global T_0;
  global QNH;
  global WVP; % Water vapour pressure using August-Roche-Magnus -formula
  global RRI; % Radio refractivity index using ITU-R P.453-14 Eq. (7)
  global K;   % K-factor using Siwiak & Bahreini (2017) Eq. (4.14)
  WVP = 6.1094*exp(17.625*(T_0-273.15)/(T_0-30.11));
  RRI = (77.6/T_0)*(QNH+(4810*WVP)/T_0);
  K = 1/(1-0.04665*exp(0.005577*RRI));
endfunction