function Uw = UwGenerator(currentBcj,Fs)
%UWGENERATOR Summary of this function goes here
%Generate U(w) based on the currentB
%   Detailed explanation goes here

%Mapping formular from Bcj to wcj
wcj = 1200*pi*sinh(currentBcj/6);

%Fs=16000>10000hz in this practice
if(Fs<=10000)
    Uw = ( wcj^4*(wcj^2+56.8*(10^6)) )/((wcj^2+6.3*(10^6))*(wcj^2+0.38*(10^9)));
elseif(Fs>10000)
    Uw = ( wcj^4*(wcj^2+56.8*(10^6)) )/(((wcj^2+6.3*(10^6))^2)*(wcj^2+0.38*(10^9))*(wcj^6+9.58*(10^26)));
end


end

