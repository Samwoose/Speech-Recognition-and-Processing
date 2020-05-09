function [criticalBandFilterBank,centralBarkArray] = criticalBankFilterGeneratorV1()
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
 


end

