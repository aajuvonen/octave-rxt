% Convert desibels to a linear number
%
% Input:    decibel [dB]
% Output:   numeric

function retval = db2num(val)
  retval = 10^(val/10);
endfunction