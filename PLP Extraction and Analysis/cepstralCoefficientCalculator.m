function cepstralCoefficientsBeforeLifting = cepstralCoefficientCalculator(LPC_Coefficients,gain)
%CEPSTRALCOEFFICIENTCALCULATOR Summary of this function goes here
%Calculate cepstral coefficient using reculsive relationship with given LPC
%coefficients and gain
%   Detailed explanation goes here

numOfCoefficients = size(LPC_Coefficients,2); %e.g. 13 including h[0]

cepstralCoefficientsBeforeLifting = zeros(1,numOfCoefficients);

for orderOfCoefficients = 0: numOfCoefficients-1
    currentIndex = orderOfCoefficients +1;
    if(orderOfCoefficients == 0)
        cepstralCoefficientsBeforeLifting(1,currentIndex) = log(gain);
    elseif(orderOfCoefficients == 1)
        cepstralCoefficientsBeforeLifting(1,currentIndex) = LPC_Coefficients(1,currentIndex);
    elseif(orderOfCoefficients > 0)
        sumVal = sumCalculator(LPC_Coefficients,cepstralCoefficientsBeforeLifting,orderOfCoefficients);
        cepstralCoefficientsBeforeLifting(1,currentIndex) = LPC_Coefficients(1,currentIndex) + sumVal ;
    end
end


end

