## Calculate receiver parameters

function calc_rx_params
  globals
    N_ktb = k_B * T_0 * B__Hz;
    N_0 = watt2dbm(N_ktb);
    N_tot__dBm = N_0 + N_F__dB + L_sf__dB;
    S_min__dBm = N_tot__dBm + SNR_req__dB;
endfunction