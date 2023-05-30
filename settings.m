% Output options
global warnings = true;           % bool   Print warnings
global hints = true;              % bool   Print hints
global counter = true;            % bool   Print running times

global warnings_octave = false;   % bool   Print octave warnings
  if(!warnings_octave) warning("off","all") endif

% Octave-networks-toolbox related
global graphtools = !isempty(dir_in_loadpath("./octave-networks-toolbox"));
  if(graphtools) addpath("./octave-networks-toolbox") endif