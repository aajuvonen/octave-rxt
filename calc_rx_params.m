% Calculate receiver parameters
function calc_rx_params
  global N_ktb;             % [W/Hz] Transceiver thermal noise
  global N_0;               % [dBm]  Transceiver thermal noise in decibelmilliwatts
  global N_tot;             % [dBm]  Transceiver noise floor
  global S_min;             % [dBm]  Transceiver detection threshold
  global L_sf;              % [dB]   Path loss variation for the corresponding time availability
  N_ktb = k*T_0*B;
  N_0 = watt2dbm(N_ktb);
  N_tot = N_0 + N_F + L_sf;
  S_min = N_tot + SNR_req;
endfunction