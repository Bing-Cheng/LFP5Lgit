function [BE, AE] = getFFTBE(wave,TrialStart,B,A)
windowLength = 1000;
fftLength = 500;
fs= 24414;
rfs = 1000;
sampleNumber = windowLength * fs /1000;

trialNumber = length(TrialStart);
BE = zeros(fftLength*2,trialNumber);
AE = zeros(fftLength*2,trialNumber);
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
    fBE= abs(FsingleTrial(1:fftLength*2));
    
    signal = y1(1+500:500+fftLength);
    FsingleTrial = fft([signal, fliplr(signal),signal, fliplr(signal)]);
    fAE= abs(FsingleTrial(1:fftLength*2));
    
   if sum(fBE)>0.01 && sum(fAE)>0.01
        BE(:,i) = fBE';
        AE(:,i) = fAE';
    else
        BE(:,i:end) = [];
        AE(:,i:end) = [];
        break;
    end
end%trial



    