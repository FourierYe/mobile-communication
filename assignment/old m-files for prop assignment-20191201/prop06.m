function [] = prop06()

% 22nd of November,  2015

% repeat Sommer's 2-ray interference calculation

% empirically determined relative permittivity of the asphalt road
er = 1.02;


% height of the monopole antennas on top of the cars
h = 1.895;

% used 5.89GHz,  but use wavelength (in metres) in the propagation calculation
l = 0.0508998;

% Sommer & co. measured out to 1.2km
% so distance range is 1200 metres
dS = [6:1200];

% freespace loss,  equation 1
Lfs = -20*log10( 4*pi*dS/l );

% two-ray interference
dref = sqrt( dS.*dS + 4*h.*h );

sinT = 2*h./dref;

cosT = dS./dref;

phi = 2*pi* ( dS - dref )/l;

rc_norm = ( sinT - sqrt( er - cosT.*cosT ) ) ./ ( sinT + sqrt( er - cosT.*cosT ) );


Ltri = -20*log10( 4*pi*dS/l ./ abs( 1 + rc_norm.*exp( i*phi ) ) );

LtriPEC = -20*log10( 4*pi*dS/l ./ abs( 1 -1.*exp( i*phi ) ) );

figure
plot(dS,Lfs-max(Lfs),'--',dS,Ltri-max(Ltri),'LineWidth',2)
xlabel('Position (m)')
ylabel('Normalised power (dB)')
legend('freespace','2-ray interference')
title('Sommer 2011, Figure 3a')
grid on
axis([0 1200 -50 0])


figure
plot(dS,Lfs-max(Lfs),'--',dS,Ltri-max(Ltri),'LineWidth',2)
xlabel('Position (m)')
ylabel('Normalised power (dB)')
legend('freespace','2-ray interference')
title('Sommer 2011, Figure 3b')
grid on
axis([0 600 -40 0])

% repeat the calculation with PEC as the reflecting surface

LtriPEC = -20*log10( 4*pi*dS/l ./ abs( 1 -1.*exp( i*phi ) ) );

figure
plot(dS,Lfs-max(Lfs),'--',dS,Ltri-max(Ltri),dS,LtriPEC-max(LtriPEC),':','LineWidth',2)
xlabel('Position (m)')
ylabel('Normalised power (dB)')
legend('freespace','2-ray interference','2-ray PEC')
title('Sommer compared to PEC')
grid on
axis([0 1200 -50 0])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% replicate Figures 3.6 of Rappaport
% these are Figures 4.6 of page 118 of Rappaport 2nd edition
% reflection coefficients as a function of angle of incidence for er=4.4 & er=12
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

er = 4.0;

ref_ang1 = [0:90];
ref_ang = [0:90] * pi/180;

ref_para40 = ( sqrt( er - cos(ref_ang).^2 ) - er * sin(ref_ang) ) ./ ( er * sin(ref_ang) + sqrt( er - cos(ref_ang).^2 ) );

ref_norm40 = ( sin(ref_ang) - sqrt( er - cos(ref_ang).^2 ) ) ./ ( sin(ref_ang) + sqrt( er - cos(ref_ang).^2 ) );

er = 12;

ref_para12 = ( sqrt( er - cos(ref_ang).^2 ) - er * sin(ref_ang) ) ./ ( er * sin(ref_ang) + sqrt( er - cos(ref_ang).^2 ) );

ref_norm12 = ( sin(ref_ang) - sqrt( er - cos(ref_ang).^2 ) ) ./ ( sin(ref_ang) + sqrt( er - cos(ref_ang).^2 ) );



figure
plot(ref_ang1,abs(ref_para40),'--',ref_ang1,abs(ref_para12),'LineWidth',2)
xlabel('Angle of incidence (\theta_i)')
ylabel('|Reflection coefficient parallel|')
legend('\epsilon_r = 4','\epsilon_r = 12')
grid on


figure
plot(ref_ang1,abs(ref_norm40),'--',ref_ang1,abs(ref_norm12),'LineWidth',2)
xlabel('Angle of incidence (\theta_i)')
ylabel('|Reflection coefficient normal|')
legend('\epsilon_r = 4','\epsilon_r = 12')
grid on


figure
plot(ref_ang1,ref_para40,'--',ref_ang1,ref_para12,'LineWidth',2)
xlabel('Angle of incidence (\theta_i)')
ylabel('Reflection coefficient parallel')
legend('\epsilon_r = 4','\epsilon_r = 12')
grid on


