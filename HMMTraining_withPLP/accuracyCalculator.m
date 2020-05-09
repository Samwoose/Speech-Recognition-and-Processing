function accuracy_HMM4 = accuracyCalculator(y_predicted,y_test)
%ACCURACYCALCULATOR Summary of this function goes here
%   Detailed explanation goes here


lengthOfLabels = size(y_predicted,2);

numOfCorrectlyClassified = 0;

for index = 1:lengthOfLabels
    if(y_predicted(1,index) == y_test(1,index))
        numOfCorrectlyClassified = numOfCorrectlyClassified + 1;
    end
end

accuracy_HMM4 = numOfCorrectlyClassified/lengthOfLabels;


end

