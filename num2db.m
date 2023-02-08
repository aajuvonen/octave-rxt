% Convert a linear number to decibels
% Input: numeric
% Output: decibel [dB]

function retval = num2db(val)
  retval = 10*log10(val);
endfunction