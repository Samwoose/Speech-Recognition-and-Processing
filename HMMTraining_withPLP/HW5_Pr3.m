%Load PLP data
load('plps_hw4.mat')

%Add path for a toolbox
addpath('C:\Users\tjdtk\Desktop1\EE519\Homework5\HMM\HMMall\HMM')
addpath('C:\Users\tjdtk\Desktop1\EE519\Homework5\HMM\HMMall\KPMstats')
addpath('C:\Users\tjdtk\Desktop1\EE519\Homework5\HMM\HMMall\KPMtools')
addpath('C:\Users\tjdtk\Desktop1\EE519\Homework5\HMM\HMMall\netlab3.3')
addpath('C:\Users\tjdtk\Desktop1\EE519\Homework5\Plot_GM')



%% Partioning data into training(70%) set and test(30%) set
digit_cat =1;
digit_dog =2;
digit_tree = 3;
digit_three = 4;

totalData = plp;
totalData_cat = [totalData{1,digit_cat}];
totalData_dog = [totalData{1,digit_dog}];
totalData_tree = [totalData{1,digit_tree}];
totalData_three = [totalData{1,digit_three}];

ratioOfTrainSet = 0.7;
ratioOfTestSet = 0.3;

[train_cat, test_cat] = dataSetRandomlyDivider(totalData_cat,ratioOfTrainSet,ratioOfTestSet);
[train_dog, test_dog] = dataSetRandomlyDivider(totalData_dog,ratioOfTrainSet,ratioOfTestSet);
[train_tree, test_tree] = dataSetRandomlyDivider(totalData_tree,ratioOfTrainSet,ratioOfTestSet);
[train_three, test_three] = dataSetRandomlyDivider(totalData_three,ratioOfTrainSet,ratioOfTestSet);

%% Part 1: Initialization 
%(b)
[dataForS1_cat, dataForS2_cat, dataForS3_cat, dataForS4_cat, dataForS5_cat ] = dataMakerForGMM_S5Version(train_cat);
[dataForS1_dog, dataForS2_dog, dataForS3_dog, dataForS4_dog, dataForS5_dog ] = dataMakerForGMM_S5Version(train_dog);
[dataForS1_tree, dataForS2_tree, dataForS3_tree, dataForS4_tree, dataForS5_tree ] = dataMakerForGMM_S5Version(train_tree);
[dataForS1_three, dataForS2_three, dataForS3_three, dataForS4_three, dataForS5_three ] = dataMakerForGMM_S5Version(train_three);

%get mean and std
numOfMixtures = 3;
numOfFeatures = 13;
numOfStates = 5;

%cat
[mu4S1_cat, Sigma4S1_cat, weights4S1_cat] = mixgauss_init(numOfMixtures, dataForS1_cat, 'diag');
[mu4S2_cat, Sigma4S2_cat, weights4S2_cat] = mixgauss_init(numOfMixtures, dataForS2_cat, 'diag');
[mu4S3_cat, Sigma4S3_cat, weights4S3_cat] = mixgauss_init(numOfMixtures, dataForS3_cat, 'diag');
[mu4S4_cat, Sigma4S4_cat, weights4S4_cat] = mixgauss_init(numOfMixtures, dataForS4_cat, 'diag');
[mu4S5_cat, Sigma4S5_cat, weights4S5_cat] = mixgauss_init(numOfMixtures, dataForS5_cat, 'diag');


mu4AllStates_cat = muCombinder(mu4S1_cat, mu4S2_cat, mu4S3_cat, mu4S4_cat, mu4S5_cat, numOfFeatures, numOfStates, numOfMixtures);
Sigma4AllStates_cat = sigmaCombinder(Sigma4S1_cat,Sigma4S2_cat,Sigma4S3_cat,Sigma4S4_cat,Sigma4S5_cat,numOfFeatures, numOfStates, numOfMixtures); 

%dog
[mu4S1_dog, Sigma4S1_dog, weights4S1_dog] = mixgauss_init(numOfMixtures, dataForS1_dog, 'diag');
[mu4S2_dog, Sigma4S2_dog, weights4S2_dog] = mixgauss_init(numOfMixtures, dataForS2_dog, 'diag');
[mu4S3_dog, Sigma4S3_dog, weights4S3_dog] = mixgauss_init(numOfMixtures, dataForS3_dog, 'diag');
[mu4S4_dog, Sigma4S4_dog, weights4S4_dog] = mixgauss_init(numOfMixtures, dataForS4_dog, 'diag');
[mu4S5_dog, Sigma4S5_dog, weights4S5_dog] = mixgauss_init(numOfMixtures, dataForS5_dog, 'diag');

