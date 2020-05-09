function sampledRawWave = samplingOriginalSignal(rawWave,timeArray, Fs)
%SAMPLINGORIGINALSIGNAL Summary of this function goes here
%   Detailed explanation goes here

indexStorageForRawWave = floor(timeArray*Fs);
sampledRawWave = zeros(1,size(indexStorageForRawWave,2));

for col = 1:size(indexStorageForRawWave,2)
    current_index = indexStorageForRawWave(1,col);
    if(current_index <= size(rawWave,2))
        sampledRawWave(1,col) = rawWave(1,current_index);
    end
end

end

