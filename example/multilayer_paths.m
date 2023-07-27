disp("Exemplary multilayer graphs")
disp("   Artturi Juvonen 2023")
disp("   artturi@juvonen.eu")
disp("")

## Start with aeronautical interference
source example/aeronautical_interference.m

clip_nodes = 10;                                                                # The number to reduce the node count to
node_xyz = node_xyz(1:clip_nodes, :);                                           # Reduce node_xyz size
node_tx_pwr = node_tx_pwr(1:clip_nodes, :);                                     # Reduce node_tx_pwr size
graph_node_jsr = graph_node_jsr(1:clip_nodes, 1:clip_nodes);                    # Reduce graph_node_jsr size
aux_nodes = 5;                                                                  # The number of nodes to clone and append
node_xyz = [node_xyz; node_xyz(1:aux_nodes,:)];                                 # Clone and append nodes to node_xyz
node_count = clip_nodes + aux_nodes;                                            # Add the number to node_count also
graph_node_jsr = edit_graph_mash(graph_node_jsr, zeros(aux_nodes, aux_nodes));  # Append graph_node_jsr with empty rows and cols
plot_graph(graph_node_jsr);
gplot(edit_graph_mash(zeros(clip_nodes, clip_nodes), ones(aux_nodes, aux_nodes)), node_xyz(1:end,1:2), "m")