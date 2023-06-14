# RxT - Octave scripts for radio network modelling and graph generation

**RxT**, or **Rx Toolkit**, is meant for quick feasibility calculations when a napkin and a ball-point pen just don't quite cut it. The scripts incorporate simple radio propagation estimation routines and rudimentary plotting capabilities. RxT is not meant to replace or compete with professional radio network planning and analysis software such as **HTZ Warfare** or **WRAP**.

Nothing beats pen and paper unless you need volume. Moreover, professional software is hardly transparent, and more often than not their feature sets are overkills for quick work. Enter RxT: it pulls off thousands upon thousands ballpark propagation and interference analysis calculations in a transparent manner.

Development objectives:
* Accurate modelling where reasonable, otherwise usability and speed is prioritised.
* Routines for generating radio network graphs (in graph theoretic sense) compatible with `octave-networks-toolbox`.
* Feature creep avoidance, over-engineering avoidance, and FAFO compliance.

# How to use?

Install GNU/Octave or MatLab.

Clone the repository and run `rxt.m`.

## Function reference

Lorem Ipsum


## Using with octave-networks-toolbox

1. Clone `octave-networks-toolbox` (e.g., `git clone https://github.com/aeolianine/octave-networks-toolbox`).
2. In Octave run `rxt.m` and, for example, `source example/aeronautical_interference.m`
3. Run `testAllFunctions` to see which `octave-networks-toolbox` routines work with your version of Octave.
4. Run for example `linkDensity(graph_node_jsr)` to confirm that routines are accessible correctly. To find strongly connected components, run `tarjan(adj2adjL(graph_node_jsr))`.


### What is the itaero path loss model?

Calculate path loss using itaero by running `calc_node_path_loss_itaero.m`

It's a poor man's curve-fitted approximation of ITU-R P.528-5. The model is fairly usable in the frequency range of around 100-600 MHz and in altitudes some hundreds of meters above the ground.

The model has two primary perks over FSL:
1. Estimation of time availability in line-of-sight propagation
2. Estimation of trans-horizon propagation path loss


### What is FAFO compliance?

Fool around, find out.


## Dependencies

The development and testing has been conducted on GUN/Octave. Most functions are MatLab-compatible, but the plotting routines are (probably) not.

Required external resources:
* `plot_node_d_hor.m` depends on `matgeom`. To install `matgeom` run `pkg install -forge matgeom`.
* `plot_worker.m` depends on `matgeom` and `octave-networks-toolbox`.



# License

MIT license. Read more in LICENSE.md