clear
clc

% measured data h_h
measured_data = [
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

distance = measured_data(:,1);

power_average = (measured_data(:,2) + measured_data(:,3))./2;

c = 2.998 * 10^8;
f = 2.45 * 10^9;
pt = 13;

% convert dBm into w
pt = (10^(pt/10))/1000;

% convert dBm into w
pr = []; 
for i = 1:length(power_average)
    temp = (10^(power_average(i)/10))/1000;
    pr = [pr;temp];
end

wave_length = c/f;

measured_gain = (20*log10(4*pi*distance./wave_length) + ...
10*log10(pr./pt)) /2;

figure(5)
plot(distance, measured_gain)
title('h\_h measured Gain figure')
xlabel('distance m')
ylabel('Gain dB')

figure(6)
plot(distance, power_average)
title('h\_h measured Received Power figure')
xlabel('distance m')
ylabel('Power dBm')
