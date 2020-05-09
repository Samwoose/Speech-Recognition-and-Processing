%% (a)Properties of window functions
%Create window functions. 100samples for each window
%Rectangular window
numOfSample = 100;
recWindow = rectwin(numOfSample);

%Hamming window
hammingWindow = hamming(numOfSample);

%Visualization for each window in time and frequency domain
wvtool(recWindow)

wvtool(hammingWindow)

%% (b)Short time power estimation
fileName = 'hw2_TIMIT_LDC93S1.wav';
[audioSignal,Fs ]= audioread(fileName);
audioSignal = audioSignal' ; % make it 1xlength form

%zero pad audio signal to avoid a case that the last window overshoots the
%length of signal(original length = 46797 -> padded length = 46800
paddedLength = 46800;
zeroPaddedAudioSignal = zeros(1,paddedLength);

for index = 1:size(zeroPaddedAudioSignal,2)
    if index <= size(audioSignal,2)
        zeroPaddedAudioSignal(index) = audioSignal(index);
    end
end

%Create windows with different sizes. e.g., 10 ,50, 100
lengthOfWindow10 = 160; %0.01*16000 = 160 samples
lengthOfWindow50 = 800; %0.05*16000 = 800 samples
lengthOfWindow100 = 1600; %0.1*16000 = 1600 samples

hammingWindow10 = hamming(lengthOfWindow10);
hammingWindow50 = hamming(lengthOfWindow50);
hammingWindow100 = hamming(lengthOfWindow100);

%Frame signal with 50% overlap
%length of 160 => 50% overlap is 5 samples
lengthOfOverlap_10 = 80;
framedZeroPaddedAudioSignal_10 = buffer(zeroPaddedAudioSignal,lengthOfWindow10,lengthOfOverlap_10);
%transpose the framed signal
framedZeroPaddedAudioSignal_10 = framedZeroPaddedAudioSignal_10' ;

%Calculate x_m with length10 window (x_m is a notation from HW2 pr1(b)
%description
x_m_storage_10 = framedZeroPaddedAudioSignal_10;%initialize
for row = 1:size(framedZeroPaddedAudioSignal_10,1)
    for col = 1:size(framedZeroPaddedAudioSignal_10,2)
        x_m_storage_10(row,col) = framedZeroPaddedAudioSignal_10(row,col)*hammingWindow10(col);
    end
end

%Calculate E_m with length10 window (E_m is a notation form the HW2 pr1(b)
%description
E_m_storage_10 = zeros(size(x_m_storage_10,1),1);%initialize 9360x1 size storage
for index = 1:size(E_m_storage_10,1)
    temp = 0;
    for col = 1:size(x_m_storage_10,2)
        %See the formula in HW2 pr1 (b)
        temp = temp+x_m_storage_10(index,col)*x_m_storage_10(index,col);
    end
    E_m_storage_10(index) = temp;
end

%Transpose E_m_storage to plot propery ( time VS E_m )
E_m_storage_10 = E_m_storage_10';

%Plot time VS E_m graph
%Generate continuous time array for plotting
lengthInTimeUnit_10 = 0.01;%10msec
percentageOfOverlap_10 = 50;% 50%
numOfFrame_10 = size(framedZeroPaddedAudioSignal_10,1);
timeArray_10 = continuousTimeGenerator(lengthInTimeUnit_10,percentageOfOverlap_10,numOfFrame_10);

figure(5)
plot(timeArray_10,E_m_storage_10)
axis tight


%length of 800 => 50% overlap is 400 samples
lengthOfOverlap_50 = 400;
framedZeroPaddedAudioSignal_50 = buffer(zeroPaddedAudioSignal, lengthOfWindow50, lengthOfOverlap_50);
%transpose the framed signal
framedZeroPaddedAudioSignal_50 = framedZeroPaddedAudioSignal_50' ;

%Calculate x_m with length 800 window (x_m is a notation from HW2 pr1(b)
%description
x_m_storage_50 = framedZeroPaddedAudioSignal_50;%initialize
for row = 1:size(framedZeroPaddedAudioSignal_50,1)
    for col = 1:size(framedZeroPaddedAudioSignal_50,2)
        x_m_storage_50(row,col) = framedZeroPaddedAudioSignal_50(row,col)*hammingWindow50(col);
    end
end

%Calculate E_m with length50 window (E_m is a notation form the HW2 pr1(b)
%description
E_m_storage_50 = zeros(size(x_m_storage_50,1),1);%initialize 1872x1 size storage
for index = 1:size(E_m_storage_50,1)
    temp = 0;
    for col = 1:size(x_m_storage_50,2)
        %See the formula in HW2 pr1 (b)
        temp = temp+x_m_storage_50(index,col)*x_m_storage_50(index,col);
    end
    E_m_storage_50(index) = temp;
end

%Transpose E_m_storage to plot propery ( time VS E_m )
E_m_storage_50 = E_m_storage_50';
%Plot time VS E_m graph
%Generate continuous time array for plotting
lengthInTimeUnit_50 = 0.05;%50msec
percentageOfOverlap_50 = 50;% 50%
numOfFrame_50 = size(framedZeroPaddedAudioSignal_50,1);
timeArray_50 = continuousTimeGenerator(lengthInTimeUnit_50,percentageOfOverlap_50,numOfFrame_50);

figure(6)
plot(timeArray_50,E_m_storage_50)
axis tight



%length of 1600 => 50% overlap is 800 samples
lengthOfOverlap_100 = 800;
framedZeroPaddedAudioSignal_100 = buffer(zeroPaddedAudioSignal, lengthOfWindow100, lengthOfOverlap_100);
%transpose the framed signal
framedZeroPaddedAudioSignal_100 = framedZeroPaddedAudioSignal_100' ;

%Calculate x_m with length 1600 window (x_m is a notation from HW2 pr1(b)
%description
x_m_storage_100 = framedZeroPaddedAudioSignal_100;%initialize
for row = 1:size(framedZeroPaddedAudioSignal_100,1)
    for col = 1:size(framedZeroPaddedAudioSignal_100,2)
        x_m_storage_100(row,col) = framedZeroPaddedAudioSignal_100(row,col)*hammingWindow100(col);
    end
end

%Calculate E_m with length100 window (E_m is a notation form the HW2 pr1(b)
%description
E_m_storage_100 = zeros(size(x_m_storage_100,1),1);%initialize 936x1 size storage
for index = 1:size(E_m_storage_100,1)
    temp = 0;
    for col = 1:size(x_m_storage_100,2)
        %See the formula in HW2 pr1 (b)
        temp = temp+x_m_storage_100(index,col)*x_m_storage_100(index,col);
    end
    E_m_storage_100(index) = temp;
end

%Transpose E_m_storage to plot propery ( time VS E_m )
E_m_storage_100 = E_m_storage_100';
%Plot time VS E_m graph
%Generate continuous time array for plotting
lengthInTimeUnit_100 = 0.1;%100msec
percentageOfOverlap_100 = 50;% 50%
numOfFrame_100 = size(framedZeroPaddedAudioSignal_100,1);
timeArray_100 = continuousTimeGenerator(lengthInTimeUnit_100,percentageOfOverlap_100,numOfFrame_100);

figure(7)
plot(timeArray_100,E_m_storage_100)
axis tight

%% (c)Average Magnitude and average zero crossing
%Average Magnitude
%Create Hamming window
lengthOfHamming25 = 400; % 0.025*16000 = 400 samples
hammingWindow25 = hamming(lengthOfHamming25);

normalized_M_n_storage25 = normalizedMnCalculator(zeroPaddedAudioSignal,hammingWindow25);

%Generate continuous time array for plotting
lengthInTimeUnit_25 = 0.025;%25msec
percentageOfOverlap_25 = 60;% 60%
numOfFrame_25 = size(normalized_M_n_storage25,2);
timeArray_25 = continuousTimeGenerator_Overlap60(numOfFrame_25);



figure(8)
p1 = plot(timeArray_25,normalized_M_n_storage25);
axis tight
title('Combine Plots')
hold on

%Average Zero Crossing rate
%Create a defined rentagular window
lengthOfRecWindow25 = 400; % 0.025*16000 = 400 samples
originalRecWindow25 = rectwin(lengthOfRecWindow25);
definedRecWindow25 = (1/(2*lengthOfRecWindow25)) .* originalRecWindow25;

normalized_ZeroCrossingRate_storage25 = normalizedZeroCrossingRateCalculator(zeroPaddedAudioSignal, definedRecWindow25);


p2 = plot(timeArray_25,normalized_ZeroCrossingRate_storage25);
axis tight



%Frame signal with 50% overlap
%length of 160 => 50% overlap is 5 samples
lengthOfOverlap_25 = 240;
framedZeroPaddedAudioSignal_25 = buffer(zeroPaddedAudioSignal, lengthOfHamming25, lengthOfOverlap_25);
%transpose the framed signal
framedZeroPaddedAudioSignal_25 = framedZeroPaddedAudioSignal_25';
 
%Calculate x_m with length25 window (x_m is a notation from HW2 pr1(b)
%description
x_m_storage_25 = framedZeroPaddedAudioSignal_25;%initialize
for row = 1:size(framedZeroPaddedAudioSignal_25,1)
    for col = 1:size(framedZeroPaddedAudioSignal_25,2)
        x_m_storage_25(row,col) = framedZeroPaddedAudioSignal_25(row,col)*hammingWindow25(col);
    end
end
 
%Calculate E_m with length25 window (E_m is a notation form the HW2 pr1(b)
%description
E_m_storage_25 = zeros(size(x_m_storage_25,1),1);%initialize 9360x1 size storage
for index = 1:size(E_m_storage_25,1)
    temp = 0;
    for col = 1:size(x_m_storage_25,2)
        %See the formula in HW2 pr1 (b)
        temp = temp+x_m_storage_25(index,col)*x_m_storage_25(index,col);
    end
    E_m_storage_25(index) = temp;
end
 
%Transpose E_m_storage to plot propery ( time VS E_m )
E_m_storage_25 = E_m_storage_25';
%normalize
max_E_m = max(E_m_storage_25);
normalized_E_m_storage_25 = E_m_storage_25./max_E_m;

p3 = plot(timeArray_25,normalized_E_m_storage_25);
axis tight

%Sampling raw wave
sampledRawWave = samplingOriginalSignal(zeroPaddedAudioSignal,timeArray_25,Fs);
%normalize sampled raw wave
max_sampled_raw_wave = max(abs(sampledRawWave));
normalized_sampled_raw_wave = sampledRawWave./max_sampled_raw_wave;

p4=plot(timeArray_25,normalized_sampled_raw_wave);
axis tight

hold off

%Create Legends
h = [p1;p2;p3;p4];

legend(h,'magnitude','zero crossing rate', 'energy','raw wave form');