figure
plot(ref_ang1,ref_norm40,'--',ref_ang1,ref_norm12,'LineWidth',2)
xlabel('Angle of incidence (\theta_i)')
ylabel('Reflection coefficient normal')
legend('\epsilon_r = 4','\epsilon_r = 12')
grid on


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% repeat reflection coefficient calculations for Rhim & Buyukozturk's air
% dried concrete relative permittivity at 2.45GHz
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% from Rhim 1998
er = 4.4;

ref_ang1 = [0:90];
ref_ang = [0:90] * pi/180;

ref_para44 = ( sqrt( er - cos(ref_ang).^2 ) - er * sin(ref_ang) ) ./ ( er * sin(ref_ang) + sqrt( er - cos(ref_ang).^2 ) );

ref_norm44 = ( sin(ref_ang) - sqrt( er - cos(ref_ang).^2 ) ) ./ ( sin(ref_ang) + sqrt( er - cos(ref_ang).^2 ) );


figure
plot(ref_ang1,ref_para44,'--',ref_ang1,ref_norm44,ref_ang1,ref_para40,'--',ref_ang1,ref_norm40,'LineWidth',2)
xlabel('Angle of incidence (\theta_i)')
ylabel('Reflection coefficient')
legend('\epsilon_r = 4.4 Parallel','\epsilon_r = 4.4 Normal','\epsilon_r = 4.0 Parallel','\epsilon_r = 4.0 Normal')
title('\epsilon_r = 4.4 to \epsilon_r = 4.0 comparison')
grid on


figure
plot(ref_ang1,ref_para44,'--',ref_ang1,ref_norm44,'LineWidth',2)
xlabel('Angle of incidence (\theta_i)')
ylabel('Reflection coefficient')
legend('Parallel','Normal')
title('\epsilon_r = 4.4')
grid on


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% adapt Sommer's calculations for the geometry of the 4th floor corridor
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


h1 = 1.01;

l = 0.1223673;

dS = [1:0.01:30];

er = 4.4;

% freespace loss,  equation 1
Lfs = -20*log10( 4*pi*dS/l );

% two-ray interference
dref = sqrt( dS.*dS + 4*h1.*h1 );

sinT = 2*h1./dref;

cosT = dS./dref;

phi = 2*pi* ( dS - dref )/l;

rc_norm = ( sinT - sqrt( er - cosT.*cosT ) ) ./ ( sinT + sqrt( er - cosT.*cosT ) );


Ltri = -20*log10( 4*pi*dS/l ./ abs( 1 + rc_norm.*exp( i*phi ) ) );

LtriPEC = -20*log10( 4*pi*dS/l ./ abs( 1 -1.*exp( i*phi ) ) );

figure
plot(dS,Lfs-max(Lfs),'k--',dS,Ltri-max(Ltri),dS,LtriPEC-max(LtriPEC),'LineWidth',2)
xlabel('Position (m)')
ylabel('Normalised power (dB)')
legend('LOS theory','floor only','PEC floor only')  % ,'total')
title('2-ray interference, vert pol')
grid on
axis([0 30 -60 0])



% height of centre of which ever antennas were used
h1 = 1.01;
% h1 = 0.965;

% distance to closest wall
h2 = 0.725;

% distance to far wall
h3 = 1.98;

% distance to ceiling
h4 = 2.95 - h1;

% floor calculation
dref1 = sqrt( dS.*dS + 4*h1.*h1 );
sinT1 = 2*h1./dref1;
cosT1 = dS./dref1;
phi1 = 2*pi* ( dS - dref1 )/l;
rc_norm1 = ( sinT1 - sqrt( er - cosT1.*cosT1 ) ) ./ ( sinT1 + sqrt( er - cosT1.*cosT1 ) );

% closest wall calculation
dref2 = sqrt( dS.*dS + 4*h2.*h2 );
sinT2 = 2*h2./dref2;
cosT2 = dS./dref2;
phi2 = 2*pi* ( dS - dref2 )/l;
rc_para2 = ( -er*sinT2 + sqrt( er - cosT2.*cosT2 ) ) ./ ( er*sinT2 + sqrt( er - cosT2.*cosT2 ) );

% far wall calculation
dref3 = sqrt( dS.*dS + 4*h3.*h3 );
sinT3 = 2*h3./dref3;
cosT3 = dS./dref3;
phi3 = 2*pi* ( dS - dref3 )/l;
rc_para3 = ( -er*sinT3 + sqrt( er - cosT3.*cosT3 ) ) ./ ( er*sinT3 + sqrt( er - cosT3.*cosT3 ) );

