%%HW1 Problem6
%(b)

length = 45;

r = r_sequence(length);
N = 7*length;

[R,W] = DTFT_HW1(r,N);

%Real part
figure(1)
plot(W,real(R))

%Imaginary part
figure(2)
plot(W,imag(R))

%Magnitude
figure(3)
plot(W, abs(R))

%Angle
figure(4)
plot(W, angle(R))

%(c)
length2 = 31;

r2 = r_sequence(length2);
N2 = 7*length2;

[R2,W2] = DTFT_HW1(r2,N2);

figure(5)
plot(W2,abs(R2))

figure(6)
plot(W2,angle(R2))
