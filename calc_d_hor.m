% Calculate smooth Earth radio horizon
%
% Inputs:   terminal 1 height  [m]
%           terminal 2 height  [m]
%
% Output:            distance  [km]

function calc_d_hor = calc_d_hor(h1,h2)
  globals
  calc_d_hor = 3.571*sqrt(K)*(sqrt(h1)+sqrt(h2));
endfunction