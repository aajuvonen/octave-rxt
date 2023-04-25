% Output options
global warnings = true;           % bool   Print warnings
global hints = true;              % bool   Print hints
global counter = true;            % bool   Print running times

global warnings_octave = false;   % bool   Print octave warnings
  if(!warnings_octave) warning("off","all") endif

% Octave-networks-toolbox related
global nettools = !isempty(dir_in_loadpath("./octave-networks-toolbox"));
  if(nettools) addpath("./octave-networks-toolbox") endif