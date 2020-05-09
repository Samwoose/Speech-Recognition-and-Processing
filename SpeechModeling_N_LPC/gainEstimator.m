function gain = gainEstimator(error)
%GAINESTIMATOR Summary of this function goes here
%Estimate gain of LPC based on the given error
%   Detailed explanation goes here

lengthOfError = size(error,2);

temp = 0;
for col = 1:lengthOfError
    temp = temp + error(1,col);
end
%Estimation Formula is in HW2 description
gain = sqrt(temp);


end

