%% (a)
fileName = 'hw2_TIMIT_LDC93S1.wav';
[audioSignal,Fs ]= audioread(fileName);
audioSignal = audioSignal' ; % make it 1xlength form

Ts = 1/Fs; %Sampling interval.

%Normalize the audio signal
abs_maxValueOfSignal = max(abs(audioSignal));
normalizedAudioSignal = audioSignal ./ (abs_maxValueOfSignal);

timeLength = 0.03; %30 msec
lengthOfPartialSignal = Fs*timeLength;
halfLengthOfPartialSignal = lengthOfPartialSignal/2;
timeLocationOfVoicedSound = 0.33; %Not sure this one yet
CenterTargetIndex = timeLocationOfVoicedSound*Fs;
indexes = [(CenterTargetIndex-halfLengthOfPartialSignal+1):(CenterTargetIndex+halfLengthOfPartialSignal)];

%s_n represents s[n] in HW2 descrition.
s_n = normalizedAudioSignal(indexes);

continuousTimeArray = [1:lengthOfPartialSignal].*Ts;

%Generate Hamming window
hammingWindow = hamming(lengthOfPartialSignal);
hammingWindow = hammingWindow'; % transpose

%Window s[n]
windowed_s_n = s_n .* hammingWindow;


%plotting 
%(1)continuous time vs non-windowed s[n]
figure(1)
plot(continuousTimeArray, s_n)

%(2)continuous time vs windowed s[n]
figure(2)
plot(continuousTimeArray, windowed_s_n)

%% (b)
N_fft = 1024; %Length of DFT
orderOf_p = 20; % It can change depending on model you want to estimate
% %portion of normalized original signal
% %Perform Linear Prediction Filter Coefficient
% a_nonWindowed = lpc(s_n,orderOf_p);
% est_s_n_nonWindowed = filter([1 -a_nonWindowed(2:end)],1,s_n); %
% 
% error_nonWindowed = s_n - est_s_n_nonWindowed;
% gain_nonWindowed = gainEstimator(error_nonWindowed);
% 
% %Calculate error spectrum
% dft_error_nonWindowed = fft(error_nonWindowed,N_fft);
% %Change unit to dB
% Magnitude_eft_error_nonWindowed_dB = 20*log10(abs(dft_error_nonWindowed));
% %Plot
% figure(3)
% plot(Magnitude_eft_error_nonWindowed_dB)
% 
% %Find H(z) spectrum
% [h_nonWindowed,w] = freqz(gain_nonWindowed,[1 -a_nonWindowed(2:end)],N_fft);
% 
% figure(4)
% plot(abs(h_nonWindowed));

%portion of normalized windowed signal
a_windowed = lpc(windowed_s_n,orderOf_p);

est_s_n_windowed = filter([0 -a_windowed(2:end)],1,windowed_s_n); %

error_windowed = windowed_s_n - est_s_n_windowed;
gain_windowed = gainEstimator(error_windowed);

%Calculate error spectrum
dft_error_windowed = fft(error_windowed,N_fft);
%Calculate error spectrum
dft_windowed_s_n = fft(windowed_s_n,N_fft);
%Change unit to dB
Magnitude_dft_error_windowed_dB = 20*log10(abs(dft_error_windowed));
Magnitude_dft_windowed_s_n_dB = 20*log10(abs(dft_windowed_s_n));

%Plot
figure(5)
plot(Magnitude_dft_error_windowed_dB)

%Find H(z) spectrum
[h_windowed,w] = freqz(gain_windowed,[1 -a_windowed(2:end)],N_fft/2);

figure(6)
p1 = plot(20*log10(abs(h_windowed)));

hold on

p2 = plot(Magnitude_dft_windowed_s_n_dB(1:512));

h = [p1;p2];

legend(h,'H(z)','X(z)')
hold off