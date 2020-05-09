function reducedTotalData = frameLengthFilter(totalData)
%FRAMELENGTHFILTER Summary of this function goes here
%Obtain only data samples with 99 frames
%and reconstruct data set
%   Detailed explanation goes here

oneSample = totalData{1,1};  %13x99 size

tensorHeight = size(oneSample,1); %e.g. 13
tensorWidth = size(oneSample,2); %e.g. 99
tensorDepth = size(totalData,2); %e.g. 1733


numOfReducedSamples = 0;
for orderOfDepth = 1:tensorDepth
    currentSample = totalData{1,orderOfDepth};
    widthOfCurrentSample = size(currentSample,2);
    if(widthOfCurrentSample == tensorWidth)
        numOfReducedSamples = numOfReducedSamples + 1;
    end
end

reducedTensorDepth = numOfReducedSamples;

reducedTotalData = zeros(tensorHeight,tensorWidth,reducedTensorDepth);

indexOfReducedDepth = 1;
for orderOfDepth = 1:tensorDepth
    currentSample = totalData{1,orderOfDepth};
    widthOfCurrentSample = size(currentSample,2);
    if(widthOfCurrentSample == tensorWidth)
        reducedTotalData(:,:,indexOfReducedDepth) = totalData{1,orderOfDepth};
        indexOfReducedDepth = indexOfReducedDepth+1;
    end
end


end

