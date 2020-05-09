function feature1ForS2ForOneFile = feature1ForS2ForOneFileExtractor(trainOneRecord,trained_mu,trained_Sigma,trained_mixmat,trained_prior,trained_transmat)
%FEATURE1FORS2FORONEFILEEXTRACTOR Summary of this function goes here
%   Detailed explanation goes here

addpath('C:\Users\tjdtk\Desktop1\EE519\Homework5\HMM\HMMall\HMM')
addpath('C:\Users\tjdtk\Desktop1\EE519\Homework5\HMM\HMMall\KPMstats')
addpath('C:\Users\tjdtk\Desktop1\EE519\Homework5\HMM\HMMall\KPMtools')
addpath('C:\Users\tjdtk\Desktop1\EE519\Homework5\HMM\HMMall\netlab3.3')

%
[obslik_r1,~] = mixgauss_prob(trainOneRecord,trained_mu,trained_Sigma,trained_mixmat);
path_r1 = viterbi_path(trained_prior,trained_transmat,obslik_r1);

numOfFrame = size(path_r1,2); %e.g. 99
%Compute number of appearances of each state
numOfS1 = 0;
numOfS2 = 0;
numOfS3 = 0;
numOfS4 = 0;
numOfS5 = 0;
for frameIndex = 1:numOfFrame
    if(path_r1(1,frameIndex)==1)
        numOfS1 = numOfS1 + 1;
    elseif(path_r1(1,frameIndex)==2)
        numOfS2 = numOfS2 + 1;
    elseif(path_r1(1,frameIndex)==3)
        numOfS3 = numOfS3 + 1;
    elseif(path_r1(1,frameIndex)==4)
        numOfS4 = numOfS4 + 1;
    elseif(path_r1(1,frameIndex)==5)
        numOfS5 = numOfS5 + 1;
    end
end
lastIndexForS2 = numOfS1+numOfS2;
indexForS2 = [(numOfS1+1):lastIndexForS2];

feature1ForS2ForOneFile = trainOneRecord(1,indexForS2);



end

