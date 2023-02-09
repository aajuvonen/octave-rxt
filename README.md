# RXT - Octave scripts for radio network modelling and graph generation

**RXT**, or **Rx Toolkit**, is meant for quick feasibility calculations when a napkin and a ball-point pen just don't quite cut it. The scripts incorporate simple radio propagation estimation routines and rudimentary plotting capabilities. RXT is not meant to replace or compete with professional radio network planning and analysis software such as **HTZ Warfare** or **WRAP**.

Nothing beats pen and paper, really, unless you need volume. Moreover, professional software is hardly transparent. More often than not their feature sets are also total overkills for quick work.

Enter RXT: it pulls off thousands upon thousands ballpark propagation and interference analysis calculations in a transparent manner.

Development objectives:
* Accurate modelling where reasonable, otherwise usability and speed is prioritised.
* Routines for generating radio network graphs (in graph theoretic sense) compatible with `octave-networks-toolbox`.
* Feature creep avoidance.

## How to use?

Install GNU/Octave or MatLab.

Clone the repository and run `rxt.m`.

### Function reference

Lorem Ipsum

### What is the ITS path loss model?

Calculate path loss using ITS by running `calc_node_path_loss_its.m`

It's a poor man's curve-fitted approximation of ITU-R P.528-5. The model is fairly usable in the frequency range of around 100-400 MHz and in altitudes some hundreds of meters above the ground.

The model has two primary perks over FSL:
1. Time availability in line-of-sight propagation estimation
2. Trans-horizon propagation path loss estimation


## Dependencies

The development and testing has been conducted on GUN/Octave. Most of the functions are MatLab-compatible, but the plotting routines are (probably) not.

Required external resources:
* `plot_node_d_hor.m` depends on `matgeom`. To install `matgeom` run `pkg install -forge matgeom`.

* `plot_worker.m` depends on matgeom and `octave-networks-toolbox`. To use `octave-networks-toolbox` copy it to `rxt`'s directory (e.g., by running `git clone https://github.com/aeolianine/octave-networks-toolbox`). Rename the folder to `private`. This allows Octave to run the scripts.


# License

MIT license. Read more in LICENSE.md