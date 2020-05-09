function y_predicted = HMM4Predictor(test_cat,test_dog,test_tree,test_three,trained_prior_cat,trained_transmat_cat,trained_mu_cat,trained_Sigma_cat,trained_mixmat_cat,   trained_prior_dog,trained_transmat_dog,trained_mu_dog,trained_Sigma_dog,trained_mixmat_dog , trained_prior_tree,trained_transmat_tree,trained_mu_tree,trained_Sigma_tree,trained_mixmat_tree , trained_prior_three,trained_transmat_three,trained_mu_three,trained_Sigma_three,trained_mixmat_three )
%HMM4PREDICTOR Summary of this function goes here
%   Detailed explanation goes here

numOfSamples_cat = size(test_cat,3);
numOfSamples_dog = size(test_dog,3);
numOfSamples_tree = size(test_tree,3);
numOfSamples_three = size(test_three,3);

y_predicted = zeros(1,numOfSamples_cat+numOfSamples_dog+numOfSamples_tree+numOfSamples_three);

overallIndex = 1;
%cat
for index_cat = 1:numOfSamples_cat
    crrRecording_cat = test_cat(:,:,index_cat);
    crrPredicedLabel = HMM4PredictorForOneRecord(crrRecording_cat,trained_prior_cat,trained_transmat_cat,trained_mu_cat,trained_Sigma_cat,trained_mixmat_cat,   trained_prior_dog,trained_transmat_dog,trained_mu_dog,trained_Sigma_dog,trained_mixmat_dog , trained_prior_tree,trained_transmat_tree,trained_mu_tree,trained_Sigma_tree,trained_mixmat_tree , trained_prior_three,trained_transmat_three,trained_mu_three,trained_Sigma_three,trained_mixmat_three );
    y_predicted(1,overallIndex) = crrPredicedLabel;
    overallIndex = overallIndex+1;
end

%dog
for index_dog = 1:numOfSamples_dog
    crrRecording_dog = test_dog(:,:,index_dog);
    crrPredicedLabel = HMM4PredictorForOneRecord(crrRecording_dog,trained_prior_cat,trained_transmat_cat,trained_mu_cat,trained_Sigma_cat,trained_mixmat_cat,   trained_prior_dog,trained_transmat_dog,trained_mu_dog,trained_Sigma_dog,trained_mixmat_dog , trained_prior_tree,trained_transmat_tree,trained_mu_tree,trained_Sigma_tree,trained_mixmat_tree , trained_prior_three,trained_transmat_three,trained_mu_three,trained_Sigma_three,trained_mixmat_three );
    y_predicted(1,overallIndex) = crrPredicedLabel;
    overallIndex = overallIndex+1;
end

%tree
for index_tree = 1:numOfSamples_tree
    crrRecording_tree = test_tree(:,:,index_tree);
    crrPredicedLabel = HMM4PredictorForOneRecord(crrRecording_tree,trained_prior_cat,trained_transmat_cat,trained_mu_cat,trained_Sigma_cat,trained_mixmat_cat,   trained_prior_dog,trained_transmat_dog,trained_mu_dog,trained_Sigma_dog,trained_mixmat_dog , trained_prior_tree,trained_transmat_tree,trained_mu_tree,trained_Sigma_tree,trained_mixmat_tree , trained_prior_three,trained_transmat_three,trained_mu_three,trained_Sigma_three,trained_mixmat_three );
    y_predicted(1,overallIndex) = crrPredicedLabel;
    overallIndex = overallIndex+1;
end

%three
for index_three = 1:numOfSamples_three
    crrRecording_three = test_three(:,:,index_three);
    crrPredicedLabel = HMM4PredictorForOneRecord(crrRecording_three,trained_prior_cat,trained_transmat_cat,trained_mu_cat,trained_Sigma_cat,trained_mixmat_cat,   trained_prior_dog,trained_transmat_dog,trained_mu_dog,trained_Sigma_dog,trained_mixmat_dog , trained_prior_tree,trained_transmat_tree,trained_mu_tree,trained_Sigma_tree,trained_mixmat_tree , trained_prior_three,trained_transmat_three,trained_mu_three,trained_Sigma_three,trained_mixmat_three );
    y_predicted(1,overallIndex) = crrPredicedLabel;
    overallIndex = overallIndex+1;
end

