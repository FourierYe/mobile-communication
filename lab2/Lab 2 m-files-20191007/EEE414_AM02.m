function [] = EEE414_AM02()


%% 9th of October,  2017


% based on MATLAB script for Proakis, Chapter 3, Illustrative Problems.

% The message signal is +1 for 0 < t < t0/3, -2 for t0/3 < t < 2t0/3, & zero otherwise.


% signal duration
t0 = 0.15;

% sampling interval
ts = 0.0000005;

% carrier frequency
% this is 100kHz as used in the TIMS equipment
fc = 1e5;

% modulation index
m = 1.0;

% sampling frequency
fs = 1/ts;

% time vector
t = [0:ts:t0];

% required frequency resolution
df = 0.25;

% message signal
message = [ ones(1,round( t0/(3*ts) )) , -2*ones(1,round( t0/(3*ts) )) , zeros(1,round( t0/(3*ts) )+1) ];

% carrier signal
c = cos(2*pi*fc.*t);

% check on the carrier
figure
plot(t(1:100),c(1:100))
xlabel('Time (seconds)')
title('Check on the carrier signal')
grid on

% normalized message signal
m_n = message/max(abs(message));

% Fourier transform
[M,message,df1] = fftseq(message,ts,df);

% frequency vector
f = [0:df1:df1*(length(message)-1)] - fs/2;

% modulated signal
u = (1+m*m_n).*c;

% Fourier transform
[U,u,df1] = fftseq(u,ts,df);

% Find the envelope.
%% requires hilbert m-file
env = env_phas(u);                       	

% Remove dc and rescale.
%% demodulate to recover the message signal
dem1 = 2*(env-1)/m;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% add noise to the AM signal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% power in modulated signal
signal_power = spower(u(1:length(t)));

% SNR in dB (logarithmic)
snr = 10;

% SNR
snr_lin = 10^(snr/10);

% power in normalized message
pmn = spower(message(1:length(t)))/(max(abs(message)))^2;

% modulation efficiency
eta = (m^2*pmn)/(1+m^2*pmn);

% noise power
% noise_power = signal_power/100;
noise_power = eta*signal_power/snr_lin;

% noise standard deviation
noise_std = sqrt(noise_power);

% Generate the noise signal
%% this is the same length as the message vector
noise = noise_std*randn(1,length(u));

% Add noise to the modulated signal.
r = u+noise;

% Fourier transform
[R,r,df1] = fftseq(r,ts,df);

% Find the envelope, when noise is present.
%% requires hilbert m-file
env_r = env_phas(r);

% Demodulate in the presence of noise.
dem2 = 2*(env_r-1)/m;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% graph all the signals & spectra
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure      % Figure 2
subplot(2,2,1)
plot(t,message(1:length(t)))
axis([0 0.15 -2.1 2.1])
xlabel('Time')
title('Message signal')

subplot(2,2,2)
plot(t,c(1:length(t)))
axis([0 0.15 -2.1 2.1])
xlabel('Time')
title('Carrier')

subplot(2,2,3)
plot(t,u(1:length(t)))
axis([0 0.15 -2.1 2.1])
xlabel('Time')
title('Modulated signal')

% plots of the magnitude of the message & the modulated signal in the frequency domain.

figure      % Figure 3
subplot(2,1,1)
plot(f,abs(fftshift(M)))
xlabel('Frequency')
title('Spectrum of message signal')
axis([-0.2e6 0.2e6 0 2.5e5])

subplot(2,1,2)
plot(f,abs(fftshift(U)))
title('Spectrum of modulated signal')
xlabel('Frequency')
axis([-0.2e6 0.2e6 0 14e4])



figure      % Figure 4
plot(f,abs(fftshift(M)))
xlabel('Frequency')
title('Spectrum of message signal')
axis([-200 200 0 2.5e5])
grid on

figure      % Figure 5
plot(f,abs(fftshift(U)))
title(['Spectrum of modulated signal, m = ',num2str(m)])
xlabel('Frequency')
axis([9.98e4 10.02e4 0 14e4])
grid on

% plot the noise sample.
% plot the modulated signal and noise.

figure      % Figure 6
subplot(2,1,1)
plot(t,noise(1:length(t)))
title('Noise sample')
% xlabel('Time')
grid on

subplot(2,1,2)
plot(t,r(1:length(t)))
title('Signal + noise')
xlabel('Time')
grid on


% compare AM signal to AM signal with noise
figure      % Figure 7
subplot(2,1,1)
plot(t,u(1:length(t)))
axis([0 0.16 -2.1 2.1])
% xlabel('Time')
title('Modulated signal')
grid on

subplot(2,1,2)
plot(t,r(1:length(t)))
axis([0 0.16 -2.1 2.1])
title('Signal & noise')
xlabel('Time')
grid on


figure      % Figure 8
plot(t,u(1:length(t)),t,r(1:length(t)),'r')
axis([0 0.16 -2.1 2.1])
xlabel('Time')
legend('Signal','Signal + noise')
grid on


% plot the modulated signal and noise in freq. domain.

figure      % Figure 9
subplot(2,1,1)
plot(f,abs(fftshift(U)))
title('Signal spectrum')
xlabel('Frequency')
axis([-0.2e6 0.2e6 0 14e4])

subplot(2,1,2)
plot(f,abs(fftshift(R)))
title('Signal & noise spectrum')
xlabel('Frequency')
axis([-0.2e6 0.2e6 0 14e4])


% Plot of the message.
figure      % Figure 10
subplot(2,1,1)
plot(t,message(1:length(t)))
axis([0 0.15 -2.1 2.1])
xlabel('Time')
title('Message signal')

% plot of the modulated signal.
subplot(2,1,2)
plot(t,u(1:length(t)))
axis([0 0.15 -2.1 2.1])
xlabel('Time')
title('Modulated signal')


% Press a key to see the envelope of the modulated signal.
figure      % Figure 11
subplot(2,1,1)
plot(t,u(1:length(t)))
axis([0 0.15 -2.1 2.1])
xlabel('Time')
title('Modulated signal')

subplot(2,1,2)
plot(t,env(1:length(t)))
xlabel('Time')
title('Envelope of modulated signal')


figure      % Figure 12
plot(t,message(1:length(t)),'--','LineWidth',2)
hold on
plot(t,dem1(1:length(t)))
axis([0 0.15 -2.1 2.1])
xlabel('Time')
legend('Demodulated signal','Message signal')
title(['m = ',num2str(m)])
grid on

% Press a key to compare the message and the demodulated signal.
figure      % Figure 13
subplot(2,1,1)
plot(t,message(1:length(t)))
axis([0 0.15 -2.1 2.1])
xlabel('Time')
title('Message signal')

subplot(2,1,2)
plot(t,dem1(1:length(t)))
xlabel('Time')
title('Demodulated signal')


% plot demodulated signal with noise.

figure      % Figure 14
subplot(2,1,1)
plot(t,message(1:length(t)))
axis([0 0.15 -2.1 2.1])
xlabel('Time')
title('Message signal')

subplot(2,1,2)
plot(t,dem2(1:length(t)))
xlabel('Time')
title('Demodulated signal with noise')



% comparison of the 3 signals

figure      % Figure 15
plot(t,message(1:length(t)),t,dem1(1:length(t)),t,dem2(1:length(t)))
axis([0 0.15 -2.1 2.1])
xlabel('Time')
legend('message','demodulated','with noise')
title(['SNR = ',num2str(snr),'dB'])




% end of code
