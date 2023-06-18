## Convert desibels to a linear number
##
## Input:  val__dB      decibel  [dB]
##
## Output: retval__num  numeric  num.

function retval__num = db2num(val__dB)
  retval__num = 10.^(val__dB ./ 10);
endfunction