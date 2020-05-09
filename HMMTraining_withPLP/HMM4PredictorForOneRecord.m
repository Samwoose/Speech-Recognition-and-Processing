function crrPredicedLabel = HMM4PredictorForOneRecord(crrRecording,trained_prior_cat,trained_transmat_cat,trained_mu_cat,trained_Sigma_cat,trained_mixmat_cat,   trained_prior_dog,trained_transmat_dog,trained_mu_dog,trained_Sigma_dog,trained_mixmat_dog , trained_prior_tree,trained_transmat_tree,trained_mu_tree,trained_Sigma_tree,trained_mixmat_tree , trained_prior_three,trained_transmat_three,trained_mu_three,trained_Sigma_three,trained_mixmat_three )
%HMM4PREDICTORFORONERECORD Summary of this function goes here
%   Detailed explanation goes here

[loglik_byHMM1ForCat,~] = mhmm_logprob(crrRecording,trained_prior_cat , trained_transmat_cat , trained_mu_cat , trained_Sigma_cat, trained_mixmat_cat );
[loglik_byHMM2ForDog,~] = mhmm_logprob(crrRecording,trained_prior_dog , trained_transmat_dog , trained_mu_dog , trained_Sigma_dog, trained_mixmat_dog );
[loglik_byHMM3ForTree,~] = mhmm_logprob(crrRecording,trained_prior_tree , trained_transmat_tree , trained_mu_tree , trained_Sigma_tree, trained_mixmat_tree );
[loglik_byHMM4ForThree,~] = mhmm_logprob(crrRecording,trained_prior_three , trained_transmat_three, trained_mu_three , trained_Sigma_three, trained_mixmat_three );

loglikStorage = [loglik_byHMM1ForCat, loglik_byHMM2ForDog, loglik_byHMM3ForTree , loglik_byHMM4ForThree];


[~,location ] = max(loglikStorage);

crrPredicedLabel = location - 1;
end

