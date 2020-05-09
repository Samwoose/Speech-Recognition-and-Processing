function Y_labels_allWords = YLabelGenerator(numOfDataPoints_cat,numOfDataPoints_dog,numOfDataPoints_three,numOfDataPoints_tree)
%YLABELGENERATOR Summary of this function goes here
%Generate label vector (numOfCat+numOfDog+numOfThree+numOfTree)x1 size
%   Detailed explanation goes here

%1:cat, 2:dog, 3:three, 4:tree
labels_cat = ones(numOfDataPoints_cat,1);
labels_dog = ones(numOfDataPoints_dog,1).*2;
labels_three = ones(numOfDataPoints_three,1).*3;
labels_tree = ones(numOfDataPoints_tree,1).*4;

Y_labels_allWords = [labels_cat;labels_dog;labels_three;labels_tree];


end

