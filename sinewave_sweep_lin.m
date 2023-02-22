function [audio]=sinewave_sweep_lin(T, Fs, F1, F2,Bit, Gain, Channel)
Ts = linspace(0,T,T*Fs);
amp = 10^(Gain/20);
phase=F1*Ts+(F2-F1)/(2*T)*Ts.^2
audio = amp*sin(phase);
if Channel == 1
audiowrite('sine.wav', audio, Fs, 'BitsPerSample',Bit);
else if Channel == 2
        audio = [audio;audio];
        audio = audio';
        audiowrite('sine.wav', audio, Fs, 'BitsPerSample',Bit);
    end
end