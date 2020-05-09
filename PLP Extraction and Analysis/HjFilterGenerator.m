function HjFilterValArray = HjFilterGenerator(B_ValArray,Bcj)
%HJFILTERGENERATOR Summary of this function goes here
%Generate H_j filter based on B_cj(jth H_j filter)
%B_ValArray: B value array in Bark
%Bcj: Center frequency in Bark
%   Detailed explanation goes here


lengthOfB_ValArray = size(B_ValArray,2); %e.g. 512
HjFilterValArray = zeros(1,lengthOfB_ValArray);

%Formular is in HW4 description
for BValOrder = 1:lengthOfB_ValArray
    curretB = B_ValArray(1,BValOrder);
    if( curretB<(-2.5+Bcj) )
        HjFilterValArray(1,BValOrder) = 0;
    elseif( curretB >= (-2.5+Bcj) && curretB <= (-0.5+Bcj) )
        HjFilterValArray(1,BValOrder) = 10^(curretB-Bcj+0.5);
    elseif( curretB > (-0.5+Bcj) && curretB < (0.5+Bcj) )
        HjFilterValArray(1,BValOrder) = 1;
    elseif( curretB >= (0.5+Bcj) && curretB <= (1.3+Bcj) )
        HjFilterValArray(1,BValOrder) = 10^((-2.5)*(curretB-Bcj-0.5));
    elseif( curretB > (1.3+Bcj) )
        HjFilterValArray(1,BValOrder) = 0;
    end
end

end

