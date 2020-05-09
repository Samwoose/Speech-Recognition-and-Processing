function [toneSequence] = tone0Generator(targetTone)
%TONE0GENERATOR Summary of this function goes here
%   Detailed explanation goes here

n_values = [1:1:1000]; %1000 samples in this homework problem
d_sequence = zeros(1,1000);

%generate tone for 0
if targetTone == 0
    f1 = 941;
    f2 = 1336;

    w1 = 2*pi*f1;
    w2 = 2*pi*f2;

    Ts = 1/8000;

    for i = 1:size(n_values,2)
        d_sequence(i) = sin(w1*Ts*n_values(i)) + sin(w2*Ts*n_values(i));
    end

    toneSequence = d_sequence;

end

%generate tone for 1
if targetTone == 1
    f1 = 697;
    f2 = 1209;

    w1 = 2*pi*f1;
    w2 = 2*pi*f2;

    Ts = 1/8000;

    for i = 1:size(n_values,2)
        d_sequence(i) = sin(w1*Ts*n_values(i)) + sin(w2*Ts*n_values(i));
    end

    toneSequence = d_sequence;

end

%generate tone for 2
if targetTone == 2
    f1 = 697;
    f2 = 1336;

    w1 = 2*pi*f1;
    w2 = 2*pi*f2;

    Ts = 1/8000;

    for i = 1:size(n_values,2)
        d_sequence(i) = sin(w1*Ts*n_values(i)) + sin(w2*Ts*n_values(i));
    end

    toneSequence = d_sequence;

end

%generate tone for 3
if targetTone == 3
    f1 = 697;
    f2 = 1477;

    w1 = 2*pi*f1;
    w2 = 2*pi*f2;

    Ts = 1/8000;

    for i = 1:size(n_values,2)
        d_sequence(i) = sin(w1*Ts*n_values(i)) + sin(w2*Ts*n_values(i));
    end

    toneSequence = d_sequence;

end

%generate tone for 4
if targetTone == 4
    f1 = 770;
    f2 = 1209;

    w1 = 2*pi*f1;
    w2 = 2*pi*f2;

    Ts = 1/8000;

    for i = 1:size(n_values,2)
        d_sequence(i) = sin(w1*Ts*n_values(i)) + sin(w2*Ts*n_values(i));
    end

    toneSequence = d_sequence;

end

%generate tone for 5
if targetTone == 5
    f1 = 770;
    f2 = 1336;

    w1 = 2*pi*f1;
    w2 = 2*pi*f2;

    Ts = 1/8000;

    for i = 1:size(n_values,2)
        d_sequence(i) = sin(w1*Ts*n_values(i)) + sin(w2*Ts*n_values(i));
    end

    toneSequence = d_sequence;

end

%generate tone for 6
if targetTone == 6
    f1 = 770;
    f2 = 1477;

    w1 = 2*pi*f1;
    w2 = 2*pi*f2;

    Ts = 1/8000;

    for i = 1:size(n_values,2)
        d_sequence(i) = sin(w1*Ts*n_values(i)) + sin(w2*Ts*n_values(i));
    end

    toneSequence = d_sequence;

end


%generate tone for 7
if targetTone == 7
    f1 = 852;
    f2 = 1209;

    w1 = 2*pi*f1;
    w2 = 2*pi*f2;

    Ts = 1/8000;

    for i = 1:size(n_values,2)
        d_sequence(i) = sin(w1*Ts*n_values(i)) + sin(w2*Ts*n_values(i));
    end

    toneSequence = d_sequence;

end

%generate tone for 8
if targetTone == 8
    f1 = 852;
    f2 = 1336;

    w1 = 2*pi*f1;
    w2 = 2*pi*f2;

    Ts = 1/8000;

    for i = 1:size(n_values,2)
        d_sequence(i) = sin(w1*Ts*n_values(i)) + sin(w2*Ts*n_values(i));
    end

    toneSequence = d_sequence;

end


%generate tone for 9
if targetTone == 9
    f1 = 852;
    f2 = 1477;

    w1 = 2*pi*f1;
    w2 = 2*pi*f2;

    Ts = 1/8000;

    for i = 1:size(n_values,2)
        d_sequence(i) = sin(w1*Ts*n_values(i)) + sin(w2*Ts*n_values(i));
    end

    toneSequence = d_sequence;

end


end
