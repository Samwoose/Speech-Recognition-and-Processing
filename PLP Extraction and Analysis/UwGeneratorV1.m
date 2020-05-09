function Uw = UwGeneratorV1(freqValArray,Fs)
%UWGENERATORV1 Summary of this function goes here
%   Detailed explanation goes here
%Mapping formular from Bcj to wcj
wcjArray = (2*pi).*freqValArray;

%Fs=16000>10000hz in this practice
if(Fs<=16000)
    Uw = ( wcjArray.^4.*(wcjArray.^2+56.8*(10^6)) )./((wcjArray.^2+6.3*(10^6)).*(wcjArray.^2+0.38*(10^9)));
elseif(Fs>16000)
    Uw = ( wcjArray.^4.*(wcjArray.^2+56.8*(10^6)) )./((wcjArray.^2+6.3*(10^6)).*(wcjArray.^2+0.38*(10^9)).*(wcjArray.^6+9.58*(10^26)));
end
end