% ceiling calculation
dref4 = sqrt( dS.*dS + 4*h4.*h4 );
sinT4 = 2*h4./dref4;
cosT4 = dS./dref4;
phi4 = 2*pi* ( dS - dref4 )/l;
rc_norm4 = ( sinT4 - sqrt( er - cosT4.*cosT4 ) ) ./ ( sinT4 + sqrt( er - cosT4.*cosT4 ) );



LtriA = -20*log10( 4*pi*dS/l ./ abs( 1 + rc_norm1.*exp( i*phi1 ) + rc_para2.*exp( i*phi2 ) + rc_para3.*exp( i*phi3 ) + rc_norm4.*exp( i*phi4 ) ) );

LtriB = -20*log10( 4*pi*dS/l ./ abs( 1 + rc_para2.*exp( i*phi2 ) ) );


figure
plot(dS,Lfs-max(Lfs),'k--',dS,Ltri-max(Ltri),dS,LtriB-max(LtriB),dS,LtriA-max(LtriA),'LineWidth',2)
xlabel('Position (m)')
ylabel('Normalised power (dB)')
legend('LOS theory','floor only','close wall only','5-ray interference')  % ,'total')
title('Tx vert pol,  concrete cases')
grid on
axis([0 30 -60 0])


% redo the calculation for horizontal polarisation

% floor calculation
rc_para1 = ( -er*sinT1 + sqrt( er - cosT1.*cosT1 ) ) ./ ( er*sinT1 + sqrt( er - cosT1.*cosT1 ) );

% closest wall calculation
rc_norm2 = ( sinT2 - sqrt( er - cosT2.*cosT2 ) ) ./ ( sinT2 + sqrt( er - cosT2.*cosT2 ) );

% far wall calculation
rc_norm3 = ( sinT3 - sqrt( er - cosT3.*cosT3 ) ) ./ ( sinT3 + sqrt( er - cosT3.*cosT3 ) );

% ceiling calculation
rc_para4 = ( -er*sinT4 + sqrt( er - cosT4.*cosT4 ) ) ./ ( er*sinT4 + sqrt( er - cosT4.*cosT4 ) );


LtriC = -20*log10( 4*pi*dS/l ./ abs( 1 + rc_para1.*exp( i*phi1 ) + rc_norm2.*exp( i*phi2 ) + rc_norm3.*exp( i*phi3 ) + rc_para4.*exp( i*phi4 ) ) );


figure
plot(dS,Lfs-max(Lfs),'k--',dS,LtriA-max(LtriA),'m',dS,LtriC-max(LtriC),'b','LineWidth',2)
xlabel('Position (m)')
ylabel('Normalised power (dB)')
legend('LOS theory','vertical pol','horizontal pol')  % ,'total')
title('Comparison of totals,  concrete cases')
grid on
axis([0 30 -60 0])




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% measured data from the 4th floor corridor
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% 2.45GHz propagation measurements down the 4th floor corridor
% broadcast 13dBm

% vertical polarisation from October 9th		
v2014 = [1	-9.8	-9.5
1.1	-10.5	-10.2
1.2	-11.4	-11.1
1.3	-12.9	-12.7
1.4	-11.6	-11.2
1.5	-13.9	-13.7
1.6	-15.02	-14.8
1.7	-14.5	-14.1
1.8	-15.6	-14.2
1.9	-15.4	-14.7
2	-17.2	-16.6
2.1	-16.6	-15.72
2.2	-15.9	-15.4
2.3	-17.7	-16.8
2.4	-17.2	-16.9
2.5	-18.2	-17.6
2.6	-19.2	-18.8
2.7	-18.7	-18.2
2.8	-18.2	-17.7
2.9	-19.2	-18.7
3	-18.7	-18.2
4	-20.2	-19.2
4.4	-26.7	-25.9
4.5	-30	-28
4.6	-30	-29
4.7	-25.3	-24.7
5	-20.9	-20.4
6	-18.6	-18.4
7	-23	-21
8	-21.4	-20.9
9	-36	-34
10	-29.7	-29.1
12	-37	-34
14	-35.9	-34
16	-34	-32
17	-24.9	-24
18	-24.7	-24.2
20	-27.8	-27.2
24	-23.6	-22.8
28	-28.4	-27.7];


% Tx power was 13dBm		
% frequency was 2.45GHz	

% 2.45GHz propagation measurements down the 4th floor corridor
% broadcast 13dBm

