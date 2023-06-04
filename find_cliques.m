% Find cliques (strongly connected components) using octave-networks-toolbox

% TODO: honestly, this routine is embarrassing... for the life of me I can't figure 
% out how to output an arbitrary amount of arrays in a function in a sane way.
% Hence, the first fifty cliques are set in predetermined global variables, like
% it or not. I double dare you: tell me how to fix this.

function find_cliques(param_graph)
  disp("For now the function outputs all cliques as arrays of node indices.")
  disp("However, only the first fifty (50) will be assigned in variables 'node_clique_n'")
  disp("")
  disp("Finding cliques using Tarjan...")
  ticstart
  globals
    strongs = tarjan(adj2adjL(param_graph));              % Create list of strong components in cell array format
    j = 0;                                                % Initialise clique counter
    for i = 1:length(strongs)                             % Run the loop through the cell array 
      if(length(strongs{i}) > 1)                          % Process only cliques larger than one
        j++;                                              % Increment clique counter
        eval(['node_clique_' num2str(j) ' = strongs{i}']) % Set node_clique_n in sequence
      endif
    endfor
    node_clique_count = j                                 % Set node_clique_count to clique counter value
  ticstop
endfunction