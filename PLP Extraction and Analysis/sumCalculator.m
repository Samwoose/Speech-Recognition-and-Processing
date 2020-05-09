function sumVal = sumCalculator(LPC_Coefficients,cepstralCoefficientsBeforeLifting,orderOfCoefficients)
%SUMCALCULATOR Summary of this function goes here
%Calculate summation term in recursive relationship
%   Detailed explanation goes here

n = orderOfCoefficients;

%partioning h[n] for summation
startingIndex = 2;
portion_hn = cepstralCoefficientsBeforeLifting(1,startingIndex:n);
portion_ak = LPC_Coefficients(1,startingIndex:n);

ak_index = n-1 ; 
sumVal = 0;
for hn_Index = 1:n-1
    sumVal = sumVal + (hn_Index/n)*portion_hn(1,hn_Index)*portion_ak(1,ak_index);
    ak_index = ak_index -1 ;
end




end