% vertical polarisation from October 9th		
v2014 = [1	-9.8	-9.5
1.1	-10.5	-10.2
1.2	-11.4	-11.1
1.3	-12.9	-12.7
1.4	-11.6	-11.2
1.5	-13.9	-13.7
1.6	-15.02	-14.8
1.7	-14.5	-14.1
1.8	-15.6	-14.2
1.9	-15.4	-14.7
2	-17.2	-16.6
2.1	-16.6	-15.72
2.2	-15.9	-15.4
2.3	-17.7	-16.8
2.4	-17.2	-16.9
2.5	-18.2	-17.6
2.6	-19.2	-18.8
2.7	-18.7	-18.2
2.8	-18.2	-17.7
2.9	-19.2	-18.7
3	-18.7	-18.2
4	-20.2	-19.2
4.4	-26.7	-25.9
4.5	-30	-28
4.6	-30	-29
4.7	-25.3	-24.7
5	-20.9	-20.4
6	-18.6	-18.4
7	-23	-21
8	-21.4	-20.9
9	-36	-34
10	-29.7	-29.1
12	-37	-34
14	-35.9	-34
16	-34	-32
17	-24.9	-24
18	-24.7	-24.2
20	-27.8	-27.2
24	-23.6	-22.8
28	-28.4	-27.7];


% Tx power was 13dBm		
% frequency was 2.45GHz		

% horizontal polarisation from the 15th		
h2014 = [1	-10.91	-10.7
1.1	-11.5	-11.4
1.2	-11.8	-11.63
1.3	-13	-12.8
1.4	-12.5	-12.3
1.5	-15.28	-14
1.6	-14.62	-14.4
1.7	-13.8	-13.7
1.8	-18.8	-17.6
1.9	-15.3	-15
2	-15.67	-15.5
2.1	-18.4	-18.2
2.2	-17.3	-16.2
2.3	-18.7	-18.4
2.4	-15.66	-15.5
2.5	-17.05	-16.93
2.6	-17.5	-17.5
2.7	-18.6	-18.4
2.8	-22.47	-22.1
2.9	-21.6	-21.3
3	-19.85	-19.7
4	-21.1	-20
4.4	-21.1	-20
4.5	-23.09	-22.1
4.6	-24.03	-23.1
4.7	-27.85	-26.3
5	-29.05	-28.7
5.5	-22.43	-21.9
6	-18.7	-18.4
6.5	-24.9	-21.9
7	-27.42	-26.7
8	-34	-33.2
9	-27.41	-26
10	-30.6	-29
12	-27.12	-26.1
14	-27.7	-27.3
16	-29.4	-28.2
18	-33.45	-32.2
20	-31.12	-30
24	-26.4	-26
28	-26.8	-25];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% broadcast 20dBm

% recieve antenna on trolley was a SBA cake tin from Metro
% vertical polarisation

% m	max(-dbm)	min(-dbm)
s2015 = [1	4.33	4.61
1.1	5.38	5.55
1.2	6.16	6.32
1.3	6.99	7.2
1.4	7.64	7.78
1.5	7.84	8.05
1.6	8.72	8.97
1.7	9.04	9.22
1.8	9.47	9.59
1.9	10.18	10.33
2	10.59	10.71
2.1	10.96	11.12
2.2	11.26	11.42
2.3	12.09	12.26
2.4	12.38	12.44
2.5	12.22	12.43
2.6	12.9	13.03
2.7	12.96	13.13
2.8	13.12	13.26
2.9	13.96	14.03
3	13.44	13.6
3.1	13.98	14.03
3.2	14.55	14.7
3.3	13.84	13.96
3.4	14	14.13
3.5	14.86	15.03
3.6	14.97	15.09
3.7	15.04	15.22
3.8	15.25	15.3
3.9	17.15	17.43
4	17.76	17.93
4.1	16.5	16.6
4.2	17.14	17.2
4.3	19.76	19.95
4.4	20.58	20.73
4.5	20.64	20.78
4.6	20.5	20.7
4.7	22.43	22.55
4.8	22.4	22.56
4.9	20.19	20.29
5	17.36	17.41
5.1	17.34	17.43
5.2	17.84	17.93
5.3	18.2	18.36
5.5	17.06	17.14
6	16.66	16.74
6.5	15.6	15.75
7	16.98	17.09
7.5	23.06	23.13
8	21.2	21.4
8.5	28.4	28.8
9	29.4	29.9
9.5	26	26.2
9.8	31.8	32.2
9.9	38.4	38.6
10	42.7	43.8
10.1	31.7	32
10.2	29.2	29.5
10.5	24.6	24.8
11	23.5	23.8
12	35.7	36.1
14	24.2	24.3
16	30.6	31.6
18	25.7	26.1
19	35.7	36
20	27.8	28
21	22.9	23
22	26	26.1
24	20	20.1
26	23.7	23.8];


