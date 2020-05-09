function [train, test] = dataSetRandomlyDivider(totalData,ratioOfTrainSet,ratioOfTestSet)
%DATASETRANDOMLYDEVIDER Summary of this function goes here
%Divide total data set into train data set and test data set by given ratio
%of data sets
%   Detailed explanation goes here

%Get only features with 99 frames
reducedTotalData = frameLengthFilter(totalData); %reducedTotaldata has 13x99xreducedNumOfSamples dimension

reducedNumOfSamples = size(reducedTotalData,3); %e.g. 1515 for cat, 1547 for dog, 1521 for tree, 2144 for three

%Draw indeces at random
[trainIndex,~,testIndex ]= dividerand(reducedNumOfSamples, ratioOfTrainSet,0,ratioOfTestSet);

train = reducedTotalData(:,:,trainIndex);
test = reducedTotalData(:,:,testIndex);


end

