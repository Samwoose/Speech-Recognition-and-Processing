function FirstMappedFrequency = mappingFunction1(FirstFrequency)
%MAPPINGFUNCTION1 Summary of this function goes here
%   Detailed explanation goes here
%1stFrequency: it will be mapped to one of frequecies in row on the table
%in HW1
%1stMappedFrequency: Mapped frequency

frequencyStorage = [697, 770, 852, 941, 1209, 1336, 1477];%frequencies from the table on HW1
differenceOfFrequency = zeros(1,size(frequencyStorage,2));

for index = 1:size(frequencyStorage,2)
    differenceOfFrequency(index) = abs(frequencyStorage(index)-FirstFrequency);
end

[minVal, indexOfMin]  = min(differenceOfFrequency);
FirstMappedFrequency = frequencyStorage(indexOfMin);

end

