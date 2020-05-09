fileName = 'hw2_TIMIT_LDC93S1.wav';
[audioSignal,Fs ]= audioread(fileName);
audioSignal = audioSignal' ; % make it 1xlength form

%Find abs maximum in signal and normalize
absMaxOfSignal = max(abs(audioSignal));

normalizedAudioSignal = audioSignal./absMaxOfSignal;

%Pick voiced sound segment based on results from HW2
lengthOfSegment = 0.03*Fs;
normalizedAudioSignalSegment = normalizedAudioSignal(5200:5200+lengthOfSegment-1);

%Create continuous time for display purpose
Ts = 1/Fs;
continuousTimeArray = [1:lengthOfSegment].*Ts;

%Windowing signal segment
%Generate Hamming window
hammingWindow = hamming(lengthOfSegment);
hammingWindow = hammingWindow'; % transpose

%Window s[n]
windowed_normalizedAudioSignalSegment = normalizedAudioSignalSegment .* hammingWindow;


%% First section of Homomorphic signal analysis for voiced speech in Figure 2
numberOfDFT = 1024;
numberOfIDFT = 1024;
%Find DFT
dft_windowed_normalizedAudioSignalSegment = fft(windowed_normalizedAudioSignalSegment,numberOfDFT);

%Calculate natural logarithm
LogSpectrum_absOfX = log(abs(dft_windowed_normalizedAudioSignalSegment));

%Take inverse DFT to find cepstrum c[n]
c_n = ifft(LogSpectrum_absOfX,numberOfIDFT);

%Shift c_n properly then c_n can have negative time range.
shifted_c_n = ifftshift(c_n); 

%Generate continuous time array for c_n
amountOfShift = 512;
continuousTimeArray_cepstrum = Ts.*[1:numberOfIDFT] - (Ts*amountOfShift);


%% Second section of Homomorphic signal analysis for voiced speech in Figure 2
lengthOfLifter = 30 ; %any number less than L = 66 in this case.
halfOfLengthOfLifter = lengthOfLifter/2;

%initialize
cepstrumLifter = zeros(1,numberOfDFT);

cepstrumLifter(amountOfShift-halfOfLengthOfLifter+1:amountOfShift+halfOfLengthOfLifter) = rectwin(lengthOfLifter);

lifted_c_n = cepstrumLifter .* shifted_c_n; % 

%Calculate dft of windowed c[n]
dft_lifted_c_n = fft(fftshift(lifted_c_n),numberOfDFT); %need to be shifted because lifted_c_n was shifted before.

%Convert back from log spectrum by taking exponential
originalSpectrum_lifted_x_n = exp(dft_lifted_c_n);

%Inverse DFT 
y_n = ifft(originalSpectrum_lifted_x_n,numberOfIDFT); %lifted x_n

%Calculate dft of y_n
dft_y_n = fft(y_n,numberOfDFT);

%frequency array for plotting
frequencyArray = [1:numberOfDFT] .*(2*pi/numberOfDFT);


%% plotting

figure(1)
plot(continuousTimeArray,normalizedAudioSignalSegment)

figure(2)
plot(continuousTimeArray,windowed_normalizedAudioSignalSegment)

figure(3)
plot(continuousTimeArray_cepstrum,shifted_c_n)
hold on
plot(continuousTimeArray_cepstrum,cepstrumLifter)
hold off

figure(4)
plot(frequencyArray,20*log(abs(dft_y_n)))
xlabel('w(rad)')
hold on
plot(frequencyArray,20*log(abs(dft_windowed_normalizedAudioSignalSegment)))
hold off
