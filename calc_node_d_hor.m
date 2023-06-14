## Calculate node radio horizons 
##
## Input:   node index array

function calc_node_d_hor(param_nodes)
  disp("Calculating node radio horizons... ")
  ticstart
  globals
    if(!exist("param_nodes"))
      param_nodes = 1:node_count;                                         # Default to include all nodes
      node_d_hor_single = zeros(node_count,node_count);                   # Initialise singular horizon vector
      node_d_hor = zeros(node_count,node_count,2);                        # Initialise combined horizon vector
    else
      node_d_hor_single = zeros(length(param_nodes),length(param_nodes)); # Initialise singular horizon vector
      node_d_hor = zeros(length(param_nodes),length(param_nodes),2);      # Initialise combined horizon vector
    endif
    node_d_hor_single = calc_d_hor((node_xyz(param_nodes,3).*1000),0);    # Calculate singular radio horizons
    node_d_hor(:,:,1) += (node_xyz(param_nodes,3).*1000);                 # Node altitudes in [m] in rows
    node_d_hor(:,:,2) += (node_xyz(param_nodes,3)'.*1000);                # Node altitudes in [m] in cols
    node_d_hor(:,:,2) = node_d_hor(:,:,2).*~eye(size(node_d_hor(:,:,2))); # Replace diagonal with zeros
    node_d_hor = calc_d_hor(node_d_hor(:,:,1),node_d_hor(:,:,2));         # Calculate total radio horizons
  ticstop
  if(hints) disp("   Call 'plot_node_d_hor' to plot graph") endif
endfunction