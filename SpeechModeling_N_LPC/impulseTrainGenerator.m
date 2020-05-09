function impulseTrainSequence = impulseTrainGenerator(f0,Fs)
%IMPULSETRAINGENERATOR Summary of this function goes here
%Generate impulse train sequence based on the given fundamental frequency
%f0: Fundamental frequency
%Fs: Sampling Rate

%   Detailed explanation goes here

impulseTrainSequence = zeros(1,Fs); %1sec long sequence
initialNonZeroLocation = Fs/f0;

for col= 1:Fs
    if(mod(col,initialNonZeroLocation)==0)
        impulseTrainSequence(1,col) = 1;
    else
        impulseTrainSequence(1,col) = 0;
    end
end

end

