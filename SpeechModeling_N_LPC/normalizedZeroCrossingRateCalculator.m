function normalized_ZeroCrossingRate_storage25 = normalizedZeroCrossingRateCalculator(x,w)
%NORMALIZEDZEROCROSSINGRATECALCULATOR Summary of this function goes here
%Calculater normalized zero crossing rates, save them into storage, and
%return the storage
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
Z_n_storage_25 = zeros(size(framedAudioSignal_25,1),1); %initialize storage

for index = 1:size(Z_n_storage_25,1)
    temp = 0;
    for col = 1:size(framedAudioSignal_25,2)
        %See the formula in HW2 pr1 (c)
        if (col-1) ~= 0
            temp = temp+abs(sign(framedAudioSignal_25(index,col)) - sign(framedAudioSignal_25(index,col-1)) )*w(col);
        elseif (col-1) ==0 %handle the case index is out of boundary
            temp = temp + abs( sign(framedAudioSignal_25(index,col) ) - 0) *w(col);
        end
    end
    Z_n_storage_25(index) = temp;
end

%Transpose Z_n_storage to plot propery ( time VS Z_n )
Z_n_storage_25 = Z_n_storage_25';

%normalize with max
maxIn_Z_n_storage = max(Z_n_storage_25);

normalized_Z_n_storage_25 = Z_n_storage_25 ./ maxIn_Z_n_storage ;

normalized_ZeroCrossingRate_storage25 = normalized_Z_n_storage_25;

end

