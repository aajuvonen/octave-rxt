## Convert decibelmilliwatts [dBm] to Watts [W]
##
## Input:  val__dBm      decibelmilliwatt [dBm]
##
## Output: retval__watt  Watt  [W]

function retval__watt = dbm2watt(val__dBm)
  retval_watt = 10.^(val__dBm / 10) / 1000;
endfunction