mu4AllStates_dog = muCombinder(mu4S1_dog, mu4S2_dog, mu4S3_dog, mu4S4_dog, mu4S5_dog, numOfFeatures, numOfStates, numOfMixtures);
Sigma4AllStates_dog = sigmaCombinder(Sigma4S1_dog,Sigma4S2_dog,Sigma4S3_dog,Sigma4S4_dog,Sigma4S5_dog,numOfFeatures, numOfStates, numOfMixtures); 

%tree
[mu4S1_tree, Sigma4S1_tree, weights4S1_tree] = mixgauss_init(numOfMixtures, dataForS1_tree, 'diag');
[mu4S2_tree, Sigma4S2_tree, weights4S2_tree] = mixgauss_init(numOfMixtures, dataForS2_tree, 'diag');
[mu4S3_tree, Sigma4S3_tree, weights4S3_tree] = mixgauss_init(numOfMixtures, dataForS3_tree, 'diag');
[mu4S4_tree, Sigma4S4_tree, weights4S4_tree] = mixgauss_init(numOfMixtures, dataForS4_tree, 'diag');
[mu4S5_tree, Sigma4S5_tree, weights4S5_tree] = mixgauss_init(numOfMixtures, dataForS5_tree, 'diag');

mu4AllStates_tree = muCombinder(mu4S1_tree, mu4S2_tree, mu4S3_tree, mu4S4_tree, mu4S5_tree, numOfFeatures, numOfStates, numOfMixtures);
Sigma4AllStates_tree = sigmaCombinder(Sigma4S1_tree,Sigma4S2_tree,Sigma4S3_tree,Sigma4S4_tree,Sigma4S5_tree,numOfFeatures, numOfStates, numOfMixtures); 


%three
[mu4S1_three, Sigma4S1_three, weights4S1_three] = mixgauss_init(numOfMixtures, dataForS1_three, 'diag');
[mu4S2_three, Sigma4S2_three, weights4S2_three] = mixgauss_init(numOfMixtures, dataForS2_three, 'diag');
[mu4S3_three, Sigma4S3_three, weights4S3_three] = mixgauss_init(numOfMixtures, dataForS3_three, 'diag');
[mu4S4_three, Sigma4S4_three, weights4S4_three] = mixgauss_init(numOfMixtures, dataForS4_three, 'diag');
[mu4S5_three, Sigma4S5_three, weights4S5_three] = mixgauss_init(numOfMixtures, dataForS5_three, 'diag');

mu4AllStates_three = muCombinder(mu4S1_three, mu4S2_three, mu4S3_three, mu4S4_three, mu4S5_three, numOfFeatures, numOfStates, numOfMixtures);
Sigma4AllStates_three = sigmaCombinder(Sigma4S1_three,Sigma4S2_three,Sigma4S3_three,Sigma4S4_three,Sigma4S5_three,numOfFeatures, numOfStates, numOfMixtures); 

