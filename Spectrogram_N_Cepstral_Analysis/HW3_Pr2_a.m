fileName = 'hw3_SpectralAnalysis.wav';
[audioSignal,Fs ]= audioread(fileName);
audioSignal = audioSignal' ; % make it 1xlength form

lengthOfHamming4Narrowband = 800;
lengthOfHamming4Wideband = 200;

%50 percent overlap
lengthOfOverlap4Narrowband = 400;
lengthOfOverlap4Wideband = 100;

%Wideband spectrogram
figure(1)
spectrogram(audioSignal,lengthOfHamming4Wideband,lengthOfOverlap4Wideband,lengthOfHamming4Wideband,Fs,'yaxis')

%Narrowband spectrogram
figure(2)
spectrogram(audioSignal, lengthOfHamming4Narrowband, lengthOfOverlap4Narrowband, lengthOfHamming4Narrowband,Fs,'yaxis')
