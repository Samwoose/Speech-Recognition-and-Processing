%(a)
%Generate 10 different tones(0~9)
tone0Sequence = tone0Generator(0);
tone1Sequence = tone0Generator(1);
tone2Sequence = tone0Generator(2);
tone3Sequence = tone0Generator(3);
tone4Sequence = tone0Generator(4);
tone5Sequence = tone0Generator(5);
tone6Sequence = tone0Generator(6);
tone7Sequence = tone0Generator(7);
tone8Sequence = tone0Generator(8);
tone9Sequence = tone0Generator(9);

%(b)Plotting DFT result for tone 2
N1 = 2^10;
N2 = 2^13;

%DFT 
tone2DFT_N1 = fft(tone2Sequence,N1);
tone2DFT_N2 = fft(tone2Sequence,N2);

%plot ampliute for each DFT result
figure(1)
plot(abs(tone2DFT_N1))

figure(2)
plot(abs(tone2DFT_N2))

%(c) Generating tone sequence corresponding to my USC ID
%USC ID: 7953613766
valueOfSilence = 0;
lengthOfUSCIDToneSequence = 11000;

USCIDToneSequence = zeros(1,lengthOfUSCIDToneSequence);

for i = 1:lengthOfUSCIDToneSequence
    if i >= 1 && i<= 1000
        USCIDToneSequence(i) = tone7Sequence(i); %tone 7
    elseif i >=1101  && i <=2100    
        USCIDToneSequence(i) = tone9Sequence(i-1100); %tone 9
    elseif i >=2201  && i <=3200    
        USCIDToneSequence(i) = tone5Sequence(i-2200); %tone 5
    elseif i >=3301  && i <=4300    
        USCIDToneSequence(i) = tone3Sequence(i-3300); %tone 3
    elseif i >=4401  && i <=5400    
        USCIDToneSequence(i) = tone6Sequence(i-4400); %tone 6
    elseif i >=5501  && i <=6500    
        USCIDToneSequence(i) = tone1Sequence(i-5500); %tone 1
    elseif i >=6601  && i <=7600    
        USCIDToneSequence(i) = tone3Sequence(i-6600); %tone 3
    elseif i >=7701  && i <=8700    
        USCIDToneSequence(i) = tone7Sequence(i-7700); %tone 7
    elseif i >=8801  && i <=9800    
        USCIDToneSequence(i) = tone6Sequence(i-8800); %tone 6
    elseif i >=9901  && i <=10900    
        USCIDToneSequence(i) = tone6Sequence(i-9900); %tone 6
    else
        USCIDToneSequence(i) = 0;%silence
    end
end



 %save the sequence as audio file.wav
 filename = "USCID.wav";
 Fs = 8000; %sampling frequency is 8000Hz
 audiowrite(filename,USCIDToneSequence,Fs);





%(d) Decode sequence
decodedUSCID = my_decode(USCIDToneSequence);

%(e) Decode given signals
givenSignals = importdata("ee519_sp20_hw1_tones.mat");
signal1 = givenSignals.sig1;
signal2 = givenSignals.sig2;
signal3 = givenSignals.sig3;

decodedNumber1 = my_decode(signal1);
decodedNumber2 = my_decode(signal2);
decodedNumber3 = my_decode(signal3);

