## Convert Watts [W] to decibelmilliwatts [dBm]
## Input:              Watt  [W]
## Output: decibelmilliwatt  [dBm]

function retval = watt2dbm(val)
  retval = 30 + num2db(val);
endfunction