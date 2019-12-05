clear
clc

h_h_measured_data = [
    0.8	-25.61	-25.47
    1	-27.76	-27.69
    1.2	-29.01	-28.91
    1.4	-30.61	-30.44
    1.6	-31.61	-31.33
    1.8	-32.42	-32.25
    2	-33.46	-33.38
    2.2	-34.14	-33.98
    2.4	-34.92	-34.69
    2.6	-35.58	-35.35
    2.8	-36.08	-35.87
    3	-36.72	-36.57
    3.2	-37.66	-37.41
    ];

v_v_measured_data = [
    0.8	-9.76	-9.72
    1	-11.21	-11.19
    1.2	-12.6	-12.57
    1.4	-13.92	-13.87
    1.6	-14.95	-14.91
    1.8	-15.86	-15.81
    2	-16.81	-16.78
    2.2	-17.66	-17.62
    2.4	-18.47	-18.42
    2.6	-18.96	-18.91
    2.8	-19.47	-19.39
    3	-20.33	-20.27
    ]

distance = h_h_measured_data(:,1);


power_average = (h_h_measured_data(:,2) + h_h_measured_data(:,3))./2;

c = 2.998 * 10^8;
f = 2.45 * 10^9;
pt = 0;

% convert dBm into w
pt = (10^(pt/10))/1000;

% convert dBm into w
pr = [];
for i = 1:length(power_average)
    temp = (10^(power_average(i)/10))/1000;
    pr = [pr;temp];
end

wave_length = c/f;

measured_gain_faxe = (20*log10(4*pi*distance./wave_length) + ...
    10*log10(pr./pt)) /2;

figure(5)
plot(distance, measured_gain_faxe)
title('h-h faxe measured Gain figure')
xlabel('distance m')
ylabel('Gain dB')

distance = v_v_measured_data(:,1);


power_average = (v_v_measured_data(:,2) + v_v_measured_data(:,3))./2;

c = 2.998 * 10^8;
f = 2.45 * 10^9;
pt = 0;

% convert dBm into w
pt = (10^(pt/10))/1000;

% convert dBm into w
pr = [];
for i = 1:length(power_average)
    temp = (10^(power_average(i)/10))/1000;
    pr = [pr;temp];
end

wave_length = c/f;

measured_gain_sba = (20*log10(4*pi*distance./wave_length) + ...
    10*log10(pr./pt)) /2;

figure(7)
plot(distance, measured_gain_sba)
title('v-v SBA measured Gain figure')
xlabel('distance m')
ylabel('Gain dB')
