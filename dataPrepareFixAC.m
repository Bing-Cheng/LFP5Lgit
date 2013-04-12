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
    eList = dir(odir);
    for i = 3 : length(eList)
        eName = eList(i).name
            load([idir1 'Wave' eName(4:end)]);
            load([odir eName]);

                [AC1_RC, AC2_RC, AC3_RC, AC4_RC] = getFFTFixAC(waveCorrectCorrection,TrialStartCorrectCorrection,B,A);
                [AC1_RR, AC2_RR, AC3_RR, AC4_RR] = getFFTFixAC(waveCorrectReinforcement,TrialStartCorrectReinforcement,B,A);
                [AC1_WC, AC2_WC, AC3_WC, AC4_WC] = getFFTFixAC(waveIncorrectCorrection,TrialStartIncorrectCorrection,B,A);
                [AC1_WR, AC2_WR, AC3_WR, AC4_WR] = getFFTFixAC(waveIncorrectReinforcement,TrialStartIncorrectReinforcement,B,A);
            
    save([odir 'FRQ' eName(5:end)], 'BS_RC', 'BC_RC', 'AC1_RC','AC2_RC','AC3_RC','AC4_RC', 'BS_RR', 'BC_RR', 'AC1_RR','AC2_RR','AC3_RR','AC4_RR',...
                            'BS_WC', 'BC_WC', 'AC1_WC','AC2_WC','AC3_WC','AC4_WC', 'BS_WR', 'BC_WR', 'AC1_WR','AC2_WR','AC3_WR','AC4_WR',...
                            'BE_RC', 'AE_RC', 'BE_RR', 'AE_RR', 'BE_WC', 'AE_WC' ,'BE_WR', 'AE_WR');
                clear -regexp _RC$ _RR$ _WC$ _WR$;

    end%eList
end%rats
    