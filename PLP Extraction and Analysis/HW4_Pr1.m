%Add data set directories
addpath('C:\Users\tjdtk\Desktop1\EE519\Homeowrk4\cat')
addpath('C:\Users\tjdtk\Desktop1\EE519\Homeowrk4\dog')
addpath('C:\Users\tjdtk\Desktop1\EE519\Homeowrk4\three')
addpath('C:\Users\tjdtk\Desktop1\EE519\Homeowrk4\tree')


%% PART 1
%(a)Time-domain Standardization
%Load raw speech signal
%cat
fileName_cat1 = '00b01445_nohash_0.wav';%1st file
fileName_cat2 = '00f0204f_nohash_0.wav';%2nd file
fileName_cat3 = '00f0204f_nohash_1.wav';%3rd file
fileName_cat4 = '00f0204f_nohash_2.wav';%4th file
fileName_cat5 = '0ac15fe9_nohash_0.wav';%7th file

[sn_cat1,~] = audioread(fileName_cat1);
[sn_cat2,~] = audioread(fileName_cat2);
[sn_cat3,~] = audioread(fileName_cat3);
[sn_cat4,~] = audioread(fileName_cat4);
[sn_cat5,~] = audioread(fileName_cat5);

%dog
fileName_dog1 = '00f0204f_nohash_1.wav';%1st
fileName_dog2 = '00f0204f_nohash_0.wav';%2nd
fileName_dog3 = '00f0204f_nohash_1.wav';%3rd
fileName_dog4 = '00f0204f_nohash_2.wav';%4th
fileName_dog5 = '0a7c2a8d_nohash_0.wav';%5th

[sn_dog1,~] = audioread(fileName_dog1);
[sn_dog2,~] = audioread(fileName_dog2);
[sn_dog3,~] = audioread(fileName_dog3);
[sn_dog4,~] = audioread(fileName_dog4);
[sn_dog5,~] = audioread(fileName_dog5);

%tree
fileName_tree1 = '0d393936_nohash_0.wav';%1st
fileName_tree2 = '0a7c2a8d_nohash_0.wav';%2nd
fileName_tree3 = '0ac15fe9_nohash_0.wav';%3rd
fileName_tree4 = '0b40aa8e_nohash_1.wav';%6th file
fileName_tree5 = '0b40aa8e_nohash_0.wav';%5th

[sn_tree1,~] = audioread(fileName_tree1);
[sn_tree2,~] = audioread(fileName_tree2);
[sn_tree3,~] = audioread(fileName_tree3);
[sn_tree4,~] = audioread(fileName_tree4);
[sn_tree5,~] = audioread(fileName_tree5);

%three
fileName_three1 = '0d53e045_nohash_0.wav';%1st
fileName_three2 = '00b01445_nohash_1.wav';%2nd
fileName_three3 = '00b01445_nohash_2.wav';%3rd
fileName_three4 = '0a9f9af7_nohash_0.wav';%4th
fileName_three5 = '0b40aa8e_nohash_0.wav';%5th

[sn_three1,~] = audioread(fileName_three1);
[sn_three2,~] = audioread(fileName_three2);
[sn_three3,~] = audioread(fileName_three3);
[sn_three4,~] = audioread(fileName_three4);
[sn_three5,~] = audioread(fileName_three5);

%Standardization
%cat
sn_std_cat1 = zscore(sn_cat1);
sn_std_cat2 = zscore(sn_cat2);
sn_std_cat3 = zscore(sn_cat3);
sn_std_cat4 = zscore(sn_cat4);
sn_std_cat5 = zscore(sn_cat5);

%dog
sn_std_dog1 = zscore(sn_dog1);
sn_std_dog2 = zscore(sn_dog2);
sn_std_dog3 = zscore(sn_dog3);
sn_std_dog4 = zscore(sn_dog4);
sn_std_dog5 = zscore(sn_dog5);

%tree
sn_std_tree1 = zscore(sn_tree1);
sn_std_tree2 = zscore(sn_tree2);
sn_std_tree3 = zscore(sn_tree3);
sn_std_tree4 = zscore(sn_tree4);
sn_std_tree5 = zscore(sn_tree5);

