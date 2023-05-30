% Find cliques (strongly connected components) using octave-networks-toolbox

function find_cliques(param_graph)
  disp("Finding cliques using Tarjan... ")
  ticstart
  globals
    strongs = tarjan(adj2adjL(param_graph));             % Create list of strong components in cell array format
    j = 0;
    for i = 1:length(strongs)
      if(length(strongs{i}) > 1)
        j++;
        eval(['node_clique_' num2str(j) ' = strongs{i}'])
      endif
    endfor
  ticstop
endfunction