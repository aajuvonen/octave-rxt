## Convert Watts [W] to decibelmilliwatts [dBm]
##
## Input:   val__watt    Watt              [W]
##
## Output:  retval__dBm  decibelmilliwatt  [dBm]

function retval__dBm = watt2dbm(val__watt)
  retval__dBm = 30 + num2db(val__watt);
endfunction