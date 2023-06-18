## Calculate atmosphere radio refractivity index

function calc_rri
  globals
    if(!isempty(QNH) && !isempty(T_0))
      WVP = 6.1094 * exp(17.625 * (T_0 - 273.15) / (T_0 - 30.11));  # Water vapour pressure using August-Roche-Magnus -formula
      RRI = (77.6 / T_0) * (QNH + (4810 * WVP) / T_0);              # Radio refractivity index using ITU-R P.453-14 Eq. (7)
    elseif(!isempty(K))
      RRI = (1e6 * log((2e4 * (K - 1)) / (933 * K))) / 5577;        # Inverse of Siwiak & Bahreini (2007) Eq. (4.14)
    endif
endfunction