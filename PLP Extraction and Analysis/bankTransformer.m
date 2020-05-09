function normalizedTransformedBandFilterBank = bankTransformer(criticalBandFilterBank)
%UNTITLED Summary of this function goes here
%Transform given filter bank with U(w)
%U(w) is explained in HW4 description
%   Detailed explanation goes here

N_DFT = 1024;
halfN_DFT = N_DFT/2;

%Generate frequency and Bark values
Fs =16000;
nyquist = Fs/2;
frequencyInterval = nyquist/(halfN_DFT-1); % need to subtract by -1 because frequency start from 0

freqValArray = [0:(halfN_DFT-1)].*frequencyInterval;% need to subtract by -1 because frequency start from 0



numOfFilters = 20; %Number of filters needed to make distance of each filter's centeral frequency approximatley 1 Bark 

%Generate central bark values
lastBark = 6*asinh(nyquist/600);
barkInterval = lastBark/(numOfFilters-1);
centralBarkArray = [0:(numOfFilters-1)].*barkInterval;

transformedBandFilterBank = criticalBandFilterBank;

%trial 1
%Multiply corresponding U(w) to each filter
for filterOrder = 1:numOfFilters
    currentBcj = centralBarkArray(1,filterOrder);
    Uw = UwGenerator(currentBcj,Fs);
    transformedBandFilterBank(filterOrder,:) = criticalBandFilterBank(filterOrder,:).*Uw;
end

% %trial 2
% %Multiply corresponding U(w) to each filter
% for filterOrder = 1:numOfFilters
%     Uw = UwGeneratorV1(freqValArray,Fs);
%     transformedBandFilterBank(filterOrder,:) = criticalBandFilterBank(filterOrder).*Uw;
% end

%find maximum value of entire filter bank
maxInFilterBank = maxFinder(transformedBandFilterBank,numOfFilters);


%Normalize filter values with max normalization method.
normalizedTransformedBandFilterBank = transformedBandFilterBank;
for filterOrder = 1:numOfFilters
    
    normalizedTransformedBandFilterBank(filterOrder,:) = transformedBandFilterBank(filterOrder,:)./maxInFilterBank;
end    


%Plot each filter
figure(1)
t1=tiledlayout(5,1); % Requires R2019b or later

nexttile
plot(freqValArray,normalizedTransformedBandFilterBank(1,:))

nexttile
plot(freqValArray,normalizedTransformedBandFilterBank(2,:))

nexttile
plot(freqValArray,normalizedTransformedBandFilterBank(3,:))

nexttile
plot(freqValArray,normalizedTransformedBandFilterBank(4,:))

nexttile
plot(freqValArray,normalizedTransformedBandFilterBank(5,:))

title(t1,'Filters 1~5')
xlabel(t1,'Frequency(Hz)')
ylabel(t1,'trainformed H_j Value')

figure(2)
t2=tiledlayout(5,1); % Requires R2019b or later

nexttile
plot(freqValArray,normalizedTransformedBandFilterBank(6,:))

nexttile
plot(freqValArray,normalizedTransformedBandFilterBank(7,:))

nexttile
plot(freqValArray,normalizedTransformedBandFilterBank(8,:))

nexttile
plot(freqValArray,normalizedTransformedBandFilterBank(9,:))

nexttile
plot(freqValArray,normalizedTransformedBandFilterBank(10,:))

title(t2,'Filters 6~10')
xlabel(t2,'Frequency(Hz)')
ylabel(t2,'trainformed H_j Value')


figure(3)
t3=tiledlayout(5,1); % Requires R2019b or later

nexttile
plot(freqValArray,normalizedTransformedBandFilterBank(11,:))

nexttile
plot(freqValArray,normalizedTransformedBandFilterBank(12,:))

nexttile
plot(freqValArray,normalizedTransformedBandFilterBank(13,:))

nexttile
plot(freqValArray,normalizedTransformedBandFilterBank(14,:))

nexttile
plot(freqValArray,normalizedTransformedBandFilterBank(15,:))

title(t3,'Filters 11~15')
xlabel(t3,'Frequency(Hz)')
ylabel(t3,'trainformed H_j Value')


figure(4)
t4=tiledlayout(5,1); % Requires R2019b or later

nexttile
plot(freqValArray,normalizedTransformedBandFilterBank(16,:))

nexttile
plot(freqValArray,normalizedTransformedBandFilterBank(17,:))

nexttile
plot(freqValArray,normalizedTransformedBandFilterBank(18,:))

nexttile
plot(freqValArray,normalizedTransformedBandFilterBank(19,:))

nexttile
plot(freqValArray,normalizedTransformedBandFilterBank(20,:))

% Add shared title and axis labels
title(t4,'Filters 16~20')
xlabel(t4,'Frequency(Hz)')
ylabel(t4,'trainformed H_j Value')


end

