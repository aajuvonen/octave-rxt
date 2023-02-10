% Calculate smooth Earth radio horizon
% Inputs: Terminal heights [m]
% Output: Combined radio horizon distance [km]

function calc_d_hor = calc_d_hor(h1,h2)
  globals
  calc_d_hor = 3.571*sqrt(K)*(sqrt(h1)+sqrt(h2));
endfunction