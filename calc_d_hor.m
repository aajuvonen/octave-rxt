## Calculate smooth Earth radio horizon
##
## Inputs:   terminal 1 height  [m]
##           terminal 2 height  [m]
##
## Output:            distance  [km]

function retval = calc_d_hor(h1,h2)
  globals
  retval = 3.571*sqrt(K)*(sqrt(h1)+sqrt(h2));
endfunction