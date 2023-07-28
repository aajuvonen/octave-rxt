## Graph node logical
##
## Input:   param_graph         arr.  Adjacency matrix
##
## Output:  graph_node_logical  arr.  Adjacency matrix

function draw_graph_node_logical(param_graph)
  disp("Graphing node logical view... ")
  ticstart
  globals

    ## Initialize an empty graph for logical connections and find physical layer's strongly connected components
    graph_node_logical = logical(zeros(node_count, node_count));
    find_cliques(param_graph);

    ## Loop through node cliques and populate the logical graph accordingly
    for i = 1:node_clique_count
      for j = eval(['node_clique_' num2str(i)])
        graph_node_logical(j, eval(['node_clique_' num2str(i)])) = 1;
      endfor
    endfor

  ticstop
  if(hints) disp("   Node logical adjacency matrix generated to 'graph_node_logical'") endif
  if(hints) disp("   Use 'graph_node_logical' as a second argument to 'plot_graph' to plot graph") endif
endfunction