%three
sn_std_three1 = zscore(sn_three1);
sn_std_three2 = zscore(sn_three2);
sn_std_three3 = zscore(sn_three3);
sn_std_three4 = zscore(sn_three4);
sn_std_three5 = zscore(sn_three5);

%(b) Framing and Windowing
Fs=16000; %Sampling frequency 16000Hz
durationOfWindow = 0.025; %25 msec
lengthOfWindow25 = durationOfWindow * Fs ;

%generate Hamming window
hammingWindow25 = hamming(lengthOfWindow25);
%zero pad audio signal to avoid a case that the last window overshoots the
%length of signal(original length = 16000 -> padded length = 16080
paddedLength = 16080;
originalLength = 16000;

zeroPaddedSn_std_cat1 = zeros(1,paddedLength);
zeroPaddedSn_std_cat1(1:originalLength) = sn_std_cat1;

zeroPaddedSn_std_dog1 = zeros(1,paddedLength);
zeroPaddedSn_std_dog1(1:originalLength) = sn_std_dog1;

zeroPaddedSn_std_tree1 = zeros(1,paddedLength);
zeroPaddedSn_std_tree1(1:originalLength) = sn_std_tree1;

zeroPaddedSn_std_three1 = zeros(1,paddedLength);
zeroPaddedSn_std_three1(1:originalLength) = sn_std_three1;

%Framming
lengthOfOverlap10 = 240; %400-0.01*16000=240 i.e. shift window by 10 msec
opt = 'nodelay';
framedZeroPaddedSn_std_cat1 = buffer(zeroPaddedSn_std_cat1,lengthOfWindow25,lengthOfOverlap10,opt);

framedZeroPaddedSn_std_dog1 = buffer(zeroPaddedSn_std_dog1,lengthOfWindow25,lengthOfOverlap10,opt);

framedZeroPaddedSn_std_tree1 = buffer(zeroPaddedSn_std_tree1,lengthOfWindow25,lengthOfOverlap10,opt);

framedZeroPaddedSn_std_three1 = buffer(zeroPaddedSn_std_three1,lengthOfWindow25,lengthOfOverlap10,opt);

%windowing
windowedFramedSn_std_cat1 = windowingOperator(framedZeroPaddedSn_std_cat1,hammingWindow25);

windowedFramedSn_std_dog1 = windowingOperator(framedZeroPaddedSn_std_dog1,hammingWindow25);

windowedFramedSn_std_tree1 = windowingOperator(framedZeroPaddedSn_std_tree1,hammingWindow25);

windowedFramedSn_std_three1 = windowingOperator(framedZeroPaddedSn_std_three1,hammingWindow25);

%(c)Critical Bands and Equal-Loudness Filter
%Critical Bands Filter Bank and plot them
[criticalBandFilterBank,centralBarkArray] = criticalBankFilterGenerator();

%Transform filters with U(w)
transformedBandFilterBank = bankTransformer(criticalBandFilterBank);


%(d)Energy Calculation and Cubit-Root Compression
fileName_three_target = 'C:\Users\tjdtk\Desktop1\EE519\Homeowrk4\three\f9273a21_nohash_1.wav';
sn_three_target = audioread(fileName_three_target);

%Standardization
sn_std_three_target = zscore(sn_three_target);

zeroPaddedSn_std_three_target = zeros(1,paddedLength);
zeroPaddedSn_std_three_target(1:originalLength) = sn_std_three_target;

%Framming
lengthOfOverlap10 = 240; %400-0.01*16000=240 i.e. shift window by 10 msec
opt = 'nodelay';
framedZeroPaddedSn_std_three_target = buffer(zeroPaddedSn_std_three_target,lengthOfWindow25,lengthOfOverlap10,opt);

%windowing
windowedFramedSn_std_three_target = windowingOperator(framedZeroPaddedSn_std_three_target,hammingWindow25);

%Work with 70th frame of the signal sn_70
orderOfFrame_three = 70;
sn_70_three = windowedFramedSn_std_three_target(:,orderOfFrame_three);
sn_70_three_tr = sn_70_three'; %make it 1x400 size

%(d)-(i)
N_DFT = 1024;
S_k_70_three = fft(sn_70_three_tr,N_DFT);
%squared S[k]
squaredS_k_70_three = abs(S_k_70_three).^2;
%dB scale
logSquaredS_k_70_three = 10*log(squaredS_k_70_three);

%(d)-(ii)
energyWithOriFilterBank = energyCoefficientCalculator(criticalBandFilterBank,S_k_70_three);
logEnergyWithOriFilterBank = 10*log(energyWithOriFilterBank);
%(d)-(iii)
energyWithTransformedFilterBank = energyCoefficientCalculator(transformedBandFilterBank,S_k_70_three);
logEnergyWithTransformedFilterBank = 10*log(energyWithTransformedFilterBank);
%(d)-(iv)
cubic_rootCoefficient = energyWithTransformedFilterBank.^(0.33); %G_i(j). Formula is given on HW4 description
logCubic_rootCoefficient = 10*log(cubic_rootCoefficient);
%(d)-plotting
%Convert Central frequency in bark to in Hz
centralHzArray = 600.*sinh(centralBarkArray./6);
%Frequency Array for DFT
freqArrayForDFT = [1:N_DFT].*(Fs/N_DFT) ;

figure(5)
hold on
%plot values within index 1~512
plot(freqArrayForDFT(1:N_DFT/2),logSquaredS_k_70_three(1:N_DFT/2))
plot(centralHzArray,logEnergyWithOriFilterBank)
plot(centralHzArray,logEnergyWithTransformedFilterBank)
plot(centralHzArray,logCubic_rootCoefficient)
xlabel('Frequency(Hz)')
ylabel('Values')
legend('Power spectrum','energy before transform','energy after transform','coefficient G')
hold off

%(e)
%(i),(ii),(iii)
[LPC_Coefficients, cepstralCoefficientsBeforeLifting,cepstralCoefficientsAfterLifting] = LPCNCeptralCoefficientCalculator(cubic_rootCoefficient);


%% PART 2
%(a)
PLPbasedFeatures_cat1 = PLPfeatureExtractor(fileName_cat1);
PLPbasedFeatures_dog1 = PLPfeatureExtractor(fileName_dog1);
PLPbasedFeatures_three1 = PLPfeatureExtractor(fileName_three1);
PLPbasedFeatures_tree1 = PLPfeatureExtractor(fileName_tree1);

%Extract (cm[0],cm[1]) pair
cm_0Values = [PLPbasedFeatures_cat1(1,1);PLPbasedFeatures_dog1(1,1);PLPbasedFeatures_three1(1,1);PLPbasedFeatures_tree1(1,1)];
cm_1Values = [PLPbasedFeatures_cat1(1,2);PLPbasedFeatures_dog1(1,2);PLPbasedFeatures_three1(1,2);PLPbasedFeatures_tree1(1,2)];
labels = ["cat";"dog";"three";"tree"]; 

figure(6)
gscatter(cm_0Values,cm_1Values,labels)

%Extract other pairs
%(cm[2],cm[3])
cm_2Values = [PLPbasedFeatures_cat1(1,3);PLPbasedFeatures_dog1(1,3);PLPbasedFeatures_three1(1,3);PLPbasedFeatures_tree1(1,3)];
cm_3Values = [PLPbasedFeatures_cat1(1,4);PLPbasedFeatures_dog1(1,4);PLPbasedFeatures_three1(1,4);PLPbasedFeatures_tree1(1,4)];

figure(7)
gscatter(cm_2Values,cm_3Values,labels)

%(b)2-dimensional t-Distributed Stochastic Neighbor Embeddings
tsneFeature_cat1 = tsne(PLPbasedFeatures_cat1);
tsneFeature_dog1 = tsne(PLPbasedFeatures_dog1);
tsneFeature_three1 = tsne(PLPbasedFeatures_three1);
tsneFeature_tree1 = tsne(PLPbasedFeatures_tree1);
%Form a proper data size for plotting

firstValues = [tsneFeature_cat1(1,1);tsneFeature_dog1(1,1);tsneFeature_three1(1,1);tsneFeature_tree1(1,1)];
secondValues = [tsneFeature_cat1(1,2);tsneFeature_dog1(1,2);tsneFeature_three1(1,2);tsneFeature_tree1(1,2)];

figure(8)
gscatter(firstValues,secondValues,labels)

%(c)
%Construct data set for K means algorithm
X_train = [PLPbasedFeatures_cat1 ;PLPbasedFeatures_dog1 ;PLPbasedFeatures_three1 ;PLPbasedFeatures_tree1 ];
trueLabels = [1;2;3;4]; %1:cat, 2:dog, 3:three, 4:tree
numOfClusters = 4; %4 words
predictedLabels = kmeans(X_train,numOfClusters);

[y_pred_matched, acc] = optimalMatch(predictedLabels, trueLabels);



%Extract features from all files
%cat
numOfFileNames_cat = 1733;%211 non 16000 length files
fileNames_cat = nameExtractor('cat',numOfFileNames_cat); %1733x1 size
numOfNon16000LengthFiles_cat = 211;
X_train_cat = trainSetConstructor(fileNames_cat,numOfNon16000LengthFiles_cat);%1522x13 size
%dog
numOfFileNames_dog = 1746;
numOfNon16000LengthFiles_dog = 207;
fileNames_dog = nameExtractor('dog',numOfFileNames_dog); %1746x1 size
X_train_dog = trainSetConstructor(fileNames_dog,numOfNon16000LengthFiles_dog);%1539x13 size
%three
numOfFileNames_three = 2356;
numOfNon16000LengthFiles_three = 212;
fileNames_three = nameExtractor('three',numOfFileNames_three); %2356x1 size
X_train_three = trainSetConstructor(fileNames_three,numOfNon16000LengthFiles_three);%2144x13 size
%tree
numOfFileNames_tree = 1733;
numOfNon16000LengthFiles_tree = 212;
fileNames_tree = nameExtractor('tree',numOfFileNames_tree); %1733x1 size
X_train_tree = trainSetConstructor(fileNames_tree,numOfNon16000LengthFiles_tree);%1521x13 size


%Construct all train set and labels
X_train_allWords = [X_train_cat;X_train_dog;X_train_three;X_train_tree];
numOfDataPoints_cat = size(X_train_cat,1);
numOfDataPoints_dog = size(X_train_dog,1);
numOfDataPoints_three = size(X_train_three,1);
numOfDataPoints_tree = size(X_train_tree,1);

Y_labels_allWords = YLabelGenerator(numOfDataPoints_cat,numOfDataPoints_dog,numOfDataPoints_three,numOfDataPoints_tree); 

%(a) for all words
%Extract (cm[0],cm[1]) pair
cm0ValuesAllWords = X_train_allWords(:,1);
cm1ValuesAllWords = X_train_allWords(:,2);
%Extract other pair
cm2ValuesAllWords = X_train_allWords(:,2);
cm3ValuesAllWords = X_train_allWords(:,3);

cm4ValuesAllWords = X_train_allWords(:,4);
cm5ValuesAllWords = X_train_allWords(:,5);

cm6ValuesAllWords = X_train_allWords(:,6);
cm7ValuesAllWords = X_train_allWords(:,7);

cm8ValuesAllWords = X_train_allWords(:,8);
cm9ValuesAllWords = X_train_allWords(:,9);

cm10ValuesAllWords = X_train_allWords(:,10);
cm11ValuesAllWords = X_train_allWords(:,11);

cm12ValuesAllWords = X_train_allWords(:,12);
cm13ValuesAllWords = X_train_allWords(:,13);



figure(9)
gscatter(cm0ValuesAllWords,cm1ValuesAllWords,Y_labels_allWords);
figure(10)
gscatter(cm2ValuesAllWords,cm3ValuesAllWords,Y_labels_allWords);

%Check all figures of possible 156(=169-13) pairs
%dummy = allFiguresChecker(X_train_allWords,Y_labels_allWords);

%(b) for all words
tsneFeatureAllWords = tsne(X_train_allWords);
firstValuesAllWords = tsneFeatureAllWords(:,1);
secondValuesAllWords = tsneFeatureAllWords(:,2);

figure(11)
gscatter(firstValuesAllWords,secondValuesAllWords,Y_labels_allWords);

%(c) Kmeans for all words
numOfClustersAllWords = 4; %4 words
predictedLabelsAllWords = kmeans(X_train_allWords,numOfClustersAllWords);

[y_pred_matched_allwords, accAllWords] = optimalMatch(predictedLabelsAllWords, Y_labels_allWords);

%Calculate accuracy