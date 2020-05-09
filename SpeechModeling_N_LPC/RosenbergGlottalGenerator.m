function glottalSequence = RosenbergGlottalGenerator(T1,T2)
%ROSENBERGGLOTTALGENERATOR Summary of this function goes here
%Generate a Rosenberg's glottal response using equation from HW2
%description
%   Detailed explanation goes here
lengthOfTimeSequence = T1+T2+1;

timeSequence = [0:1:lengthOfTimeSequence];

glottalSequence = zeros(1,lengthOfTimeSequence);

for index = 1:lengthOfTimeSequence
    if(timeSequence(1,index)>=0 && timeSequence(1,index)<=T1)
        glottalSequence(1,index) = 0.5*(1-(cos(2*pi*timeSequence(1,index)/(2*T1))));
    elseif(timeSequence(1,index)>T1 && timeSequence(1,index)<=T1+T2)
        glottalSequence(1,index) = cos((2*pi*(timeSequence(1,index)-T1))/(4*T2) );
    end
end

end

