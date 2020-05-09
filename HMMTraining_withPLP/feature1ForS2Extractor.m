function feature1ForS2NWholeTrainData = feature1ForS2Extractor(train,trained_mu,trained_Sigma,trained_mixmat,trained_prior,trained_transmat)
%FEATURE1FORS2EXTRACTOR Summary of this function goes here
%   Detailed explanation goes here

numOfData = size(train,3); %e.g. 1060
helperIndex = 1;
for dataIndex = 1:numOfData
    feature1ForS2ForOneFile = feature1ForS2ForOneFileExtractor(train(:,:,dataIndex),trained_mu,trained_Sigma,trained_mixmat,trained_prior,trained_transmat);
    sizeOfFeature1ForS2ForOneFile = size(feature1ForS2ForOneFile,2);
    
    for index2 = 1:sizeOfFeature1ForS2ForOneFile
        feature1ForS2NWholeTrainData(1,helperIndex) = feature1ForS2ForOneFile(1,index2);
        helperIndex = helperIndex + 1;
    end    
    disp(dataIndex)
end




end

