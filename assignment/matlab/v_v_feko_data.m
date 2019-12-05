clear
clc

% feko data v-v
feko_data = [
    5.00E+02	-1.866002141E+01	-1.872335865E+01	-1.871068305E+01
1.00E+03	-2.546464610E+01	-2.491981645E+01	-2.499924302E+01
1.50E+03	-2.950620696E+01	-2.855664864E+01	-2.869256294E+01
2.00E+03	-2.908673179E+01	-3.026334423E+01	-3.009063209E+01
2.50E+03	-3.003050727E+01	-3.204622796E+01	-3.175134535E+01
3.00E+03	-3.266620162E+01	-3.405340287E+01	-3.391883020E+01
3.50E+03	-4.019443711E+01	-3.582167225E+01	-3.627400089E+01
4.00E+03	-3.272325131E+01	-3.650874394E+01	-3.601175136E+01
4.50E+03	-3.898508274E+01	-3.760241206E+01	-3.791366423E+01
5.00E+03	-3.916631001E+01	-3.846593674E+01	-3.875422213E+01
5.50E+03	-3.457676371E+01	-4.004230617E+01	-3.935208600E+01
6.00E+03	-3.683878759E+01	-4.038634621E+01	-4.018736082E+01
6.50E+03	-4.556976844E+01	-3.991581993E+01	-4.047519288E+01
7.00E+03	-4.788804108E+01	-4.031505621E+01	-4.090947386E+01
7.50E+03	-4.013384652E+01	-4.181320406E+01	-4.198440824E+01
8.00E+03	-3.791853926E+01	-4.398737774E+01	-4.349373185E+01
8.50E+03	-3.765509101E+01	-4.567942498E+01	-4.473302412E+01
9.00E+03	-3.853871190E+01	-4.564421710E+01	-4.501409058E+01
9.50E+03	-4.032428661E+01	-4.458866519E+01	-4.453144858E+01
1.00E+04	-4.304029969E+01	-4.361324124E+01	-4.391715906E+01
1.05E+04	-4.707702745E+01	-4.304010323E+01	-4.350970725E+01
1.10E+04	-5.397910438E+01	-4.285978027E+01	-4.338863485E+01
1.15E+04	-6.844517313E+01	-4.300803001E+01	-4.353999811E+01
1.20E+04	-5.388080656E+01	-4.342641259E+01	-4.392951806E+01
1.25E+04	-4.913944529E+01	-4.407141768E+01	-4.452424522E+01
1.30E+04	-4.664272322E+01	-4.491296439E+01	-4.529749809E+01
1.35E+04	-4.513110553E+01	-4.593114335E+01	-4.622846065E+01
1.40E+04	-4.417667552E+01	-4.711343146E+01	-4.729988598E+01
1.45E+04	-4.358067539E+01	-4.845028866E+01	-4.849442512E+01
1.50E+04	-4.323396587E+01	-4.992905811E+01	-4.978800252E+01
1.55E+04	-4.306987952E+01	-5.152041013E+01	-5.113946867E+01
1.60E+04	-4.304466541E+01	-5.315121456E+01	-5.247389751E+01
1.65E+04	-4.312819643E+01	-5.466043354E+01	-5.366696549E+01
1.70E+04	-4.329881227E+01	-5.577668040E+01	-5.455346910E+01
1.75E+04	-4.354053627E+01	-5.623439786E+01	-5.499598084E+01
1.80E+04	-4.384138240E+01	-5.601583669E+01	-5.498059225E+01
1.85E+04	-4.419215839E+01	-5.536694974E+01	-5.462563613E+01
1.90E+04	-4.458573316E+01	-5.455882410E+01	-5.409031030E+01
1.95E+04	-4.501649499E+01	-5.375382387E+01	-5.349800516E+01
2.00E+04	-4.548013285E+01	-5.302128412E+01	-5.292006477E+01
2.05E+04	-4.597321877E+01	-5.238161454E+01	-5.239021547E+01
2.10E+04	-4.649321037E+01	-5.183436180E+01	-5.192071212E+01
2.15E+04	-4.703810840E+01	-5.137144551E+01	-5.151313461E+01
2.20E+04	-4.760658462E+01	-5.098282340E+01	-5.116409794E+01
2.25E+04	-4.819769403E+01	-5.065878306E+01	-5.086852283E+01
2.30E+04	-4.881088105E+01	-5.039052338E+01	-5.062076143E+01
2.35E+04	-4.944608801E+01	-5.017052307E+01	-5.041549455E+01
2.40E+04	-5.010364750E+01	-4.999227060E+01	-5.024762002E+01
2.45E+04	-5.078420897E+01	-4.985024215E+01	-5.011284388E+01
2.50E+04	-5.148885629E+01	-4.973978600E+01	-5.000720612E+01
2.55E+04	-5.221911776E+01	-4.965688002E+01	-4.992733811E+01
2.60E+04	-5.297696866E+01	-4.959812444E+01	-4.987019204E+01
2.65E+04	-5.376500094E+01	-4.956066694E+01	-4.983326315E+01
2.70E+04	-5.458640387E+01	-4.954193852E+01	-4.981422410E+01
2.75E+04	-5.544529339E+01	-4.953979542E+01	-4.981114440E+01
2.80E+04	-5.634666274E+01	-4.955235318E+01	-4.982224593E+01
2.85E+04	-5.729697213E+01	-4.957795022E+01	-4.984598505E+01
2.90E+04	-5.830435467E+01	-4.961514739E+01	-4.988103732E+01
2.95E+04	-5.937929096E+01	-4.966276282E+01	-4.992624534E+01
3.00E+04	-6.053569320E+01	-4.971959620E+01	-4.998050163E+01
3.05E+04	-6.179228042E+01	-4.978469334E+01	-5.004289726E+01
3.10E+04	-6.317510896E+01	-4.985719789E+01	-5.011258649E+01
3.15E+04	-6.472190323E+01	-4.993631277E+01	-5.018884293E+01
3.20E+04	-6.649023472E+01	-5.002137281E+01	-5.027097712E+01
3.25E+04	-6.857420553E+01	-5.011176158E+01	-5.035844839E+01
3.30E+04	-7.114370335E+01	-5.020696602E+01	-5.045062803E+01
3.35E+04	-7.455660126E+01	-5.030640828E+01	-5.054712221E+01
3.40E+04	-7.980400429E+01	-5.040972027E+01	-5.064749584E+01
3.45E+04	-9.227183769E+01	-5.051643489E+01	-5.075122830E+01
3.50E+04	-8.501155450E+01	-5.062621525E+01	-5.085813617E+01
];


c = 2.998 * 10^8;
f = 2.45 * 10^9;
pt = 13;

% convert dBm into w
pt = (10^(pt/10))/1000;

distance = feko_data(:,1)./100;

power = feko_data(:,3)

% convert dBm into w
pr = []; 
for i = 1:length(power)
    temp = (10^(power(i)/10))/1000;
    pr = [pr;temp];
end

wave_length = c/f;

feko_gain_v_v = (20*log10(4*pi*distance./wave_length) + ...
10*log10(pr./pt)) /2;

figure(3)
plot(distance, feko_gain_v_v)
title('v\-v feko Gain figure')
xlabel('distance m')
ylabel('Gain dB')

figure(4)
plot(distance, power)
title('v\-v feko Power figure')
xlabel('distance m')
ylabel('Power dBm')
