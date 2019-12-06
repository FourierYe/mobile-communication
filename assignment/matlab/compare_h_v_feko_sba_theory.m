clear
clc

% measured data v-v
measured_data_v = [
    0	9.3	9.44
    0.5	6.22	6.32
    1	1.72	1.79
    1.5	-2.16	-2.1
    2	-3.66	-3.57
    2.5	-5.54	-5.47
    3	-6.96	-6.88
    3.5	-8.24	-8.05
    4	-9.42	-9.26
    4.5	-10.54	-10.41
    5	-11.5	-11.4
    5.5	-12.74	-12.58
    6	-13.03	-12.94
    6.5	-13.59	-13.39
    7	-13.97	-13.84
    7.5	-15.1	-14.99
    8	-16.98	-16.74
    8.5	-17.6	-17.53
    9	-17.78	-17.66
    9.5	-18.37	-18.27
    10	-17.26	-17.13
    10.5	-16.24	-16.15
    11	-16.09	-16.04
    11.5	-16.4	-16.3
    12	-16.7	-16.62
    12.5	-17.64	-17.48
    13	-18.92	-18.7
    13.5	-19.6	-19.4
    14	-20.04	-19.82
    14.5	-21.2	-21.09
    15	-22.36	-22.15
    15.5	-23.63	-23.41
    16	-25.19	-24.82
    16.5	-25.62	-25.37
    17	-26.84	-26.76
    17.5	-26.74	-26.44
    18	-28.24	-27.99
    18.5	-28.68	-28.15
    19	-26.7	-26.5
    19.5	-26.84	-26.66
    20	-27.06	-26.94
    20.5	-26.28	-26.09
    21	-25.4	-25.19
    21.5	-26.12	-25.95
    22	-25.14	-24.89
    22.5	-23.81	-23.55
    23	-24.94	-24.84
    23.5	-24.53	-24.35
    24	-23.97	-23.85
    24.5	-24.71	-24.58
    25	-23.98	-23.97
    25.5	-23.08	-22.98
    26	-23.17	-22.96
    26.5	-24.36	-24.02
    27	-23.81	-23.48
    27.5	-22.55	-22.26
    28	-22.6	-22.39
    28.5	-22.8	-22.56
    29	-23.13	-22.93
    29.5	-22.63	-22.29
    30	-22.74	-22.49
    30.5	-23.82	-22.72
    31	-23.01	-22.84
    31.5	-22.5	-22.33
    32	-21.96	-21.83
    32.5	-22.78	-22.32
    33	-24.5	-24.13
    33.5	-24.81	-24.43
    34	-24.2	-23.97
    34.5	-24.04	-23.63
    35	-24.43	-24.04
    35.5	-23.98	-23.88
    36	-23.65	-23.36
    36.5	-23.88	-23.73
    37	-24.44	-24.19
    37.5	-24.41	-24.19
    38	-22.81	-22.94
    38.5	-23.61	-23.33
    39	-24.49	-24.38
    39.5	-24.24	-24.13
    40	-25.05	-24.66
    ];

% convert cm into m
distance_v = measured_data_v(:,1);

power_average_v = (measured_data_v(:,2) + measured_data_v(:,3))./2-5;


% measured data h_h
measured_data_h  = [
    0	9.34	9.36
    0.5	6.34	6.36
    1	1.65	1.71
    1.5	-1.39	-1.25
    2	-3.39	-3.33
    2.5	-5.19	-5.07
    3	-6.78	-6.65
    3.5	-8.43	-8.36
    4	-9.4	-9.31
    4.5	-9.91	-9.85
    5	-12.28	-12.06
    5.5	-12.54	-12.47
    6	-11.6	-11.55
    6.5	-12.17	-12.08
    7	-14.54	-14.47
    7.5	-17.85	-17.74
    8	-19.32	-19.28
    8.5	-17.64	-17.49
    9	-16.28	-16.14
    9.5	-15.15	-15.09
    10	-14.3	-14.16
    10.5	-14.03	-13.9
    11	-14.34	-14.23
    11.5	-14.9	-14.8
    12	-16.13	-16.07
    12.5	-17.22	-17.08
    13	-18.57	-18.48
    13.5	-21.7	-21.25
    14	-23.78	-23.01
    14.5	-23.23	-22.81
    15	-27.53	-27.37
    15.5	-29.58	-29.1
    16	-29.15	-28.88
    16.5	-27.17	-26.94
    17	-26.71	-26.2
    17.5	-26.88	-26.59
    18	-27.03	-26.78
    18.5	-24.43	-24.08
    19	-23.45	-23.3
    19.5	-23.2	-22.85
    20	-23.35	-23.15
    20.5	-22.8	-22.66
    21	-23.03	-22.62
    21.5	-22.89	-22.71
    22	-21.38	-21.45
    22.5	-21.28	-21.21
    23	-20.3	-20.23
    23.5	-19.88	-19.7
    24	-19.97	-19.63
    24.5	-21.3	-21.07
    25	-20.51	-20.37
    25.5	-20.9	-20.79
    26	-21.67	-21.48
    26.5	-21.34	-21.08
    27	-19.79	-19.64
    27.5	-20.05	-19.97
    28	-20.97	-20.89
    28.5	-21.78	-21.67
    29	-21.6	-21.48
    29.5	-21.82	-21.71
    30	-23.14	-23.08
    30.5	-24.58	-24.47
    31	-22.28	-22.16
    31.5	-20.98	-20.82
    32	-22.57	-22.48
    32.5	-24.86	-24.62
    33	-24.24	-24.41
    33.5	-22.75	-22.34
    34	-22.39	-22.25
    34.5	-22.5	-22.37
    35	-21.83	-21.67
    35.5	-21.51	-21.42
    36	-22.16	-22.03
    36.5	-22.88	-22.64
    37	-23.2	-23.11
    37.5	-21.27	-21.17
    38	-20.17	-20.08
    38.5	-20.76	-20.63
    39	-22.1	-22.01
    39.5	-24.47	-24.35
    40	-26.78	-26.65
    40.5	-27.98	-27.7
    ];