% FAXE beer can antennas
% m	min (*-1)	max (*-1)
c2015 =[1.00	12.53	12.50
1.10	14.80	14.71
1.20	14.06	14.02
1.30	14.90	14.57
1.40	15.69	15.61
1.50	15.79	15.73
1.60	16.53	16.47
1.70	17.80	17.76
1.80	18.23	18.21
1.90	17.47	17.42
2.00	18.78	18.65
2.10	20.62	20.51
2.20	20.78	20.75
2.30	20.26	20.22
2.40	19.48	19.40
2.50	20.67	20.64
2.60	19.57	19.51
2.70	21.45	21.41
2.80	23.62	23.51
2.90	20.96	20.92
3.00	24.20	24.02
3.50	22.68	22.54
4.00	23.10	22.84
4.10	27.40	27.25
4.20	39.40	37.84
4.30	32.15	32.06
4.40	27.92	27.49
4.50	28.52	28.04
4.60	39.92	38.88
4.70	26.06	25.64
4.80	21.00	20.96
4.90	19.89	19.83
5.00	22.60	22.50
6.00	21.73	21.58
7.00	24.26	24.21
8.00	33.70	32.57
9.00	32.90	32.80
9.50	30.94	30.86
9.60	34.55	34.34
9.70	33.74	33.46
9.80	29.26	38.66
9.90	42.27	41.94
10.00	41.10	40.57
10.10	40.03	40.01
10.20	30.65	30.49
10.30	20.56	29.32
10.40	32.90	32.84
10.50	31.62	31.40
11.00	31.43	31.40
12.00	29.40	29.37
14.00	31.93	31.73
15.00	29.69	29.63
16.00	42.31	42.08
18.00	36.00	35.79
20.00	31.60	31.55
22.00	43.27	43.07
24.00	29.47	29.35
26.00	32.73	32.71
28.00	36.10	35.46
30.00	33.55	33.47];


c2015(:,2) = -1 * c2015(:,2);
c2015(:,3) = -1 * c2015(:,3);

s2015(:,2) = -1 * s2015(:,2);
s2015(:,3) = -1 * s2015(:,3);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compare the received power levels from the 2015 trials
% ideally this should be only the result of the difference in Rx antenna gain

% antenna gains from FEKO models
% FAXE beer can 7.86dBi
% SBA 16.17dBi

gain_diff = 16.17 - 7.86;

disp(['Gain difference ',num2str(gain_diff),'dB'])


figure
plot(s2015(1:41,1),s2015(1:41,2)-c2015(1:41,2),s2015(1:41,1),s2015(1:41,3)-c2015(1:41,3),'LineWidth',2)
xlabel('Position (m)')
ylabel('Power (dB)')
hold on
plot([1 5],[gain_diff gain_diff],'--r')
title('FAXE beer can - SBA difference')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



figure
plot(dS,Lfs-max(Lfs),'k--',v2014(:,1),v2014(:,3)-max(v2014(:,3)),h2014(:,1),h2014(:,3)-max(h2014(:,3)),c2015(:,1),c2015(:,3)-max(c2015(:,3)),s2015(:,1),s2015(:,3)-max(s2015(:,3)),'LineWidth',2)
xlabel('Position (m)')
ylabel('Normalised power (dB)')
legend('LOS theory','microstrip patch v. pol.','microstrip patch h. pol.','FAXE beer can','SBA')
title('All experimental data')
grid on
axis([0 30 -40 0])



figure
plot(dS,Lfs-max(Lfs),'k--',v2014(:,1),v2014(:,2)-max(v2014(:,2)),'m',v2014(:,1),v2014(:,3)-max(v2014(:,3)),'--m',h2014(:,1),h2014(:,2)-max(h2014(:,2)),'b',h2014(:,1),h2014(:,3)-max(h2014(:,3)),'--b','LineWidth',2)
xlabel('Position (m)')
ylabel('Normalised power (dB)')
legend('LOS theory','vertical','vertical','horizontal','horizontal')
title('2014 microstrip antenna')
grid on
axis([0 30 -40 0])



