% Create a new graph of the same size with selected nodes
%
% Input:    param_graph  arr.  An adjacency matrix of the graph to be sliced
%           param_nodes  num.  An array with node indices
% Output:  graph_sliced  arr.  An adjacency matrix of the sliced graph

function graph_sliced = edit_graph_slice(param_graph,param_nodes)
  globals
    graph_sliced = zeros(size(param_graph));                           % Initialise the sliced graph
    for i = 1:length(param_nodes)
      graph_sliced(param_nodes(i),:) = param_graph(param_nodes(i),:);  % Fill rows
      graph_sliced(:,param_nodes(i)) = param_graph(:,param_nodes(i));  % Fill cols
    endfor
  if(hints) disp("   Sliced adjacency matrix generated to 'graph_sliced") endif
endfunction