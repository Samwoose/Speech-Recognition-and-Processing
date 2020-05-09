function dummy = allFiguresChecker(X_train_allWords,Y_labels_allWords)
%ALLFIGURESCHECKER Summary of this function goes here
%   Detailed explanation goes here


numOfFeatures = size(X_train_allWords,2);%e.g. 13
dummy = 1
for orderOfFeature = 1:numOfFeatures
    for orderOfFeature1 = 1:numOfFeatures
        figure(20)
        currentC1 = X_train_allWords(:,orderOfFeature);
        currentC2 = X_train_allWords(:,orderOfFeature1);
        gscatter(currentC1,currentC2,Y_labels_allWords);
        X = ['current pair (',num2str(orderOfFeature),',',num2str(orderOfFeature1),')' ];
        disp(X)
    end
end


end

