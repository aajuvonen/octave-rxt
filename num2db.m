## Convert a linear number to decibels
##
## Input:  val__dB      decibel  [dB]
##
## Output: retval__num  numeric  num.

function retval__num = num2db(val__dB)
  retval__num = 10 * log10(val__dB);
endfunction