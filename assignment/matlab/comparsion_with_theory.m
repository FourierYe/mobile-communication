clear
clc

% measured data v-v
measured_data_v = [
    1	9.24	9.2
    51	-8.65	-8.75
    101	-14.96	-15.3
    151	-18.64	-19.01
    201	-20.16	-20.58
    251	-22.48	-22.69
    301	-24.32	-24.89
    351	-25.87	-26.23
    401	-26.1	-26.74
    451	-27.7	-29
    501	-28.52	-29.23
    551	-31.22	-32.84
    601	-30.77	-31.24
    651	-27.97	-28.54
    701	-29.14	-29.4
    751	-29.52	-30.3
    801	-35.2	-35.58
    851	-36.2	-36.58
    901	-33.22	-33.49
    951	-31.04	-32.78
    1001	-34.02	-34.9
    1051	-29.69	-30.17
    1101	-31.49	-31.88
    1151	-31.64	-31.88
    1201	-32.7	-33.2
    1251	-32.2	-33.84
    1301	-37.09	-38.33
    1351	-34.32	-34.58
    1401	-35.94	-36.48
    1451	-36.7	-37.04
    1501	-43.43	-44.23
    1551	-42.64	-42.96
    1601	-37.74	-38.44
    1651	-47.24	-48.32
    1701	-41.33	-41.86
    1751	-43.26	-43.97
    1801	-40.11	-43.01
    1851	-45.32	-46.47
    1901	-39.7	-40.48
    1951	-42.64	-43.87
    2001	-39.43	-40.3
    2051	-47.01	-47.56
    2101	-39.84	-40.7
    2151	-52.43	-52.9
    2201	-39.7	-40.01
    2251	-39.32	-40.34
    2301	-41	-41.89
    2351	-37.6	-37.85
    2401	-37.43	-37.8
    2451	-39.32	-40.09
    2501	-38	-38.56
    2551	-38.52	-38.7
    2601	-36.51	-36.86
    2651	-45.02	-45.87
    2701	-38.46	-38.57
    2751	-37.32	-32.74
    2801	-40.34	-40.56
    2851	-40.14	-40.79
    2901	-39.62	-39.74
    2951	-36.8	-36.96
    3001	-37.43	-37.73
    3051	-39.01	-39.29
    3101	-36.29	-36.4
    3151	-39.06	-39.32
    3201	-41.03	-41.5
    3251	-37.42	-37.76
    3301	-37.89	-38.24
    3351	-40.07	-40.34
    3401	-37.27	-37.52
    3451	-42.78	-43.17
    3501	-39.89	-40.56
    3551	-40.56	-40.8
    3601	-38.5	-38.76
    3651	-40.17	-40.28
    3701	-40.4	-40.82
    3751	-38.69	-39.02
    3801	-39.27	-39.89
    3851	-36.3	-36.54
    3901	-40.23	-40.52
    3951	-38.19	-38.32
    4001	-37.73	-37.97
    ];

% convert cm into m
distance_v = measured_data_v(:,1)./100;

power_average_v = (measured_data_v(:,2) + measured_data_v(:,3))./2+10;


% measured data h_h
measured_data_h  = [
    0	9.97	10
    0.5	-8.82	-8.65
    1	-14.56	-14.32
    1.5	-17.01	-16.67
    2	-20.43	-20.26
    2.5	-24.81	-24.11
    3	-24.3	-23.85
    3.5	-22.49	-22.32
    4	-31.68	-30.44
    4.5	-25.62	-25.31
    5	-26.29	-25.53
    5.5	-34.07	-33.21
    6	-27.28	-26.58
    6.5	-27.68	-27.38
    7	-26.65	-26.28
    7.5	-29.72	-29.38
    8	-34.28	-33.82
    8.5	-46.02	-44.82
    9	-34.45	-33.82
    9.5	-30.28	-30.1
    10	-29.78	-29.36
    10.5	-28.93	-28.52
    11	-28.89	-28.18
    11.5	-29.21	-28.81
    12	-31.46	-31.11
    12.5	-33.36	-33.02
    13	-33.16	-32.62
    13.5	-36.11	-35.54
    14	-42.03	-40.62
    14.5	-38.86	-38.42
    15	-42.05	-39.96
    15.5	-46.12	-44.17
    16	-47.38	-41.01
    16.5	-39.86	-38.56
    17	-38.26	-37.65
    17.5	-41.28	-40.21
    18	-51.68	-49.62
    18.5	-40.68	-39.96
    19	-41.08	-40.49
    19.5	-39.86	-38.96
    20	-40.98	-39.85
    20.5	-38.35	-37.76
    21	-41.29	-39.87
    21.5	-47.54	-45.23
    22	-42.97	-41.23
    22.5	-35.06	-34.6
    23	-34.3	-33.95
    23.5	-34.67	-33.95
    24	-38.08	-37.2
    24.5	-40.38	-40.1
    25	-32.38	-31.4
    25.5	-32.28	-31.8
    26	-35.68	-34.97
    26.5	-34.78	-33.12
    27	-34.26	-33.8
    27.5	-37.64	-36.62
    28	-33.48	-33.16
    28.5	-35.36	-34.9
    29	-42.25	-41.37
    29.5	-33.69	-33.31
    30	-36.35	-35.67
    30.5	-54.82	-53.46
    31	-36.02	-35.41
    31.5	-31.33	-30.97
    32	-36.97	-36.12
    32.5	-36.52	-36.15
    33	-48.06	-46.95
    33.5	-36.42	-35.72
    34	-43.96	-42.96
    34.5	-39.34	-38.66
    35	-38.89	-37.96
    35.5	-35.44	-34.87
    36	-40	-39.51
    36.5	-38.85	-38.02
    37	-40.07	-38.65
    37.5	-36.39	-35.96
    38	-34.84	-34.58
    38.5	-33.16	-32.72
    39	-36.05	-35.02
    39.5	-51.05	-49.97
    40	-47.68	-45.25
    
    ];

distance_h  = measured_data_h (:,1);

power_average_h  = (measured_data_h (:,2)+measured_data_h(:,3))./2+10;

figure(1)
plot(distance_v, power_average_v)
title('measured Received Power figure')
xlabel('distance m')
ylabel('Power dBm')
hold on
plot(distance_h , power_average_h )
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
title('2-ray interference, moisture floor \epsilon_r=7.5')
grid on
axis([0 40 -60 0])


