function [AC1, AC2, AC3, AC4] = getFFTFixAC(wave,TrialStart,B,A)
windowLength = 4000;
fftLength = 512;
fs= 24414;
rfs = 1024;
sampleNumber = windowLength * fs /1000;%1s=1000ms

trialNumber = length(TrialStart);
AC1 = zeros(fftLength*2,trialNumber);
AC2 = zeros(fftLength*2,trialNumber);
AC3 = zeros(fftLength*2,trialNumber);
AC4 = zeros(fftLength*2,trialNumber);
for i = 1:trialNumber
    oneTrial = wave(TrialStart(i) : TrialStart(i)+sampleNumber-1);
    if (isfloat(oneTrial))
        X = double(oneTrial*32767000);
    else
        X = double(oneTrial);
    end
    y = filter(B,A,X);
    y1 = resample(y,rfs,fs);% resample to 1024Hz sampling rate 
    
    signal = y1(1+2000:2000+fftLength);
    FsingleTrial = fft([signal, zeros(1,1536)]);
    fAC1= abs(FsingleTrial(1:fftLength*2));
    
    signal = y1(1+2500:2500+fftLength);
    FsingleTrial = fft([signal, zeros(1,1536)]);
    fAC2= abs(FsingleTrial(1:fftLength*2));
    
    signal = y1(1+3000:3000+fftLength);
    FsingleTrial = fft([signal, zeros(1,1536)]);
    fAC3= abs(FsingleTrial(1:fftLength*2));
    
    signal = y1(1+3500:3500+fftLength);
    FsingleTrial = fft([signal, zeros(1,1536)]);
    fAC4= abs(FsingleTrial(1:fftLength*2));
    
    if sum(fAC1)>0.01 && sum(fAC2)>0.01 && sum(fAC3)>0.01 && sum(fAC4)>0.01
        AC1(:,i) = fAC1';
        AC2(:,i) = fAC2';
        AC3(:,i) = fAC3';
        AC4(:,i) = fAC4';
    else
        AC1(:,i:end) = [];
        AC2(:,i:end) = [];
        AC3(:,i:end) = [];
        AC4(:,i:end) = [];
        break;
    end
end%trial



    