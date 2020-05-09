function [criticalBandFilterBank,centralBarkArray] = criticalBankFilterGenerator()
%CRITICALBANKFILTERGENERATOR Summary of this function goes here
%   Detailed explanation goes here

N_DFT = 1024;
halfN_DFT = N_DFT/2;
numOfFilters = 20; %Number of filters needed to make distance of each filter's centeral frequency approximatley 1 Bark 

%Generate frequency and Bark values
Fs =16000;
nyquist = Fs/2;
frequencyInterval = nyquist/(halfN_DFT-1); % need to subtract by -1 because frequency start from 0

freqValArray = [0:(halfN_DFT-1)].*frequencyInterval;% need to subtract by -1 because frequency start from 0
barkValArray = 6*asinh(freqValArray./600);

%Generate central bark values
lastBark = 6*asinh(nyquist/600);
barkInterval = lastBark/(numOfFilters-1);
centralBarkArray = [0:(numOfFilters-1)].*barkInterval;

criticalBandFilterBank = zeros(numOfFilters, halfN_DFT);

%Generate filters and save them to the filter bank
for filterOrder = 1:numOfFilters
    currentCentralBark = centralBarkArray(1,filterOrder);
    criticalBandFilterBank(filterOrder,:) = HjFilterGenerator(barkValArray,currentCentralBark);
    
end
 
%Plot each filter
figure(1)
t1=tiledlayout(5,1); % Requires R2019b or later

nexttile
plot(freqValArray,criticalBandFilterBank(1,:))

nexttile
plot(freqValArray,criticalBandFilterBank(2,:))

nexttile
plot(freqValArray,criticalBandFilterBank(3,:))

nexttile
plot(freqValArray,criticalBandFilterBank(4,:))

nexttile
plot(freqValArray,criticalBandFilterBank(5,:))

title(t1,'Filters 1~5')
xlabel(t1,'Frequency(Hz)')
ylabel(t1,'H_j Value')

figure(2)
t2=tiledlayout(5,1); % Requires R2019b or later

nexttile
plot(freqValArray,criticalBandFilterBank(6,:))

nexttile
plot(freqValArray,criticalBandFilterBank(7,:))

nexttile
plot(freqValArray,criticalBandFilterBank(8,:))

nexttile
plot(freqValArray,criticalBandFilterBank(9,:))

nexttile
plot(freqValArray,criticalBandFilterBank(10,:))

title(t2,'Filters 6~10')
xlabel(t2,'Frequency(Hz)')
ylabel(t2,'H_j Value')


figure(3)
t3=tiledlayout(5,1); % Requires R2019b or later

nexttile
plot(freqValArray,criticalBandFilterBank(11,:))

nexttile
plot(freqValArray,criticalBandFilterBank(12,:))

nexttile
plot(freqValArray,criticalBandFilterBank(13,:))

nexttile
plot(freqValArray,criticalBandFilterBank(14,:))

nexttile
plot(freqValArray,criticalBandFilterBank(15,:))

title(t3,'Filters 11~15')
xlabel(t3,'Frequency(Hz)')
ylabel(t3,'H_j Value')


figure(4)
t4=tiledlayout(5,1); % Requires R2019b or later

nexttile
plot(freqValArray,criticalBandFilterBank(16,:))

nexttile
plot(freqValArray,criticalBandFilterBank(17,:))

nexttile
plot(freqValArray,criticalBandFilterBank(18,:))

nexttile
plot(freqValArray,criticalBandFilterBank(19,:))

nexttile
plot(freqValArray,criticalBandFilterBank(20,:))

% Add shared title and axis labels
title(t4,'Filters 16~20')
xlabel(t4,'Frequency(Hz)')
ylabel(t4,'H_j Value')

end

