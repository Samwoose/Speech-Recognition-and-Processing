%% (a)
%Generate impulse response for /aa/
%Notations are from HW2 problem2 description
F1_aa = 700; %Fi_aa : ith formant frequency for /aa/ vowel
F2_aa = 1100;
F3_aa = 2500;
lengthOfImpulseResponse = 200; % choose the length that is not too long
Fs = 16000; %Sampling frequency is 16000Hz


h1_aa = h_ith_Generator(F1_aa,lengthOfImpulseResponse,Fs);
h2_aa = h_ith_Generator(F2_aa,lengthOfImpulseResponse,Fs);
h3_aa = h_ith_Generator(F3_aa,lengthOfImpulseResponse,Fs);

%h_aa is a cascaded system of h1_aa, h2_aa, and h3_aa
%A cascaded system can be designed with a serial of convolutions.
h_aa = conv(conv(h1_aa,h2_aa), h3_aa);

dft_h_aa = fft(h_aa,lengthOfImpulseResponse);

figure(1)
plot(abs(dft_h_aa))

figure(2)
plot(h_aa);
%wvtool(h_aa)

%% (b)
Fs = 16000;%sampling frequency is 16000Hz
%(1)
f0_1 = 200;%fundamental frequency is 200Hz
impulseTrain_f0_1 = impulseTrainGenerator(f0_1,Fs);
%(2)
f0_2 = 125;%fundamental frequency is 125Hz
impulseTrain_f0_2 = impulseTrainGenerator(f0_2,Fs);

%% (c)
%Generate g[n]
T1 = 40;
T2 = 16; %T1 and T2 are given in HW2 description
Ts =1/Fs;
g_n = RosenbergGlottalGenerator(T1,T2);


%generate glottal pulse train by convolving impulse train from (b) and g[n]
%from (c)
glottalPulseTrain_f0_1 = conv(g_n,impulseTrain_f0_1);
glottalPulseTrain_f0_2 = conv(g_n,impulseTrain_f0_2);

lengthOfPartialPulseTrain = 500;
partOfGlottalPulseTrain_f0_1 = glottalPulseTrain_f0_1(1,1:lengthOfPartialPulseTrain);
partOfGlottalPulseTrain_f0_2 = glottalPulseTrain_f0_2(1,1:lengthOfPartialPulseTrain);

continuousTimeArray = [1:1:lengthOfPartialPulseTrain]*Ts;

%Plotting
figure(3)
plot(continuousTimeArray,partOfGlottalPulseTrain_f0_1)

figure(4)
plot(continuousTimeArray,partOfGlottalPulseTrain_f0_2)

%% (d)
%Excitate the filters built in (a) with the source from(c) i.e., convolve
%the glottal pulse train with system from(a) to synthesize the vowels

syntheticVowel_f0_1 = conv(glottalPulseTrain_f0_1,h_aa);
syntheticVowel_f0_2 = conv(glottalPulseTrain_f0_2,h_aa);

%Take the first 300 samples
lengthOfFirst300Samples = 300;

syntheticVowel_f0_1_First300 = syntheticVowel_f0_1(1:lengthOfFirst300Samples);
syntheticVowel_f0_2_First300 = syntheticVowel_f0_2(1:lengthOfFirst300Samples);

%Plotting
figure(5)
plot(syntheticVowel_f0_1_First300)

figure(6)
plot(syntheticVowel_f0_2_First300)


% %Sound Checking
% sound(syntheticVowel_f0_1,Fs)
% 
% sound(syntheticVowel_f0_2,Fs)
