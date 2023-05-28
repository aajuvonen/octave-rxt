% Calculate node jamming rings
%
% Inputs:   jammer node index  ind. (1st)  Jammer node's index, default is 1
%             victim TX power  [W]         Victim nodes' transmit power
%             victim distance  [km] (avg.) Distance between jammed nodes, default is average distance (excluding jammer)
%             victim channels  int. (1)    Number of jammed channels, default is 1
%          path loss exponent  num. (2)    Loss exponent, default is 2 (equivalent to free space spreading loss)
%                required JSR  num. (1)    Required jamming-to-signal ratio (default 1:1)
%           power loss factor  num. (4)    Power loss factor per victim channels, default is 4 (-6.02 dB)
%
% Output:            distance  [km]

function calc_node_jam_ring(param_jammer = 1,param_victim_tx_pwr,param_victim_dist,param_victim_chans = 1,param_alpha = 2,param_jsr_req = 1,param_jammer_pwrloss = 4)
  disp("Calculating node jamming rings... ")
  ticstart
  globals
    % TODO: if param_dist is empty, automatically calculate arithmetic mean of node distances, ignoring the jamming node
    
    node_jam_ring = zeros(param_victim_chans,1);
    for i = 1:param_victim_chans
      node_jam_ring(i) = param_victim_dist * param_jammer_pwrloss^((1-i) / param_alpha) * ((param_jsr_req * param_victim_tx_pwr) / node_tx_pwr(param_jammer))^(-1 / param_alpha);
    endfor
  ticstop
  if(hints) disp("   Call 'plot_node_jam_ring' to plot graph") endif
endfunction