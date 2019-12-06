clear
clc

% measured data v-v
measured_data_v_feko = [
    5.00E+02	-4.515483365E+00	-4.521893604E+00	-4.519015982E+00
    1.00E+03	-8.886960329E+00	-8.853135996E+00	-8.855978312E+00
    1.50E+03	-1.208165994E+01	-1.202484534E+01	-1.203479956E+01
    2.00E+03	-1.433163578E+01	-1.434183782E+01	-1.433621885E+01
    2.50E+03	-1.624705667E+01	-1.623603392E+01	-1.623130596E+01
    3.00E+03	-1.765457818E+01	-1.773145006E+01	-1.772259538E+01
    3.50E+03	-1.930610118E+01	-1.912952592E+01	-1.916373674E+01
    4.00E+03	-1.970457390E+01	-2.018495661E+01	-2.013208533E+01
    4.50E+03	-2.210785931E+01	-2.117423217E+01	-2.126322291E+01
    5.00E+03	-2.210137084E+01	-2.216408502E+01	-2.217124029E+01
    5.50E+03	-2.115806846E+01	-2.315594609E+01	-2.294424064E+01
    6.00E+03	-2.311348915E+01	-2.367613543E+01	-2.365999638E+01
    6.50E+03	-2.749267061E+01	-2.387909192E+01	-2.415088655E+01
    7.00E+03	-2.785153642E+01	-2.448740126E+01	-2.475586181E+01
    7.50E+03	-2.471441142E+01	-2.570439675E+01	-2.573267330E+01
    8.00E+03	-2.311523719E+01	-2.716484267E+01	-2.682406214E+01
    8.50E+03	-2.291826914E+01	-2.815074549E+01	-2.768400839E+01
    9.00E+03	-2.371720550E+01	-2.833157675E+01	-2.800975938E+01
    9.50E+03	-2.537497356E+01	-2.785340646E+01	-2.781173874E+01
    1.00E+04	-2.792875728E+01	-2.730634161E+01	-2.752252777E+01
    1.05E+04	-3.162394291E+01	-2.696771372E+01	-2.733223995E+01
    1.10E+04	-3.689862595E+01	-2.692004399E+01	-2.734585031E+01
    1.15E+04	-4.046604571E+01	-2.706974417E+01	-2.751230414E+01
    1.20E+04	-3.622218121E+01	-2.749742761E+01	-2.792535015E+01
    1.25E+04	-3.273732771E+01	-2.813297202E+01	-2.851797131E+01
    1.30E+04	-3.050900214E+01	-2.890212842E+01	-2.921758708E+01
    1.35E+04	-2.906204637E+01	-2.979053163E+01	-3.003535451E+01
    1.40E+04	-2.819715640E+01	-3.098077130E+01	-3.110685649E+01
    1.45E+04	-2.762017377E+01	-3.223427855E+01	-3.222318852E+01
    1.50E+04	-2.728138050E+01	-3.359386623E+01	-3.340701323E+01
    1.55E+04	-2.710271107E+01	-3.502380199E+01	-3.461210552E+01
    1.60E+04	-2.703418615E+01	-3.637876369E+01	-3.573070205E+01
    1.65E+04	-2.710715444E+01	-3.761382016E+01	-3.673185718E+01
    1.70E+04	-2.727165623E+01	-3.845004098E+01	-3.747273113E+01
    1.75E+04	-2.746719606E+01	-3.880680698E+01	-3.778826607E+01
    1.80E+04	-2.776229848E+01	-3.870351137E+01	-3.783402008E+01
    1.85E+04	-2.809722870E+01	-3.822284468E+01	-3.757481103E+01
    1.90E+04	-2.848699819E+01	-3.760680436E+01	-3.717329615E+01
    1.95E+04	-2.887910258E+01	-3.690242767E+01	-3.665337702E+01
    2.00E+04	-2.933788077E+01	-3.629731510E+01	-3.618382456E+01
    2.05E+04	-2.982151343E+01	-3.574064598E+01	-3.573301676E+01
    2.10E+04	-3.035200610E+01	-3.527787124E+01	-3.534702534E+01
    2.15E+04	-3.089727606E+01	-3.481886437E+01	-3.493835119E+01
    2.20E+04	-3.138380716E+01	-3.440981632E+01	-3.462307410E+01
    2.25E+04	-3.201576951E+01	-3.417186907E+01	-3.436705016E+01
    2.30E+04	-3.262982551E+01	-3.393686659E+01	-3.414916260E+01
    2.35E+04	-3.327152457E+01	-3.369414844E+01	-3.393209892E+01
    2.40E+04	-3.392259032E+01	-3.358418242E+01	-3.382262225E+01
    2.45E+04	-3.457703248E+01	-3.341963496E+01	-3.367286533E+01
    2.50E+04	-3.529224178E+01	-3.332383990E+01	-3.357926216E+01
    2.55E+04	-3.602379920E+01	-3.324351728E+01	-3.351596639E+01
    2.60E+04	-3.674815637E+01	-3.315960184E+01	-3.342655488E+01
    2.65E+04	-3.755077637E+01	-3.313608830E+01	-3.340484958E+01
    2.70E+04	-3.837684439E+01	-3.311999103E+01	-3.339081005E+01
    2.75E+04	-3.925816501E+01	-3.314592714E+01	-3.341398937E+01
    2.80E+04	-4.016599323E+01	-3.311266059E+01	-3.338055337E+01
    2.85E+04	-4.109491671E+01	-3.315245523E+01	-3.341770410E+01
    2.90E+04	-4.211421821E+01	-3.319801781E+01	-3.346274200E+01
    2.95E+04	-4.321177582E+01	-3.325825049E+01	-3.351885261E+01
    3.00E+04	-4.439371543E+01	-3.328395530E+01	-3.353927018E+01
    3.05E+04	-4.558207562E+01	-3.330349121E+01	-3.356689833E+01
    3.10E+04	-4.705038415E+01	-3.343046365E+01	-3.368542994E+01
    3.15E+04	-4.864659496E+01	-3.352714843E+01	-3.377729808E+01
    3.20E+04	-5.046160545E+01	-3.361831519E+01	-3.386504566E+01
    3.25E+04	-5.262627523E+01	-3.372376575E+01	-3.395970984E+01
    3.30E+04	-5.528405288E+01	-3.377229885E+01	-3.401932961E+01
    3.35E+04	-5.888525534E+01	-3.388938009E+01	-3.413528792E+01
    3.40E+04	-6.442828270E+01	-3.396873746E+01	-3.422970582E+01
    3.45E+04	-7.313883909E+01	-3.407512361E+01	-3.435617357E+01
    3.50E+04	-6.562566923E+01	-3.418922322E+01	-3.442078550E+01
    ];

