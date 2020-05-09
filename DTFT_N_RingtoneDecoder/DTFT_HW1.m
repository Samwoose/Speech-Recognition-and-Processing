function [H,W] = DTFT_HW1(h,N)
%DTFT_HW1 Summary of this function goes here
%%%
%DTFT calculate DTFT at N equally spaced frequencies
% usage : H = dtft( h , N )
% h : finite - length input vector
% N: number of frequencies for evaluation over [-pi , pi )
% H: DTFT values (complex)
% W: vector of freqs over [-pi , pi ) where DTFT is computed
%
 %%%
%   Detailed explanation goes here
L = length(h); h=h(:);
if(N<L)
    error('Please put larger N than length of the sequence h')
end

W = (2*pi/N)*[0:(N-1)]'; %values from 0 to 2*pi 

H_temp = fft(h,N);

H = fftshift(H_temp);

end

