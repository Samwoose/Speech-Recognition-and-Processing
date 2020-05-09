function normalizedMnStorage = normalizedMnCalculator(x,w)
%NORMALIZEDMNCALCULATOR Summary of this function goes here
%Calculate normalized average magnitude(M_n) and save them to storage
%x: original signal. 1 x length form
%w: window. 1 x window length form 
%   Detailed explanation goes here

lengthOfWindow = size(w,1);%In this homework, it is 25

%Frame signal with 60% overlap
%Length of 400 => 60% overlap is 240 samples
lengthOfOverLap_25 = 240;
framedAudioSignal_25 = buffer(x, lengthOfWindow,lengthOfOverLap_25);
%transpose the framed signal
framedAudioSignal_25 = framedAudioSignal_25' ;

%Calculate Mn with framed signal x and window
M_n_storage_25 = zeros(size(framedAudioSignal_25,1),1); %initialize storage
for index = 1:size(M_n_storage_25,1)
    temp = 0;
    for col = 1:size(framedAudioSignal_25,2)
        %See the formula in HW2 pr1 (c)
        temp = temp+abs(framedAudioSignal_25(index,col))*w(col);
    end
    M_n_storage_25(index) = temp;
end

%Transpose E_m_storage to plot propery ( time VS M_n )
M_n_storage_25 = M_n_storage_25';

%normalize with max
maxIn_M_n_storage = max(M_n_storage_25);

normalized_M_n_storage_25 = M_n_storage_25 ./ maxIn_M_n_storage ;

normalizedMnStorage = normalized_M_n_storage_25;

end

