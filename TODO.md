# Features
- support for time series and temporal graphs
- input validation to all routines
- error functions to all routines
- conventional headers to all routines
- automatic documentation generation
- JCR calculation so that instead of Johnson-Nyquist noise, J is used as the noise factor
- JCR calculation using channel capacity only
- Rice model for propagation loss
- Weissberger's model
- support for node angles
- support for `.ant` files (at minimum azimuth)
- coordinates: WGS84
- coordinates: MGRS
- coordinates: ETRS89
- graph radio coloring
- change logical clique drawing to reflect actual edges, not connecting all vertices 

# Refactoring
- prefix all globals with `rxt_`
- combine node data to structs

# Routines

## find_cliques.m and globals.m
- create a sane way to dynamically set only the necessary variables for graph cliques instead of using fixed globals

## calc_node_dist_alts.m
- add param_nodes

## calc_node_geodist_alts.m
- add param_nodes