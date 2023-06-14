## Routine to stop timer

function ticstop
  settings
  if(counter)
    printf('   Runtime %3f seconds.\n', toc)
  endif
endfunction