figure
plot(dS,Lfs-max(Lfs),'k--',c2015(:,1),c2015(:,2)-max(c2015(:,2)),'m',c2015(:,1),c2015(:,3)-max(c2015(:,3)),'--m',s2015(:,1),s2015(:,2)-max(s2015(:,2)),'b',s2015(:,1),s2015(:,3)-max(s2015(:,3)),'--b','LineWidth',2)
xlabel('Position (m)')
ylabel('Normalised power (dB)')
legend('LOS theory','FAXE beer','FAXE beer','SBA','SBA')
title('2015 Faxe beer & SBA')
grid on
axis([0 30 -40 0])


figure
plot(dS,Lfs-max(Lfs),'k--',dS,LtriA-max(LtriA),v2014(:,1),v2014(:,3)-max(v2014(:,3)),c2015(:,1),c2015(:,3)-max(c2015(:,3)),s2015(:,1),s2015(:,3)-max(s2015(:,3)),'LineWidth',2)
xlabel('Position (m)')
ylabel('Normalised power (dB)')
legend('LOS theory','5-ray interference','microstrip patch','FAXE beer can','SBA')
title('Vertical polarisation')
grid on
axis([0 30 -40 0])



figure
plot(dS,Lfs-max(Lfs),'k--',dS,LtriC-max(LtriC),h2014(:,1),h2014(:,3)-max(h2014(:,3)),'LineWidth',2)
xlabel('Position (m)')
ylabel('Normalised power (dB)')
legend('LOS theory','5-ray interference','microstrip patch')
title('Horizontal polarisation')
grid on
axis([0 30 -40 0])



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% adapt Sommer's calculations for November 3rd, 2016 measurements in CG13W
% only measured vertical polarisation
% floor of CG13W was reasonably flat, but covered with thin carpet
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% height of the centre of the antenna (its axis) above the floor
%%% the diameter of the antenna was 86mm
%%% the top of the antenna was 113.5cm above the floor
h1 = 1.135 - 0.086/2;

disp(['Faxe beer can antennas at ',num2str(h1*100),'cm above the floor'])

% wavelength at 2.45GHz
l = 0.1223673;

% range for the calculation
dS = [1:0.01:30];

% relative permittivity of the floor
er = 4.4;

% freespace loss,  equation 1
%%% this does not consider any reflections
Lfs = -20*log10( 4*pi*dS/l );

% two-ray interference
dref = sqrt( dS.*dS + 4*h1.*h1 );

sinT = 2*h1./dref;

cosT = dS./dref;

phi = 2*pi* ( dS - dref )/l;

% reflection coefficient for normal polarisation
rc_norm_44 = ( sinT - sqrt( er - cosT.*cosT ) ) ./ ( sinT + sqrt( er - cosT.*cosT ) );

% 2-Ray Interfence (TRI) calculation
LtriN_44 = -20*log10( 4*pi*dS/l ./ abs( 1 + rc_norm_44.*exp( i*phi ) ) );

% TRI calculation using reflection coefficient -1 for PEC floor
LtriPEC_N = -20*log10( 4*pi*dS/l ./ abs( 1 -1.*exp( i*phi ) ) );

figure
plot(dS,Lfs-max(Lfs),'k--',dS,LtriN_44-max(LtriN_44),dS,LtriPEC_N-max(LtriPEC_N),'LineWidth',2)
xlabel('Position (m)')
ylabel('Normalised power (dB)')
legend('LOS theory','floor only','PEC floor only')  % ,'total')
title('2-ray interference, vertical pol \epsilon_r=4.4')
grid on
axis([0 30 -60 0])



% calculations for horizontal polarisation
dref2 = sqrt( dS.*dS + 4*h2.*h2 );
sinT2 = 2*h2./dref2;
cosT2 = dS./dref2;
phi2 = 2*pi* ( dS - dref2 )/l;

% reflection coefficient for parallel polarisation
rc_para_44 = ( -er*sinT2 + sqrt( er - cosT2.*cosT2 ) ) ./ ( er*sinT2 + sqrt( er - cosT2.*cosT2 ) );


% 2-Ray Interfence (TRI) calculation
LtriP_44 = -20*log10( 4*pi*dS/l ./ abs( 1 + rc_para_44.*exp( i*phi2 ) ) );

% TRI calculation using reflection coefficient 1 for horizontal polarisation incident on PEC floor
LtriPEC_P = -20*log10( 4*pi*dS/l ./ abs( 1 +1.*exp( i*phi2 ) ) );

% free space loss Lfs is not polarisation dependent, so use Lfs calculated
% above again

