## Convert geological distance and altitudes to approximate three dimensional ray distance
##
## Inputs:  geod__km    geo distance       [km]
##          h_1__meter  terminal 1 height  [m]
##          h_2__meter  terminal 2 height  [m]
##
## Output:  rayd__km    ray distance       [km]

function rayd__km = geod2rayd(geod__km, h_1__meter, h_2__meter)
  globals
  rayd__km = sqrt(geod__km^2 + ((max([h_1__meter, h_2__meter]) - min([h_1__meter, h_2__meter])) / 1000)^2);
endfunction