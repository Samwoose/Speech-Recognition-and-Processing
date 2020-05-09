function energyCoefficient = energyCoefficientCalculator(bandFilterBank,S_k)
%ENERGYCOEFFICIENTCALCULATOR Summary of this function goes here
%Calculate E_i(j) based on S[k] and band filter bank
%Formula is on HW4 description
%   Detailed explanation goes here

numOfFilter = size(bandFilterBank,1); % e.g. Q = 20

energyCoefficient = zeros(1,numOfFilter); %
halfN_DFT = 512;
portionOfS_k = S_k(1:halfN_DFT);

for orderOfCoefficient = 2:(numOfFilter-1)
    absSquarePortionS_k = abs(portionOfS_k).^2; %|S_i[k]|^2
    absCurrentFilter = abs(bandFilterBank(orderOfCoefficient,:)) ; %|H_j[k]|
    energyCoefficient(1,orderOfCoefficient) = sum(absSquarePortionS_k.*absCurrentFilter) ;
end

%for the first coefficient
energyCoefficient(1,1) = energyCoefficient(1,2);
%for the last coefficient
energyCoefficient(1,numOfFilter) = energyCoefficient(1,numOfFilter-1);




end

