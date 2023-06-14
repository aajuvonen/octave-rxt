## Convert decibelmilliwatts [dBm] to Watts [W]
##
## Input:  decibelmilliwatt  [dBm]
## Output:             Watt  [W]

function retval = dbm2watt(val)
  retval = 10.^(val/10)/1000;
endfunction