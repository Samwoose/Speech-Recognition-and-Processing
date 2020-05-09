function decodedNumber = decodingFunction(frequencyPair)
%DECODINGFUNCTION Summary of this function goes here
%   Detailed explanation goes here
%Find decoded number baded on first and second frequency

if (frequencyPair(1)==697 && frequencyPair(2)== 1209) || (frequencyPair(1)==1209 && frequencyPair(2)==697)
   decodedNumber = 1; 
elseif (frequencyPair(1)==1336 && frequencyPair(2)==697 ) || (frequencyPair(1)==697 && frequencyPair(2)==1336)
   decodedNumber = 2; 
elseif (frequencyPair(1)==1477 && frequencyPair(2)==697 ) || (frequencyPair(1)==697 && frequencyPair(2)==1477)
   decodedNumber = 3; 
elseif (frequencyPair(1)==1209 && frequencyPair(2)==770 ) || (frequencyPair(1)==770 && frequencyPair(2)==1209)
   decodedNumber = 4; 
elseif (frequencyPair(1)==1336 && frequencyPair(2)==770 ) || (frequencyPair(1)==770 && frequencyPair(2)==1336)
   decodedNumber = 5; 
elseif (frequencyPair(1)==1477 && frequencyPair(2)==770 ) || (frequencyPair(1)==770 && frequencyPair(2)==1477)
   decodedNumber = 6; 
elseif (frequencyPair(1)==1209 && frequencyPair(2)==852 ) || (frequencyPair(1)==852 && frequencyPair(2)==1209)
   decodedNumber = 7; 
elseif (frequencyPair(1)==1336 && frequencyPair(2)==852 ) || (frequencyPair(1)==852 && frequencyPair(2)==1336)
   decodedNumber = 8; 
elseif (frequencyPair(1)==1477 && frequencyPair(2)==852 ) || (frequencyPair(1)==852 && frequencyPair(2)==1477)
   decodedNumber = 9; 
elseif (frequencyPair(1)==1336 && frequencyPair(2)==941 ) || (frequencyPair(1)==941 && frequencyPair(2)==1336)
   decodedNumber = 0; 
end

end

