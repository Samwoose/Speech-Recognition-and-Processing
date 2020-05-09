function X_train = trainSetConstructor(fileNames,numOfNon16000LengthFiles)
%TRAINSETCONSTRUCTOR Summary of this function goes here
%   Detailed explanation goes here
%Add data set directories
addpath('C:\Users\tjdtk\Desktop1\EE519\Homeowrk4\cat')
addpath('C:\Users\tjdtk\Desktop1\EE519\Homeowrk4\dog')
addpath('C:\Users\tjdtk\Desktop1\EE519\Homeowrk4\three')
addpath('C:\Users\tjdtk\Desktop1\EE519\Homeowrk4\tree')

numOfFiles = size(fileNames,1);
numOfFeatureValues = 13 ; % assume it is known in this practice.

X_train = zeros(numOfFiles-numOfNon16000LengthFiles,numOfFeatureValues); % e.g. 1733x13 size
counter = 0;
X_train_index = 1;
for fileOrder = 1:numOfFiles
    currentFileName = fileNames{fileOrder};
    currentSignalLength = signalLengthCalculator(currentFileName);
    if(currentSignalLength == 16000)
        X_train(X_train_index,:) = PLPfeatureExtractor(currentFileName);
        X_train_index = X_train_index +1;
    else
        counter = counter +1 ;
        
    end
end

disp(counter)

end

