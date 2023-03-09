% Convert geological distance and altitudes to approximate three dimensional ray distance
%
% Inputs:  geo distance (geod)  [km]
%            terminal 1 height  [m]
%            terminal 2 height  [m]
%            time availability  [%]
%
% Output:  ray distance (rayd)  [km]

function rayd = geod2rayd(geod,h1,h2)
  globals
  rayd = sqrt(geod^2+((max([h1,h2])-min([h1,h2]))/1000)^2);
endfunction