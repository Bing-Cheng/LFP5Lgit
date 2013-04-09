function [BS, BC, AC] = getFFT(wave,TrialStart,B,A)
windowLength = 4000;
fftLength = 500;
fs= 24414;
rfs = 1000;
sampleNumber = windowLength * fs /1000;

trialNumber = length(TrialStart);
BS = zeros(fftLength*2,trialNumber);
BC = zeros(fftLength*2,trialNumber);
AC = zeros(fftLength*2,trialNumber);
for i = 1:trialNumber
    oneTrial = wave(TrialStart(i) : TrialStart(i)+sampleNumber-1);
    if (isfloat(oneTrial))
        X = double(oneTrial*32767000);
    else
        X = double(oneTrial);
    end
    y = filter(B,A,X);
    y1 = resample(y,rfs,fs);% resample to 1000Hz sampling rate (0.1ms each sample)
    
    signal = y1(1:fftLength);
    FsingleTrial = fft([signal, fliplr(signal),signal, fliplr(signal)]);
    fBS= abs(FsingleTrial(1:fftLength*2));
    
    signal = y1(1+1500:1500+fftLength);
    FsingleTrial = fft([signal, fliplr(signal),signal, fliplr(signal)]);
    fBC= abs(FsingleTrial(1:fftLength*2));
    
    signal = y1(1+2000:2000+fftLength*4);
    FsingleTrial = fft(signal);
    fAC= abs(FsingleTrial(1:fftLength*2));
    
    if sum(fBS)>0.01 && sum(fBC)>0.01 && sum(fAC)>0.01
        BS(:,i) = fBS';
        BC(:,i) = fBC';
        AC(:,i) = fAC';
    else
        BS(:,i:end) = [];
        BC(:,i:end) = [];
        AC(:,i:end) = [];
        break;
    end
end%trial



    