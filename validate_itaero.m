% This function generates CSV tables with the itaero model. The routine is 
% useful for making comparisons with P.528 data.

% Itaero is best suited for ballpark calculations for LOS links. There is a 
% tendency to underestimate diffraction. The worst performance is associated 
% with large delta altitudes. Itaero is generally more optimistic than P.528. 
% On average itaero deviates about 2 dB from P.528 per 100 km.

% Performance           0...100 101...200 201...300 301...400 401...500 km
% ------------------------------------------------------------------------
% Average delta            0.39      4.27      9.22     10.06     10.18 dB
% Worst optimistic        15.09     29.53     32.83     31.07     28.15 dB
% Worst pessimistic       -9.87     -9.89     -6.24     -4.48     -4.99 dB
% p=50 Average delta       0.22      5.45     11.30     12.22     12.16 dB
% p=50 Worst optimistic   10.95     28.44     29.25     27.04     25.74 dB
% p=50 Worst pessimistic  -0.29     -0.30     -0.28     -0.28     -0.24 dB

% The above delta values are generated with the following parameters:
% Terminal 1 heights:  1000, 1000, 1000, 10000, 20000 m
% Terminal 2 heights:    15,   60, 1000,  1000, 10000 m
% Distance:                                   0...500 km
% Frequencies:                      100,   300,   600 MHz
% Probabilities:                      1,    50,    99 %

function validate_itaero
  globals
  constants

  % Mute warnings
  warnings_orig = warnings;
  warnings = false;

  % Input parameters
  h1 = [1000,1000,1000,10000,20000];
  h2 = [15,60,1000,1000,10000];
  dist = 0:1000;
  prob = [1,50,95];
  freq = [100,300,600];
  T_0 = 289;
  QNH = 969;
  calc_k_factor;

  % Initialise result vector
  result = zeros(length(h1),1000,length(prob),length(freq));

  for i = 1:length(h1)
    for j = dist+1
      for k = 1:length(prob)
        for l = 1:length(freq)
          f = freq(l);
          result(i,j,k,l) = model_itaero(geod2rayd(dist(j),h1(i),h2(i)),h1(i),h2(i),prob(k));
        end
      end
    end
  end

  % Unmute warnings
  warnings = warnings_orig;

  csvwrite ("tables/itaero_out100_1_1.csv",result(1,:,1,1));
  csvwrite ("tables/itaero_out100_1_2.csv",result(2,:,1,1));
  csvwrite ("tables/itaero_out100_1_3.csv",result(3,:,1,1));
  csvwrite ("tables/itaero_out100_1_4.csv",result(4,:,1,1));
  csvwrite ("tables/itaero_out100_1_5.csv",result(5,:,1,1));
  csvwrite ("tables/itaero_out100_50_1.csv",result(1,:,2,1));
  csvwrite ("tables/itaero_out100_50_2.csv",result(2,:,2,1));
  csvwrite ("tables/itaero_out100_50_3.csv",result(3,:,2,1));
  csvwrite ("tables/itaero_out100_50_4.csv",result(4,:,2,1));
  csvwrite ("tables/itaero_out100_50_5.csv",result(5,:,2,1));
  csvwrite ("tables/itaero_out100_95_1.csv",result(1,:,3,1));
  csvwrite ("tables/itaero_out100_95_2.csv",result(2,:,3,1));
  csvwrite ("tables/itaero_out100_95_3.csv",result(3,:,3,1));
  csvwrite ("tables/itaero_out100_95_4.csv",result(4,:,3,1));
  csvwrite ("tables/itaero_out100_95_5.csv",result(5,:,3,1));

  csvwrite ("tables/itaero_out300_1_1.csv",result(1,:,1,2));
  csvwrite ("tables/itaero_out300_1_2.csv",result(2,:,1,2));
  csvwrite ("tables/itaero_out300_1_3.csv",result(3,:,1,2));
  csvwrite ("tables/itaero_out300_1_4.csv",result(4,:,1,2));
  csvwrite ("tables/itaero_out300_1_5.csv",result(5,:,1,2));
  csvwrite ("tables/itaero_out300_50_1.csv",result(1,:,2,2));
  csvwrite ("tables/itaero_out300_50_2.csv",result(2,:,2,2));
  csvwrite ("tables/itaero_out300_50_3.csv",result(3,:,2,2));
  csvwrite ("tables/itaero_out300_50_4.csv",result(4,:,2,2));
  csvwrite ("tables/itaero_out300_50_5.csv",result(5,:,2,2));
  csvwrite ("tables/itaero_out300_95_1.csv",result(1,:,3,2));
  csvwrite ("tables/itaero_out300_95_2.csv",result(2,:,3,2));
  csvwrite ("tables/itaero_out300_95_3.csv",result(3,:,3,2));
  csvwrite ("tables/itaero_out300_95_4.csv",result(4,:,3,2));
  csvwrite ("tables/itaero_out300_95_5.csv",result(5,:,3,2));

  csvwrite ("tables/itaero_out600_1_1.csv",result(1,:,1,3));
  csvwrite ("tables/itaero_out600_1_2.csv",result(2,:,1,3));
  csvwrite ("tables/itaero_out600_1_3.csv",result(3,:,1,3));
  csvwrite ("tables/itaero_out600_1_4.csv",result(4,:,1,3));
  csvwrite ("tables/itaero_out600_1_5.csv",result(5,:,1,3));
  csvwrite ("tables/itaero_out600_50_1.csv",result(1,:,2,3));
  csvwrite ("tables/itaero_out600_50_2.csv",result(2,:,2,3));
  csvwrite ("tables/itaero_out600_50_3.csv",result(3,:,2,3));
  csvwrite ("tables/itaero_out600_50_4.csv",result(4,:,2,3));
  csvwrite ("tables/itaero_out600_50_5.csv",result(5,:,2,3));
  csvwrite ("tables/itaero_out600_95_1.csv",result(1,:,3,3));
  csvwrite ("tables/itaero_out600_95_2.csv",result(2,:,3,3));
  csvwrite ("tables/itaero_out600_95_3.csv",result(3,:,3,3));
  csvwrite ("tables/itaero_out600_95_4.csv",result(4,:,3,3));
  csvwrite ("tables/itaero_out600_95_5.csv",result(5,:,3,3));

endfunction
