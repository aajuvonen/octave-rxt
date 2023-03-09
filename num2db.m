% Convert a linear number to decibels
%
% Input:    decibel [dB]
% Output:   numeric

function retval = num2db(val)
  retval = 10*log10(val);
endfunction