%% Part2: Training 
%(a)
%initialize prior and transition matrix
prior = [1 ;0 ;0 ;0 ;0] ;%not sure about this
transitMatrix = [0.5 0.5 0 0 0; 0 0.5 0.5 0 0; 0 0 0.5 0.5 0; 0 0 0 0.5 0.5; 0 0 0 0 1];
mixmat_cat = [weights4S1_cat' ;weights4S2_cat' ; weights4S3_cat' ; weights4S4_cat' ; weights4S5_cat'];
mixmat_dog = [weights4S1_dog' ; weights4S2_dog' ; weights4S3_dog' ; weights4S4_dog'; weights4S5_dog'];
mixmat_tree = [weights4S1_tree'; weights4S2_tree'; weights4S3_tree'; weights4S4_tree'; weights4S5_tree'];
mixmat_three = [weights4S1_three'; weights4S2_three'; weights4S3_three'; weights4S4_three'; weights4S5_three'];
numOfMaxIteration = 100;
%cat
%[LL_cat, prior_cat, transmat_cat, mu_cat, Sigma_cat, mixmat_cat] = mhmm_em(train_cat, prior, transitMatrix, mu4AllStates_cat, Sigma4AllStates_cat, ones(numOfStates,numOfMixtures));
[LL_cat, trained_prior_cat, trained_transmat_cat, trained_mu_cat, trained_Sigma_cat, trained_mixmat_cat] = mhmm_em(train_cat, prior, transitMatrix, mu4AllStates_cat, Sigma4AllStates_cat, mixmat_cat,'max_iter', numOfMaxIteration,'cov_type', 'diag');

%dog
[LL_dog, trained_prior_dog, trained_transmat_dog, trained_mu_dog, trained_Sigma_dog, trained_mixmat_dog] = mhmm_em(train_dog, prior, transitMatrix, mu4AllStates_dog, Sigma4AllStates_dog, mixmat_dog,'max_iter', numOfMaxIteration,'cov_type', 'diag');

%tree
[LL_tree, trained_prior_tree, trained_transmat_tree, trained_mu_tree, trained_Sigma_tree, trained_mixmat_tree] = mhmm_em(train_tree, prior, transitMatrix, mu4AllStates_tree, Sigma4AllStates_tree, mixmat_tree,'max_iter', numOfMaxIteration,'cov_type', 'diag');

%three
[LL_three, trained_prior_three, trained_transmat_three, trained_mu_three, trained_Sigma_three, trained_mixmat_three] = mhmm_em(train_three, prior, transitMatrix, mu4AllStates_three, Sigma4AllStates_three, mixmat_three,'max_iter', numOfMaxIteration,'cov_type', 'diag');

iterationArr = [1:numOfMaxIteration];

%make same length LL_cat, LL_tree, LL_tree
convergedVal_cat = LL_cat(1,11);
convergedVal_dog = LL_dog(1,34);
convergedVal_tree = LL_tree(1,28);
convergedVal_three = LL_three(1,9);

sameLengLL_cat = ones(1,numOfMaxIteration)*convergedVal_cat;
sameLengLL_dog = ones(1,numOfMaxIteration)*convergedVal_dog;
sameLengLL_tree = ones(1,numOfMaxIteration)*convergedVal_tree;
sameLengLL_three = ones(1,numOfMaxIteration)*convergedVal_three;

sameLengLL_cat(1,1:11) = LL_cat;
sameLengLL_dog(1,1:34) = LL_dog;
sameLengLL_tree(1,1:28) = LL_tree;
sameLengLL_three(1,1:9) = LL_three;



%plot
figure(1)
plot(iterationArr,sameLengLL_cat)
title('Log likelihood w.r.t number of iteration')

hold on
plot(iterationArr,sameLengLL_dog)

plot(iterationArr,sameLengLL_tree)

plot(iterationArr,sameLengLL_three)

legend('Likelihodd-Cat','Likelihodd-Dog','Likelihodd-Tree','Likelihodd-Three')
xlabel('iteration')
ylabel('likelihood')

hold off


%(b)
%find best path using viterbi algorithm
% [obslik_cat_r1,~] = mixgauss_prob(train_cat(:,:,1),trained_mu_cat,trained_Sigma_cat,trained_mixmat_cat);
% path_cat_r1 = viterbi_path(trained_prior_cat,trained_transmat_cat,obslik_cat_r1);

feature1ForS2NWholeTrainData = feature1ForS2Extractor(train_cat,trained_mu_cat,trained_Sigma_cat,trained_mixmat_cat,trained_prior_cat,trained_transmat_cat); 

%Plot Histogram. 
figure(2)
h = histogram(feature1ForS2NWholeTrainData);
title('histogram Of appearance of c[0] values')
xlabel('c[0] values')
ylabel('frequency')
%plot 1D GMM for state 2, for cat
trained_mu_cat_S2 = trained_mu_cat(1,2,:);
trained_Sigma_cat_S2 = trained_Sigma_cat(1,1,2,:);
figure(3)
Plot_GM(weights4S2_cat',trained_mu_cat_S2,trained_Sigma_cat_S2);

%% Part3: Evaluation
%Construct total test set label
%0:cat, 1:dog, 2:tree, 3:three
y_test = zeros(1,455+464+643+456);
y_test(1,456:919) = ones(1,464); 
y_test(1,920:1375) = 2*ones(1,456);
y_test(1,1376:2018) = 3*ones(1,643);

y_predicted = HMM4Predictor(test_cat,test_dog,test_tree,test_three,trained_prior_cat,trained_transmat_cat,trained_mu_cat,trained_Sigma_cat,trained_mixmat_cat,   trained_prior_dog,trained_transmat_dog,trained_mu_dog,trained_Sigma_dog,trained_mixmat_dog , trained_prior_tree,trained_transmat_tree,trained_mu_tree,trained_Sigma_tree,trained_mixmat_tree , trained_prior_three,trained_transmat_three,trained_mu_three,trained_Sigma_three,trained_mixmat_three );
accuracy_HMM4 = accuracyCalculator(y_predicted,y_test);

figure(4)
cm = confusionchart(y_test,y_predicted);

confusionMatrix = cm.NormalizedValues;

recall = zeros(1,4);
precision = zeros(1,4);
F1Score = zeros(1,4);


for orderOfClass = 1:4
    recall(1,orderOfClass) = confusionMatrix(orderOfClass,orderOfClass)/sum(confusionMatrix(orderOfClass,:));
    precision(1,orderOfClass) = confusionMatrix(orderOfClass,orderOfClass)/sum(confusionMatrix(:,orderOfClass));
    F1Score(1,orderOfClass) = 2*(recall(1,orderOfClass)*precision(1,orderOfClass))/(recall(1,orderOfClass)+precision(1,orderOfClass));
end
