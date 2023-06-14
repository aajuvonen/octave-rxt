# Features
- support for time series and temporal graphs
- calculate degree matrix
- calculate Laplace matrix
- input validation to all routines
- error functions to all routines
- conventional headers to all routines
- automatic documentation generation
- JCR calculation so that instead of Johnson-Nyquist noise, J is used as the noise factor
- JCR calculation using channel capacity only
- Rice model for propagation loss
- urban noise P.372
- Weissberger's model
- support for node angles
- support for `.ant` files (at minimum azimuth)
- coordinates: WGS84
- coordinates: MGRS
- coordinates: ETRS89
- graph radio coloring

# Refactoring
- prefix all globals with `rxt_`
- change `%` comments to `#` and `##`
- combine node data to structs

# Routines

## find_cliques.m and globals.m
- create a sane way to dynamically set only the necessary variables for graph cliques instead of using fixed globals

## calc_node_jam_ring.m
- if param_dist is empty, automatically calculate arithmetic mean of node distances, ignoring the jamming node

## plot_worker.m
- get graph axes from node coordinates