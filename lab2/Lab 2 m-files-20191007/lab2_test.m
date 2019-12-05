
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
m = 1.5;

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
% figure
% plot(t(1:100),c(1:100))
% xlabel('Time (seconds)')
% title('Check on the carrier signal')
% grid on

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


% Comparison of the demodulated message to the original message

figure      % Figure 12
plot(t,message(1:length(t)),'--','LineWidth',2)
hold on
plot(t,dem1(1:length(t)))
axis([0 0.15 -2.1 2.1])
xlabel('Time')
legend('Demodulated signal','Message signal')
title(['m = ',num2str(m)])
grid on

% Spectrum of modulated signal

figure      % Figure 5
plot(f,abs(fftshift(U)))
title(['Spectrum of modulated signal, m = ',num2str(m)])
xlabel('Frequency')
axis([9.98e4 10.02e4 0 14e4])
grid on