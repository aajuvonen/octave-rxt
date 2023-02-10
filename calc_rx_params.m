% Calculate receiver parameters
function calc_rx_params
  globals;
  N_ktb = k*T_0*B;
  N_0 = watt2dbm(N_ktb);
  N_tot = N_0 + N_F + L_sf;
  S_min = N_tot + SNR_req;
endfunction