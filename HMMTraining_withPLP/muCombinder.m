function mu4AllStates = muCombinder(mu4S1, mu4S2, mu4S3, mu4S4, mu4S5, numOfFeatures, numOfStates, numOfMixtures)
%MUCOMBINDER Summary of this function goes here
%combine mu 1, 2, 3, 4, 5
%   Detailed explanation goes here

mu4AllStates = zeros(numOfFeatures,numOfStates,numOfMixtures);


mu4AllStates(:,1,:) = mu4S1(:,:);
mu4AllStates(:,2,:) = mu4S2(:,:);
mu4AllStates(:,3,:) = mu4S3(:,:);
mu4AllStates(:,4,:) = mu4S4(:,:);
mu4AllStates(:,5,:) = mu4S5(:,:);

end

