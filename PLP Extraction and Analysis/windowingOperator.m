function windowedFramedSn_std = windowingOperator(framedZeroPaddedSn_std,hammingWindow25)
%WINDOWINGOPERATOR Summary of this function goes here
%window a given framedZeroPadded sn_std signal
%framedZeroPaddedSn_std: it has (length of window) x (number of frames) size 
%   Detailed explanation goes here

numOfFrames = size(framedZeroPaddedSn_std,2); %e.g. 99
windowedFramedSn_std = framedZeroPaddedSn_std;

for frameOrder = 1:numOfFrames
    windowedFramedSn_std(:,frameOrder) = framedZeroPaddedSn_std(:,frameOrder).*hammingWindow25;
end


end

