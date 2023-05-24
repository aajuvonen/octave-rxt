% Calculate node jamming rings
%
% Inputs:   jammer node index  int. (1)    Jammer node's index, default is 1
%             victim distance  [km] (avg.) Distance between jammed nodes, default is average distance (excluding jammer)
%             victim channels  int. (1)    Number of jammed channels, default is 1
%          path loss exponent  num. (2)    Loss exponent, default is 2 (equivalent to free space spreading loss)
%           power loss factor  num. (4)    Power loss factor per victim channels, default is 4 (-6.02 dB)
%
% Output:            distance  [km]

function calc_node_jam_ring
  disp("Calculating node jamming rings... ")
  ticstart
  globals
    % routine
  ticstop
  if(hints) disp("   Call 'plot_node_jam_ring' to plot graph") endif
endfunction