## Natual constants
c = 299792458;            # [m/s]  Speed of light
k_B = 1.38064852*10^-23;  # [J/K]  Bolzmann's constant

## Inverse of the standard normal cumulative distribution
norm_inv = [-2.326,-2.054,-1.881,-1.751,-1.645,-1.555,-1.476,-1.405,-1.341,-1.282,-1.227,-1.175,-1.126,-1.080,-1.036,-0.994,-0.954,-0.915,-0.878,-0.842,-0.806,-0.772,-0.739,-0.706,-0.674,-0.643,-0.613,-0.583,-0.553,-0.524,-0.496,-0.468,-0.440,-0.412,-0.385,-0.358,-0.332,-0.305,-0.279,-0.253,-0.228,-0.202,-0.176,-0.151,-0.126,-0.100,-0.075,-0.050,-0.025,0.000,0.025,0.050,0.075,0.100,0.126,0.151,0.176,0.202,0.228,0.253,0.279,0.305,0.332,0.358,0.385,0.412,0.440,0.468,0.496,0.524,0.553,0.583,0.613,0.643,0.674,0.706,0.739,0.772,0.806,0.842,0.878,0.915,0.954,0.994,1.036,1.080,1.126,1.175,1.227,1.282,1.341,1.405,1.476,1.555,1.645,1.751,1.881,2.054,2.326];

## Precalculated alphas, curve fitted to ITU-R P.528-5 line-of-sight propagatio mode
alpha_curve = [1.558,1.610,1.643,1.667,1.687,1.705,1.720,1.733,1.745,1.757,1.767,1.777,1.786,1.795,1.803,1.811,1.819,1.826,1.833,1.840,1.847,1.853,1.860,1.866,1.872,1.878,1.884,1.889,1.895,1.900,1.906,1.911,1.916,1.922,1.927,1.932,1.937,1.942,1.947,1.952,1.957,1.962,1.966,1.971,1.976,1.981,1.986,1.990,1.995,2.000,2.009,2.018,2.026,2.035,2.044,2.053,2.062,2.071,2.080,2.089,2.098,2.107,2.116,2.125,2.135,2.144,2.154,2.164,2.174,2.184,2.194,2.204,2.214,2.225,2.236,2.247,2.259,2.270,2.282,2.295,2.307,2.320,2.334,2.348,2.363,2.378,2.394,2.411,2.429,2.449,2.469,2.492,2.517,2.544,2.576,2.613,2.658,2.719,2.814];