%%% UNFINISHED

% Calculate node received powers using ITU-R P.528-5 implementation by Ivica Stevanovic https://doi.org/10.5281/zenodo.6984262
function calc_node_rx_pwr_p528
  disp("Calculating node received powers using ITU-R P.528-5...")
  tic
  calc_node_geodist_alts;
  global node_geodist_alts;
  global node_tx_pwr;
  global node_rx_pwr;
  global f;
  global q;

  p528_result = zeros(length(node_geodist_alts),length(node_geodist_alts));
  for i = 1:length(node_geodist_alts)
    for j = 1:length(node_geodist_alts)
      p528_result(i,j) = tl_p528(node_geodist_alts(i,j,1),min(node_geodist_alts(i,j,2:3)),max(node_geodist_alts(i,j,2:3)),f,0,q).("A__db");
    endfor
  endfor

  node_rx_pwr = -1*p528_result - watt2dbm(node_tx_pwr);
  toc
endfunction