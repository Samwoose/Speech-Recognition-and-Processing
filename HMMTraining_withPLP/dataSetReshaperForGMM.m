function dataForS = dataSetReshaperForGMM(dataForS_1st)
%DATASETRESHAPERFORGMM Summary of this function goes here
%   Detailed explanation goes here
tensorDepth = size(dataForS_1st,3);%e.g 1060 for dog
numOfFrames = size(dataForS_1st,2);%e.g 20 frames for the first state
numOfFeatures = size(dataForS_1st,1);%e.g. 13 dimension

numOfSamples = tensorDepth*numOfFrames; %e.g. 1060*20

dataForS = zeros(numOfFeatures,numOfSamples);

sampleIndex = 1;
for widthIndex = 1:numOfFrames
    for depthIndex =1:tensorDepth
        dataForS(:,sampleIndex) = dataForS_1st(:,widthIndex,depthIndex);
        sampleIndex = sampleIndex + 1;
    end
end


end

