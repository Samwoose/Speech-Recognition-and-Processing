function h_ith = h_ith_Generator(formantFrequency,lengthOfImpulseResponse,Fs)
%H_ITH_GENERATOR Summary of this function goes here
%Generate an impulse response with given length and formant frequency
%   Detailed explanation goes here
%formantFrequency : formant frequency
%lenghtOfImpulseResponse: Length of impulse response to be created
%Fs: Sampling frequency

h_ith = zeros(1, lengthOfImpulseResponse);%initialize h_ith sequence
Ts = 1/Fs;
a_ith = 0.005*pi - 0.01*formantFrequency*Ts;
w_ith = 2*pi*formantFrequency/Fs;

for index = 1:lengthOfImpulseResponse
    %Refer to formula for h_ith in HW2 description
    h_ith(index) = exp(-a_ith*index)*cos(w_ith*index)*1;
end




end

