clear all
close all
clc
ignore_function_time_stamp ("all")

globals                           % Declare global variables
constants                         % Set constants

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
  disp("   model_p1238.m        ITU-R P.1238-11 indoors propagation for small distances")
  disp("   model_its.m          Aeronautical path loss, curve fitted to ITU-R P.528-5 line-of-sight mode")
  disp("")

  disp("RxT can generate graphs for octave-networks-toolbox.")
  disp("   1. Clone https://github.com/aeolianine/octave-networks-toolbox")
  disp("   2. Navigate to 'octave-networks-toolbox/' to use its routines")
  disp("")

  disp("To get started, run exemplary aeronautical interference calculations with:")
  disp("   source example/aeronautical_interference.m")
  disp("")
endif