figure
plot(dS,Lfs-max(Lfs),'k--',dS,LtriP_44-max(LtriP_44),dS,LtriPEC_P-max(LtriPEC_P),'LineWidth',2)
xlabel('Position (m)')
ylabel('Normalised power (dB)')
legend('LOS theory','floor only','PEC floor only')  % ,'total')
title('2-ray interference, horizontal pol \epsilon_r=4.4')
grid on
axis([0 30 -60 0])



figure
plot(dS,Lfs-max(Lfs),'k--',dS,LtriN_44-max(LtriN_44),dS,LtriP_44-max(LtriP_44),'LineWidth',2)
xlabel('Position (m)')
ylabel('Normalised power (dB)')
legend('LOS theory','vertical pol','horizontal pol')  % ,'total')
title('2-ray interference, concrete floor \epsilon_r=4.4')
grid on
axis([0 30 -60 0])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% repeat calculations with lesser values of relative permittivity
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%   %%%  er = 2.0  %%%   %%%

% relative permittivity of the floor
er = 2;


% reflection coefficient for normal polarisation
rc_norm_20 = ( sinT - sqrt( er - cosT.*cosT ) ) ./ ( sinT + sqrt( er - cosT.*cosT ) );

% 2-Ray Interfence (TRI) calculation
LtriN_20 = -20*log10( 4*pi*dS/l ./ abs( 1 + rc_norm_20.*exp( i*phi ) ) );



% reflection coefficient for parallel polarisation
rc_para_20 = ( -er*sinT2 + sqrt( er - cosT2.*cosT2 ) ) ./ ( er*sinT2 + sqrt( er - cosT2.*cosT2 ) );


% 2-Ray Interfence (TRI) calculation
LtriP_20 = -20*log10( 4*pi*dS/l ./ abs( 1 + rc_para_20.*exp( i*phi2 ) ) );

figure
plot(dS,Lfs-max(Lfs),'k--',dS,LtriN_20-max(LtriN_20),dS,LtriP_20-max(LtriP_20),'LineWidth',2)
xlabel('Position (m)')
ylabel('Normalised power (dB)')
legend('LOS theory','vertical pol','horizontal pol')  % ,'total')
title(['2-ray interference, concrete floor \epsilon_r=',num2str(er)])
grid on
axis([0 30 -60 0])


%%%   %%%  er = 1.1  %%%   %%%

% relative permittivity of the floor
er = 1.1;


% reflection coefficient for normal polarisation
rc_norm_11 = ( sinT - sqrt( er - cosT.*cosT ) ) ./ ( sinT + sqrt( er - cosT.*cosT ) );

% 2-Ray Interfence (TRI) calculation
LtriN_11 = -20*log10( 4*pi*dS/l ./ abs( 1 + rc_norm_11.*exp( i*phi ) ) );



% reflection coefficient for parallel polarisation
rc_para_11 = ( -er*sinT2 + sqrt( er - cosT2.*cosT2 ) ) ./ ( er*sinT2 + sqrt( er - cosT2.*cosT2 ) );


% 2-Ray Interfence (TRI) calculation
LtriP_11 = -20*log10( 4*pi*dS/l ./ abs( 1 + rc_para_11.*exp( i*phi2 ) ) );

figure
plot(dS,Lfs-max(Lfs),'k--',dS,LtriN_11-max(LtriN_11),dS,LtriP_11-max(LtriP_11),'LineWidth',2)
xlabel('Position (m)')
ylabel('Normalised power (dB)')
legend('LOS theory','vertical pol','horizontal pol')  % ,'total')
title(['2-ray interference, concrete floor \epsilon_r=',num2str(er)])
grid on
axis([0 30 -60 0])


%%%   %%%  er = 1.5  %%%   %%%

% relative permittivity of the floor
er = 1.5;


% reflection coefficient for normal polarisation
rc_norm_15 = ( sinT - sqrt( er - cosT.*cosT ) ) ./ ( sinT + sqrt( er - cosT.*cosT ) );

% 2-Ray Interfence (TRI) calculation
LtriN_15 = -20*log10( 4*pi*dS/l ./ abs( 1 + rc_norm_15.*exp( i*phi ) ) );



% reflection coefficient for parallel polarisation
rc_para_15 = ( -er*sinT2 + sqrt( er - cosT2.*cosT2 ) ) ./ ( er*sinT2 + sqrt( er - cosT2.*cosT2 ) );


% 2-Ray Interfence (TRI) calculation
LtriP_15 = -20*log10( 4*pi*dS/l ./ abs( 1 + rc_para_15.*exp( i*phi2 ) ) );

