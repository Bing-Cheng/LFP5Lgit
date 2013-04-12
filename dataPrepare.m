close all;
clear;

rats = {'A09', 'O10', 'Q10', 'T10', 'G11', 'K11', 'O12', 'R12', 'S12', 'T12'};
fc = 500; % Cut-off frequency (Hz)
fs = 24414; % Sampling rate (Hz)
order = 5; % Filter order
[B,A] = butter(order,2*fc/fs); % [0:pi] maps to [0:1] here
for j = 1 : length(rats)
    ratname = rats{j};
    idir1 = ['G:\dataLFP\' ratname,'_wave\sectioned\'];
    idir2 = ['G:\dataLFP\' ratname,'_wave\sectionedBE2s\'];
    odir =  ['G:\frequencyDataLFP\' ratname '\'];


    %cd(idir1);
    eList = dir(idir1);
    for i = 3 : length(eList)
        eName = eList(i).name
        if exist([idir2 eName], 'file') == 2
            saveFile = 1;
            load([idir1 eName]);
            trialNumberRC = length(TrialStartCorrectCorrection);
            trialNumberRR = length(TrialStartCorrectReinforcement);
            trialNumberWC = length(TrialStartIncorrectCorrection);
            trialNumberWR = length(TrialStartIncorrectReinforcement);
            if trialNumberRC>5 && trialNumberRR>5 && trialNumberWC>5 && trialNumberWR>5
                [BS_RC, BC_RC, AC_RC] = getFFT(waveCorrectCorrection,TrialStartCorrectCorrection,B,A);
                [BS_RR, BC_RR, AC_RR] = getFFT(waveCorrectReinforcement,TrialStartCorrectReinforcement,B,A);
                [BS_WC, BC_WC, AC_WC] = getFFT(waveIncorrectCorrection,TrialStartIncorrectCorrection,B,A);
                [BS_WR, BC_WR, AC_WR] = getFFT(waveIncorrectReinforcement,TrialStartIncorrectReinforcement,B,A);
            else
                saveFile = 0;
            end%if
            load([idir2 eName]);
            trialNumberRC = length(TrialStartCorrectCorrection);
            trialNumberRR = length(TrialStartCorrectReinforcement);
            trialNumberWC = length(TrialStartIncorrectCorrection);
            trialNumberWR = length(TrialStartIncorrectReinforcement);
            if trialNumberRC>5 && trialNumberRR>5 && trialNumberWC>5 && trialNumberWR>5
                [BE_RC, AE_RC] = getFFTBE(waveCorrectCorrection,TrialStartCorrectCorrection,B,A);
                [BE_RR, AE_RR] = getFFTBE(waveCorrectReinforcement,TrialStartCorrectReinforcement,B,A);
                [BE_WC, AE_WC] = getFFTBE(waveIncorrectCorrection,TrialStartIncorrectCorrection,B,A);
                [BE_WR, AE_WR] = getFFTBE(waveIncorrectReinforcement,TrialStartIncorrectReinforcement,B,A);
            else
                saveFile = 0;
            end%if
            if saveFile
                save([odir 'FRQ' eName(5:end)], 'BS_RC', 'BC_RC', 'AC_RC', 'BS_RR', 'BC_RR', 'AC_RR',...
                                        'BS_WC', 'BC_WC', 'AC_WC', 'BS_WR', 'BC_WR', 'AC_WR',...
                                        'BE_RC', 'AE_RC', 'BE_RR', 'AE_RR', 'BE_WC', 'AE_WC' ,'BE_WR', 'AE_WR');
                clear -regexp _RC$ _RR$ _WC$ _WR$;
            end
        end%if name exist
    end%eList
end%rats
    