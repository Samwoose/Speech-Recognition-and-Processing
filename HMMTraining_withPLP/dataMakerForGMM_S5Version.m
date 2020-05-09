function [dataForS1, dataForS2, dataForS3, dataForS4, dataForS5 ] = dataMakerForGMM_S5Version(train)
%DATAMAKERFORGMM_S5VERSION Summary of this function goes here
%Obtain data sets with a proper size using the given data set for GMM
%initialization
%   Detailed explanation goes here

numOfFrame4S1 = 20;
% numOfFrame4S2 = 20;
% numOfFrame4S3 = 20;
% numOfFrame4S4 = 20;
% numOfFrame4S5 = 19;

% tensorDepth = size(train,3); %e.g 1060 for cat, 1083 for dog, 1501 for three, 1065 for tree
numOfTotalFrames = size(train,2); % e.g. 99 frames

% numOfSamples4S1 = numOfFrame4S1 * tensorDepth;
% numOfSamples4S2 = numOfFrame4S2 * tensorDepth;
% numOfSamples4S3 = numOfFrame4S3 * tensorDepth;
% numOfSamples4S4 = numOfFrame4S4 * tensorDepth;
% numOfSamples4S5 = numOfFrame4S5 * tensorDepth;

% dataForS1 = zeros(numOfFeature,numOfSamples4S1);
% dataForS2 = zeros(numOfFeature,numOfSamples4S2);
% dataForS3 = zeros(numOfFeature,numOfSamples4S3);
% dataForS4 = zeros(numOfFeature,numOfSamples4S4);
% dataForS5 = zeros(numOfFeature,numOfSamples4S5);

%First partitioning data
dataForS1_1st = train(:,1:numOfFrame4S1,:);
dataForS2_1st = train(:,(numOfFrame4S1+1):(numOfFrame4S1*2),:);
dataForS3_1st = train(:,((numOfFrame4S1*2)+1):(numOfFrame4S1*3),:);
dataForS4_1st = train(:,((numOfFrame4S1*3)+1):(numOfFrame4S1*4),:);
dataForS5_1st = train(:,((numOfFrame4S1*4)+1):numOfTotalFrames,:);



%Second partitoning data
dataForS1 = dataSetReshaperForGMM(dataForS1_1st);
dataForS2 = dataSetReshaperForGMM(dataForS2_1st);
dataForS3 = dataSetReshaperForGMM(dataForS3_1st);
dataForS4 = dataSetReshaperForGMM(dataForS4_1st);
dataForS5 = dataSetReshaperForGMM(dataForS5_1st);
end

