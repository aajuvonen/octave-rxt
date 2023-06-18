## Calculate smooth Earth radio horizon
##
## Inputs:  h_1__meter  terminal 1 height  [m]
##          h_2__meter  terminal 2 height  [m]
##
## Output:  d__km       distance           [km]

function d__km = calc_d_hor(h_1__meter, h_2__meter)
  globals
  d__km = 3.571 * sqrt(K) * (sqrt(h_1__meter) + sqrt(h_2__meter));
endfunction