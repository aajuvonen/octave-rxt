clear all
close all
clc
ignore_function_time_stamp ("all")

globals                           # Declare global variables
constants                         # Set constants

disp("RxT - Radio network modelling and graph generation")
disp("   Artturi Juvonen 2023")
disp("   artturi@juvonen.eu")
disp("   MIT license, see LICENSE.md")
disp("")

if(hints)
  if(warnings)
  disp("Warnings enabled.       Disable by setting 'warnings' to 'false'.") endif
  if(counter)
  disp("Runtime timer enabled.  Disable by setting 'counter' to 'false'.") endif
  disp("Hints enabled.          Disable by setting 'hints' to 'false'.\n")

  disp("Path loss models:")
  disp("   model_fsl.m          Generic spreading loss with parametric loss exponent")
  disp("   model_hata_mod.m     Modified Hata for urban environments")
  disp("   model_overhor.m      Empirical beyond-the-horizon propagation")
  disp("   model_p1238.m        ITU-R P.1238-11 indoors propagation for small distances (in meters)")
  disp("   model_itaero.m       Aeronautical path loss, curve fitted to ITU-R P.528-5 line-of-sight mode")
  disp("")

  disp("RxT can generate graphs for octave-networks-toolbox.")
  if(!graphtools)
  disp("   'octave-networks-toolbox/' folder not found.")
  disp("   Clone https://github.com/aeolianine/octave-networks-toolbox") endif
  if(graphtools)
  disp("   Generate graphs with RxT (e.g. 'graph_node_jsr')")
  disp("   Hints for octave-networks-toolbox are marked with '*'") endif
  disp("")

  disp("To get started, run exemplary aeronautical interference calculations with:")
  disp("   source example/aeronautical_interference.m")
  disp("")
endif