function DecodedNumbers = my_decode(RepresentationSequenceforLdigits)
%MY_DECODE Summary of this function goes here
%Take 1100*L length sequence that represents L digits and decode it to
%original l digits
%   Detailed explanation goes here
%DecodedNumbers : it will store L decoded numbers
%RepresentationSequenceforLdigits : it is a sequence created by
%dual-tone-multi frequency technique
lengthOfSequence = size(RepresentationSequenceforLdigits,2);
lengthOfOneTone = 1100; %it accounts for 100 samples of silence as well
NumberOfShift = lengthOfSequence/lengthOfOneTone; 
L = NumberOfShift;
DecodedNumbers = zeros(1,L);
windowSize = 1000;
N1 = 2^10; %Length of DFT
fs = 8000; %sampling frequency is 8000 hz
for index = 1:L
    temp = RepresentationSequenceforLdigits(1+(index-1)*lengthOfOneTone: index*lengthOfOneTone);
    
    %apply window
    temp2 = temp(1:windowSize);
    
    %DFT 
    DFT_temp = fft(temp2,N1);
    
    %find first max and location and second max and location
    abs_DFT_temp = abs(DFT_temp);
    [firstMax, firstIndex] = max(abs_DFT_temp);
    [secondMax, secondIndex] = max(abs_DFT_temp(abs_DFT_temp<max(abs_DFT_temp)));
    
   
    %convert index to analog frequency
    %used formula : 
    %index from DFT sequence*(2pi/length of DFT)*fs(sampling freq)*1/(2pi)
    secondFreq = firstIndex * (2*pi/N1)* fs * (1/(2*pi));
    firstFreq = secondIndex * (2*pi/N1)* fs * (1/(2*pi));
    
    %mapping frequency process
    frequencyPair = [mappingFunction1(firstFreq),mappingFunction1(secondFreq)];
    
    
    %Decode mapped frequencies
    decodedNumber = decodingFunction(frequencyPair);
    
    %Save
    DecodedNumbers(index) = decodedNumber;
    

end

