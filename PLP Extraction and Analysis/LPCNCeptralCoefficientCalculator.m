function [LPC_Coefficients, cepstralCoefficientsBeforeLifting,cepstralCoefficientsAfterLifting] = LPCNCeptralCoefficientCalculator(cubic_rootCoefficient)
%LPCNCEPTRALCOEFFICIENTCALCULATOR Summary of this function goes here
%Calculate LPC coefficients, cepstrall coefficients before lifting,
%cepstral coefficients after lifting
%   Detailed explanation goes here

%Expand G_i 
lengthOfG_i = size(cubic_rootCoefficient,2) ; % e.g. Q = 20 = length
lengthOfExpanded_G_i = lengthOfG_i + (lengthOfG_i-2) ; % exclude G_i(Q) and G_i(1) when we expand G_i
expanded_G_i = zeros(1,lengthOfExpanded_G_i);

expanded_G_i(1,1:lengthOfG_i) = cubic_rootCoefficient;

reverseQIndex = lengthOfG_i - 1;
for orderOfRestIndex = (lengthOfG_i+1):lengthOfExpanded_G_i
    expanded_G_i(1,orderOfRestIndex) = cubic_rootCoefficient(reverseQIndex);
    reverseQIndex = reverseQIndex - 1;
end

%Calculate inverse of expanded G_i
inverseExpG_i = ifft(expanded_G_i,lengthOfExpanded_G_i);
portionOfInverseExpG_i = inverseExpG_i(1:lengthOfG_i);%Kep only the first half

%Find LPC coefficients with order of p = 12
p = 12;
[LPC_Coefficients,predictionErr] = levinson(portionOfInverseExpG_i,p);
gain = predictionErr^0.5;

%1x13 size
cepstralCoefficientsBeforeLifting = cepstralCoefficientCalculator(LPC_Coefficients,gain);

%Generate a given lifter in HW4
w_n_length = size(cepstralCoefficientsBeforeLifting,2); % e.g. 13
w_n = lifterGenerator(w_n_length);
cepstralCoefficientsAfterLifting = cepstralCoefficientsBeforeLifting.*w_n;



end

