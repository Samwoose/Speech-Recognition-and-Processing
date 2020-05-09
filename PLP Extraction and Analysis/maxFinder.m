function maxInFilterBank = maxFinder(transformedBandFilterBank,numOfFilters)
%MAXIMUMFINDER Summary of this function goes here
%   Detailed explanation goes here

maxInFilterBank = -100000000000000;

for filterOrder = 1:numOfFilters
    currentMax = max(transformedBandFilterBank(filterOrder,:));
    if(currentMax >=maxInFilterBank)
        maxInFilterBank = currentMax;
    end
end


end