figure
plot(dS,Lfs-max(Lfs),'k--',dS,LtriN_15-max(LtriN_15),dS,LtriP_15-max(LtriP_15),'LineWidth',2)
xlabel('Position (m)')
ylabel('Normalised power (dB)')
legend('LOS theory','vertical pol','horizontal pol')  % ,'total')
title(['2-ray interference, concrete floor \epsilon_r=',num2str(er)])
grid on
axis([0 30 -60 0])



%%%   %%%  er = 8.0  %%%   %%%
% repeat reflection coefficient calculations for Rhim & Buyukozturk's
% saturated concrete relative permittivity at 2.45GHz

% relative permittivity of the floor
er = 8.0;


% reflection coefficient for normal polarisation
rc_norm_80 = ( sinT - sqrt( er - cosT.*cosT ) ) ./ ( sinT + sqrt( er - cosT.*cosT ) );

% 2-Ray Interfence (TRI) calculation
LtriN_80 = -20*log10( 4*pi*dS/l ./ abs( 1 + rc_norm_80.*exp( i*phi ) ) );



% reflection coefficient for parallel polarisation
rc_para_80 = ( -er*sinT2 + sqrt( er - cosT2.*cosT2 ) ) ./ ( er*sinT2 + sqrt( er - cosT2.*cosT2 ) );


% 2-Ray Interfence (TRI) calculation
LtriP_80 = -20*log10( 4*pi*dS/l ./ abs( 1 + rc_para_80.*exp( i*phi2 ) ) );

figure
plot(dS,Lfs-max(Lfs),'k--',dS,LtriN_80-max(LtriN_80),dS,LtriP_80-max(LtriP_80),'LineWidth',2)
xlabel('Position (m)')
ylabel('Normalised power (dB)')
legend('LOS theory','vertical pol','horizontal pol')  % ,'total')
title(['2-ray interference, concrete floor \epsilon_r=',num2str(er)])
grid on
axis([0 30 -60 0])


%%%   %%%  summary graphs for all er  %%%   %%%


figure
plot(dS,Lfs-max(Lfs),'k--',dS,LtriN_11-max(LtriN_11),dS,LtriN_15-max(LtriN_15),dS,LtriN_20-max(LtriN_20),dS,LtriN_44-max(LtriN_44),dS,LtriN_80-max(LtriN_80),dS,LtriPEC_N-max(LtriPEC_N),'LineWidth',2)
xlabel('Position (m)')
ylabel('Normalised power (dB)')
legend('LOS theory','floor \epsilon_r=1.1','floor \epsilon_r=1.5','floor \epsilon_r=2.0','floor \epsilon_r=4.4','floor \epsilon_r=8.0','floor PEC')  % ,'total')
title('2-ray interference, vertical pol')
grid on
axis([0 30 -60 0])



figure
plot(dS,Lfs-max(Lfs),'k--',dS,LtriP_11-max(LtriP_11),dS,LtriP_15-max(LtriP_15),dS,LtriP_20-max(LtriP_20),dS,LtriP_44-max(LtriP_44),dS,LtriP_80-max(LtriP_80),dS,LtriPEC_P-max(LtriPEC_P),'LineWidth',2)
xlabel('Position (m)')
ylabel('Normalised power (dB)')
legend('LOS theory','floor \epsilon_r=1.1','floor \epsilon_r=1.5','floor \epsilon_r=2.0','floor \epsilon_r=4.4','floor \epsilon_r=8.0','floor PEC')  % ,'total')
title('2-ray interference, horizontal pol')
grid on
axis([0 30 -60 0])


%%%   %%%


figure
plot(abs(phi),rc_norm_11,abs(phi),rc_norm_15,abs(phi),rc_norm_20,abs(phi),rc_norm_44,abs(phi),rc_norm_80,'LineWidth',2)
xlabel('Angle of incidence (\theta_i)')
ylabel('Reflection coefficient')
legend('\epsilon_r = 1.1','\epsilon_r = 1.5','\epsilon_r = 2.0','\epsilon_r = 4.4','\epsilon_r = 8.0')
title('normal polarisation reflection coefficients')
grid on



figure
plot(abs(phi),rc_para_11,abs(phi),rc_para_15,abs(phi),rc_para_20,abs(phi),rc_para_44,abs(phi),rc_para_80,'LineWidth',2)
xlabel('Angle of incidence (\theta_i)')
ylabel('Reflection coefficient')
legend('\epsilon_r = 1.1','\epsilon_r = 1.5','\epsilon_r = 2.0','\epsilon_r = 4.4','\epsilon_r = 8.0')
title('parallel polarisation reflection coefficients')
grid on




% end of code