distance_h  = measured_data_h (:,1);

power_average_h  = (measured_data_h (:,2)+measured_data_h(:,3))./2-5;

figure(1)
plot(distance_v, power_average_v)
title('SBA Power figure')
xlabel('distance m')
ylabel('Power dBm')
hold on
plot(distance_h , power_average_h )
legend('v-v','h-h')
grid on
hold on

%% 2nd of December,  2018

% consolidated 2.45GHz theory & measured data
% for EEE414 propagation assignment


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% two-ray interference model derived from Sommer  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% height above floor in metres
% this is set for 1metre
% measurmenets were done at 1.03 & 1.09metres
h1 = 1.00;

% wavelength in metres
l = 0.1223673;

% separation distances
dS = [1:0.01:50];

% freespace loss,  equation 1
Lfs = -20*log10( 4*pi*dS/l );

% separation distances,  coarse version
dS_c = [1 1.25 1.5 2 2.5 3 3.5 4:1:50];

% freespace loss,  equation 1,  coarse version
Lfs_c = -20*log10( 4*pi*dS_c/l );

%% relative permittivity of the floor  %%
er = 4.5;

%%%  NORMAL  %%%
% two-ray interference
dref = sqrt( dS.*dS + 4*h1.*h1 );

sinT = 2*h1./dref;

cosT = dS./dref;

phi = 2*pi* ( dS - dref )/l;

% reflection coefficient for normal polarisation
rc_norm_44 = ( sinT - sqrt( er - cosT.*cosT ) ) ./ ( sinT + sqrt( er - cosT.*cosT ) );

% 2-Ray Interfence (TRI) calculation
LtriN_44 = -20*log10( 4*pi*dS/l ./ abs( 1 + rc_norm_44.*exp( i*phi ) ) );



%%%  PARALLEL  %%%
% calculations for horizontal polarisation
dref2 = sqrt( dS.*dS + 4*h1.*h1 );
sinT2 = 2*h1./dref2;
cosT2 = dS./dref2;
phi2 = 2*pi* ( dS - dref2 )/l;

% reflection coefficient for parallel polarisation
rc_para_44 = ( -er*sinT2 + sqrt( er - cosT2.*cosT2 ) ) ./ ( er*sinT2 + sqrt( er - cosT2.*cosT2 ) );
%% is the first - sign wrong?
%%  %% was:  rc_para_44 = ( -er*sinT2 + sqrt( er - cosT2.*cosT2 ) ) ./ ( er*sinT2 + sqrt( er - cosT2.*cosT2 ) );

% 2-Ray Interfence (TRI) calculation
LtriP_44 = -20*log10( 4*pi*dS/l ./ abs( 1 - rc_para_44.*exp( i*phi2 ) ) );
%% negated the reflection coefficient


%% relative permittivity of the floor  %%
er = 7.5;

%%%  NORMAL  %%%
% two-ray interference
dref = sqrt( dS.*dS + 4*h1.*h1 );

sinT = 2*h1./dref;

cosT = dS./dref;

phi = 2*pi* ( dS - dref )/l;

% reflection coefficient for normal polarisation
rc_norm_75 = ( sinT - sqrt( er - cosT.*cosT ) ) ./ ( sinT + sqrt( er - cosT.*cosT ) );

% 2-Ray Interfence (TRI) calculation
LtriN_75 = -20*log10( 4*pi*dS/l ./ abs( 1 + rc_norm_75.*exp( i*phi ) ) );

%%%  PARALLEL  %%%
% calculations for horizontal polarisation
dref2 = sqrt( dS.*dS + 4*h1.*h1 );
sinT2 = 2*h1./dref2;
cosT2 = dS./dref2;
phi2 = 2*pi* ( dS - dref2 )/l;

% reflection coefficient for parallel polarisation
rc_para_75 = ( -er*sinT2 + sqrt( er - cosT2.*cosT2 ) ) ./ ( er*sinT2 + sqrt( er - cosT2.*cosT2 ) );
%% %% was:  rc_para_75 = ( -er*sinT2 + sqrt( er - cosT2.*cosT2 ) ) ./ ( er*sinT2 + sqrt( er - cosT2.*cosT2 ) );

% 2-Ray Interfence (TRI) calculation
LtriP_75 = -20*log10( 4*pi*dS/l ./ abs( 1 - rc_para_75.*exp( i*phi2 ) ) );


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  PEC  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% TRI calculation using reflection coefficient 1 for horizontal polarisation incident on PEC floor
LtriPEC_P = -20*log10( 4*pi*dS/l ./ abs( 1 +1.*exp( i*phi2 ) ) );

LtriPEC_N = -20*log10( 4*pi*dS/l ./ abs( 1 -1.*exp( i*phi2 ) ) );

plot(dS,Lfs-max(Lfs),'k--',dS,LtriP_75-max(LtriP_75),dS,LtriN_75-max(LtriN_75),'LineWidth',2)
% plot(dS,Lfs-max(Lfs),'k--',dS,LtriP_44-max(LtriP_44),dS,LtriN_44-max(LtriN_44),'LineWidth',2)
xlabel('Position (m)')
ylabel('Normalised power (dB)')
legend('v-v measured data','h-h measured data','LOS theory','vertical pol','horizontal pol')  % ,'total')
title('2-ray interference, concrete floor \epsilon_r=7.5')
grid on
axis([0 40 -60 0])


