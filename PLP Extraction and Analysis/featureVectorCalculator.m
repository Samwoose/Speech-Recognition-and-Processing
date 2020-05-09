function featureVector = featureVectorCalculator(cepstralCoefficientsAfterLiftingForAllFrame)
%FEATUREVECTORCALCULATOR Summary of this function goes here
%   Detailed explanation goes here

lengthOfFeatureVector = size(cepstralCoefficientsAfterLiftingForAllFrame,2); % 13
numOfFrames = size(cepstralCoefficientsAfterLiftingForAllFrame,1);%e.g.99

featureVector = zeros(1,lengthOfFeatureVector);

for orderOfFeature = 1:lengthOfFeatureVector
    currentCoefficientForAllFrame = cepstralCoefficientsAfterLiftingForAllFrame(:,orderOfFeature)'; %1x99 size
    currentFeatureVal = (sum(currentCoefficientForAllFrame))/numOfFrames;
    featureVector(1,orderOfFeature) = currentFeatureVal;
end



end

