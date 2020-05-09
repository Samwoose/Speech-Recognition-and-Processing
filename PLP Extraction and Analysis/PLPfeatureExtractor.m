function featureVector = PLPfeatureExtractor(audioFileName)
%PLPFEATUREEXTRACTOR Summary of this function goes here
%Extract PLP coefficients based features from an audio signal 
%   Detailed explanation goes here
[sn,Fs] = audioread(audioFileName); %sn: audio signal, Fs: Sampling frequency
orderOfLPC = 12 ; 
N_DFT = 1024;

%Standardization
sn_std = zscore(sn);

%Framing and Windowing
durationOfWindow = 0.025; %25 msec
lengthOfWindow25 = durationOfWindow * Fs ;
%generate Hamming window
hammingWindow25 = hamming(lengthOfWindow25);
%zero pad audio signal to avoid a case that the last window overshoots the
%length of signal(original length = 16000 -> padded length = 16080
paddedLength = 16080;
originalLength = 16000;

zeroPaddedSn_std = zeros(1,paddedLength);
zeroPaddedSn_std(1:originalLength) = sn_std;

%Framming
lengthOfOverlap10 = 240; %400-0.01*16000=240 i.e. shift window by 10 msec
opt = 'nodelay';
framedZeroPaddedSn_std = buffer(zeroPaddedSn_std,lengthOfWindow25,lengthOfOverlap10,opt);

%windowing
windowedFramedSn_std = windowingOperator(framedZeroPaddedSn_std,hammingWindow25);

%Critical Bands Filter Bank
[criticalBandFilterBank,~] = criticalBankFilterGeneratorV1();

%Transform filters with U(w)
transformedBandFilterBank = bankTransformerV1(criticalBandFilterBank);

%Take DFT onto windowed sn
numOfFrames = size(windowedFramedSn_std,2); %e.g.99 frames
numOfFilters = size(transformedBandFilterBank,1); %e.g.20 filters
windowedFramedSn_std_tr = windowedFramedSn_std';
S_kForAllFrames = zeros(numOfFrames,N_DFT); %99x1024
for orderOfFrame = 1:numOfFrames
    currnetWindowedFramedSn_std = windowedFramedSn_std_tr(orderOfFrame,:);
    S_kForAllFrames(orderOfFrame,:) = fft(currnetWindowedFramedSn_std,N_DFT);%e.g.99(frames)x1024(frameLength)
end

energyWithTransformedFilterBankForAllFrames = zeros(numOfFrames,numOfFilters); %99x20 size

%calculate energy coefficient for all framed S_k
for orderOfFrame = 1:numOfFrames
    currentFrameSk = S_kForAllFrames(orderOfFrame,:);
    currentEnergyCoefficient = energyCoefficientCalculator(transformedBandFilterBank,currentFrameSk);
    energyWithTransformedFilterBankForAllFrames(orderOfFrame,:) = currentEnergyCoefficient;
end

%Calculate G for all frames
cubic_rootCoefficientForAllFrames = energyWithTransformedFilterBankForAllFrames.^(0.33); %99x20 size

%Calculate cepstral coefficients after liting for all frames
cepstralCoefficientsAfterLiftingForAllFrame = zeros(numOfFrames,orderOfLPC+1); %e.g. 99x(12+1)

for orderOfFrame = 1:numOfFrames
    currentCubitCoefficient = cubic_rootCoefficientForAllFrames(orderOfFrame,:);
    [~, ~,currentCepstralCoefficientsAfterLifting] = LPCNCeptralCoefficientCalculator(currentCubitCoefficient);
    cepstralCoefficientsAfterLiftingForAllFrame(orderOfFrame,:) = currentCepstralCoefficientsAfterLifting;
end

%Construct feature vector
featureVector = featureVectorCalculator(cepstralCoefficientsAfterLiftingForAllFrame);



end

