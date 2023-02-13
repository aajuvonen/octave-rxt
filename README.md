# RxT - Octave scripts for radio network modelling and graph generation

**RxT**, or **Rx Toolkit**, is meant for quick feasibility calculations when a napkin and a ball-point pen just don't quite cut it. The scripts incorporate simple radio propagation estimation routines and rudimentary plotting capabilities. RxT is not meant to replace or compete with professional radio network planning and analysis software such as **HTZ Warfare** or **WRAP**.

Nothing beats pen and paper, really, unless you need volume. Moreover, professional software is hardly transparent. More often than not their feature sets are also total overkills for quick work.

Enter RxT: it pulls off thousands upon thousands ballpark propagation and interference analysis calculations in a transparent manner.

Development objectives:
* Accurate modelling where reasonable, otherwise usability and speed is prioritised.
* Routines for generating radio network graphs (in graph theoretic sense) compatible with `octave-networks-toolbox`.
* Feature creep avoidance.

# How to use?

Install GNU/Octave or MatLab.

Clone the repository and run `rxt.m`.

## Function reference

Lorem Ipsum


## Using with octave-networks-toolbox

The following sequence sequence avoids having RxT's routines in the same folder with `octave-networks-toolbox`'s, and allows using RxT's graphs in `octave-networks-toolbox`'s routines:

1. Copy `octave-networks-toolbox` to RxT's directory (e.g., by running `git clone https://github.com/aeolianine/octave-networks-toolbox`).
2. Rename the `octave-networks-toolbox/` directory to `private/`. This allows Octave to run the scripts.
3. Navigate to `rxt/private/` and run Octave (e.g., `octave --gui`). Use `cd ..` in Octave to navigate to `rxt/`
4. Run `rxt`, and navigate back to `octave-networks-toolbox` directory with `cd private/`

`example/aeronautical_interference.m` will be used in the following examples as a data source source. Run for example `linkDensity(graph_node_jsr)` to confirm that routines are accessible correctly. To find strongly connected components, run `tarjan(adj2adjL(graph_node_jsr))`.


### What is the ITS path loss model?

Calculate path loss using ITS by running `calc_node_path_loss_its.m`

It's a poor man's curve-fitted approximation of ITU-R P.528-5. The model is fairly usable in the frequency range of around 100-400 MHz and in altitudes some hundreds of meters above the ground.

The model has two primary perks over FSL:
1. Estimation of time availability in line-of-sight propagation
2. Estimation of Trans-horizon propagation path loss


## Dependencies

The development and testing has been conducted on GUN/Octave. Most of the functions are MatLab-compatible, but the plotting routines are (probably) not.

Required external resources:
* `plot_node_d_hor.m` depends on `matgeom`. To install `matgeom` run `pkg install -forge matgeom`.
* `plot_worker.m` depends on matgeom and `octave-networks-toolbox`.



# License

MIT license. Read more in LICENSE.md