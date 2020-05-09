function normalizedTransformedBandFilterBank = bankTransformerV1(criticalBandFilterBank)
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


%find maximum value of entire filter bank
maxInFilterBank = maxFinder(transformedBandFilterBank,numOfFilters);


%Normalize filter values with max normalization method.
normalizedTransformedBandFilterBank = transformedBandFilterBank;
for filterOrder = 1:numOfFilters
    
    normalizedTransformedBandFilterBank(filterOrder,:) = transformedBandFilterBank(filterOrder,:)./maxInFilterBank;
end    




end

