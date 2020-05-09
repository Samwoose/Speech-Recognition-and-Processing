function w_n = lifterGenerator(w_n_length)
%LIFTERGENERATOR Summary of this function goes here
%   Detailed explanation goes here

w_n = zeros(1,w_n_length);

for index = 1:w_n_length
    current_n = index -1 ; %0~12
    if(current_n == 0)
        w_n(1,index) = 1;
    else
        w_n(1,index) = current_n^0.6 ;
    end
end


end