% convert cm into m
distance_v_feko = measured_data_v_feko(:,1)./1000;

power_average_v_feko =  measured_data_v_feko(:,4);


% measured data h_h
measured_data_h_feko  = [
    5.00E+02	-4.538370770E+00	-4.522672878E+00	-4.525282119E+00
    1.00E+03	-8.767015957E+00	-8.777813719E+00	-8.780713326E+00
    1.50E+03	-1.188561555E+01	-1.195200817E+01	-1.193760807E+01
    2.00E+03	-1.443902340E+01	-1.437732079E+01	-1.438733496E+01
    2.50E+03	-1.625589841E+01	-1.622294999E+01	-1.622844943E+01
    3.00E+03	-1.780457603E+01	-1.777172164E+01	-1.777684729E+01
    3.50E+03	-1.892883599E+01	-1.898237191E+01	-1.897050421E+01
    4.00E+03	-2.058977415E+01	-2.049705411E+01	-2.052761459E+01
    4.50E+03	-2.066370569E+01	-2.093850136E+01	-2.088146365E+01
    5.00E+03	-2.172199247E+01	-2.189179266E+01	-2.185433621E+01
    5.50E+03	-2.484728793E+01	-2.426503403E+01	-2.440856698E+01
    6.00E+03	-2.400078262E+01	-2.393602557E+01	-2.395531553E+01
    6.50E+03	-2.221512309E+01	-2.282657106E+01	-2.269483713E+01
    7.00E+03	-2.249794577E+01	-2.307632075E+01	-2.295700860E+01
    7.50E+03	-2.478908177E+01	-2.511043528E+01	-2.503098683E+01
    8.00E+03	-2.877435477E+01	-2.833725607E+01	-2.845662723E+01
    8.50E+03	-3.290245913E+01	-3.112915234E+01	-3.152938953E+01
    9.00E+03	-3.093535207E+01	-3.021008883E+01	-3.040103583E+01
    9.50E+03	-2.780340855E+01	-2.797811685E+01	-2.794077300E+01
    1.00E+04	-2.592906900E+01	-2.641595778E+01	-2.630047955E+01
    1.05E+04	-2.499031585E+01	-2.559506160E+01	-2.544381485E+01
    1.10E+04	-2.466438480E+01	-2.531306420E+01	-2.515907933E+01
    1.15E+04	-2.483017426E+01	-2.543235747E+01	-2.527227645E+01
    1.20E+04	-2.526618821E+01	-2.584705528E+01	-2.569444312E+01
    1.25E+04	-2.596931033E+01	-2.661091611E+01	-2.643991283E+01
    1.30E+04	-2.688267120E+01	-2.754058829E+01	-2.735191166E+01
    1.35E+04	-2.806650932E+01	-2.854974062E+01	-2.843304764E+01
    1.40E+04	-2.958253322E+01	-3.001237841E+01	-2.988881303E+01
    1.45E+04	-3.125750845E+01	-3.160993168E+01	-3.152716480E+01
    1.50E+04	-3.327006878E+01	-3.348975174E+01	-3.344424084E+01
    1.55E+04	-3.561991160E+01	-3.568587781E+01	-3.570175616E+01
    1.60E+04	-3.872478251E+01	-3.828508747E+01	-3.841598622E+01
    1.65E+04	-4.269963827E+01	-4.133381702E+01	-4.169765103E+01
    1.70E+04	-4.771489155E+01	-4.410999153E+01	-4.492316781E+01
    1.75E+04	-4.852596121E+01	-4.473182172E+01	-4.561036112E+01
    1.80E+04	-4.448461854E+01	-4.294275447E+01	-4.337240105E+01
    1.85E+04	-4.127684714E+01	-4.078226710E+01	-4.094810540E+01
    1.90E+04	-3.905596318E+01	-3.898788930E+01	-3.902802795E+01
    1.95E+04	-3.739583934E+01	-3.762681833E+01	-3.755696187E+01
    2.00E+04	-3.625529064E+01	-3.645736858E+01	-3.641182345E+01
    2.05E+04	-3.531817386E+01	-3.556797789E+01	-3.550476100E+01
    2.10E+04	-3.454870460E+01	-3.486544331E+01	-3.479984310E+01
    2.15E+04	-3.392503891E+01	-3.428810523E+01	-3.423121840E+01
    2.20E+04	-3.342442768E+01	-3.378763997E+01	-3.367654881E+01
    2.25E+04	-3.311104563E+01	-3.346379593E+01	-3.335706953E+01
    2.30E+04	-3.281062453E+01	-3.317183042E+01	-3.306832151E+01
    2.35E+04	-3.255919326E+01	-3.290210144E+01	-3.282849724E+01
    2.40E+04	-3.231091551E+01	-3.271554521E+01	-3.260824619E+01
    2.45E+04	-3.223187904E+01	-3.255650809E+01	-3.246058839E+01
    2.50E+04	-3.210103758E+01	-3.244636423E+01	-3.235535825E+01
    2.55E+04	-3.200744702E+01	-3.235863831E+01	-3.226908651E+01
    2.60E+04	-3.191175440E+01	-3.231013942E+01	-3.221786932E+01
    2.65E+04	-3.195309027E+01	-3.225638898E+01	-3.217411411E+01
    2.70E+04	-3.193140026E+01	-3.223109091E+01	-3.214483213E+01
    2.75E+04	-3.192331920E+01	-3.226765599E+01	-3.216968901E+01
    2.80E+04	-3.187337831E+01	-3.229048370E+01	-3.222940905E+01
    2.85E+04	-3.200042596E+01	-3.226948757E+01	-3.218762007E+01
    2.90E+04	-3.203830530E+01	-3.235296242E+01	-3.223337723E+01
    2.95E+04	-3.209266029E+01	-3.239065414E+01	-3.231127879E+01
    3.00E+04	-3.216688500E+01	-3.250626026E+01	-3.238516906E+01
    3.05E+04	-3.223085539E+01	-3.245087626E+01	-3.241848995E+01
    3.10E+04	-3.233742332E+01	-3.261792436E+01	-3.253216717E+01
    3.15E+04	-3.241676746E+01	-3.268406371E+01	-3.260899800E+01
    3.20E+04	-3.250307335E+01	-3.281421560E+01	-3.275203741E+01
    3.25E+04	-3.260059428E+01	-3.288986346E+01	-3.279148165E+01
    3.30E+04	-3.272630037E+01	-3.299037272E+01	-3.291561625E+01
    3.35E+04	-3.283473751E+01	-3.307530066E+01	-3.300818680E+01
    3.40E+04	-3.292258774E+01	-3.322288908E+01	-3.315023590E+01
    3.45E+04	-3.306428068E+01	-3.337869136E+01	-3.331338788E+01
    3.50E+04	-3.320337356E+01	-3.343428879E+01	-3.336277253E+01
    ];

distance_h_feko  = measured_data_h_feko (:,1)./1000;

power_average_h_feko  = measured_data_h_feko(:,4);

figure(1)
plot(distance_v_feko, power_average_v_feko)
title('SBA Power figure')
xlabel('distance m')
ylabel('Normalized Power dBm')
hold on
plot(distance_h_feko , power_average_h_feko )
grid on
hold on


% measured data

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

power_average_v = (measured_data_v(:,2) + measured_data_v(:,3))./2-10;


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

power_average_h  = (measured_data_h (:,2)+measured_data_h(:,3))./2-10;

plot(distance_v, power_average_v)
hold on
plot(distance_h , power_average_h )
grid on
legend('feko v-v 7.5','feko h-h 7.5','measured v-v','measured h-h')

axis([0,35,-60,15])