clear all
close all
clc
ignore_function_time_stamp ("all")

globals                           % Declare global variables
constants                         % Set constants

% Ambient parameters
T_0 = 270;                        % [K]    Ambient temperature
QNH = 961;                        % [hPa]  Atmospheric pressure
q = 50;                           % [%]    Channel time availability
L_sf_std = 6;                     % [dB]   Path loss variation standard deviation
L_sf = L_sf_std*norm_inv(q);      % [dB]   Path loss variation for the corresponding time availability
calc_k_factor;                    % Calculate Earth effective radius factor K

% Receiver parameters
f = 100;                          % [MHz]  Transceiver frequency
B = 25000;                        % [Hz]   Transceiver bandwidth
N_F = 10;                         % [dB]   Transceiver noise figure
SNR_req = 10;                     % [dB]   Transceiver signal-to-noise ratio requirement
calc_rx_params;                   % Calculate receiver parameters

%%% UNFINISHED PARAMETERS BEGIN
% Missing calculation routines
% Missing antenna files and directivity data
L_int = 0;                        % [dB]   Transceiver cumulative internal losses
G_pro = 0;                        % [dB]   Transceiver processing gain
G_ant = 0;                        % [dB]   Transceiver antenna gain
%%% UNFINISHED PARAMETERS END

% Run exemplary aeronautical interference calculations
source example/aeronautical_interference.m