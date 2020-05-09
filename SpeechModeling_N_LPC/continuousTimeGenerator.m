function continuousTimeArray = continuousTimeGenerator(lengthInTimeUnit,OverlapPercent,numOfFrame)
%CONTINUOUSTIMEGENERATOR Summary of this function goes here
%Generate time array that corresponds to short time analysis result
%   Detailed explanation goes here
%lengthInTimeUnit : length in time unit e.g. 10msec => 0.01 sec
%OverlapPercent : how much percent each frame is overlapped e.g., 50 => 50%
%numOfFrame: number of frame. 

percentScaler = 0.01; %Change percentage scale e.g. 50% => 0.5
initialTime = lengthInTimeUnit * percentScaler* OverlapPercent;

continuousTimeArray = zeros(1,numOfFrame);

for col = 1 : numOfFrame
    continuousTimeArray(1,col) = initialTime*col; 
end

