function currentSignalLength = signalLengthCalculator(currentFileName)
%SIGNALLENGTHCALCULATOR Summary of this function goes here
%   Detailed explanation goes here

currentSn = audioread(currentFileName);
currentSignalLength = size(currentSn,1); 

end

