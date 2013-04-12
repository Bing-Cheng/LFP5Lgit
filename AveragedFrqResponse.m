close all;
clear;
datePos = [5:16];
rats = {'A09', 'O10', 'Q10', 'T10', 'G11', 'K11', 'O12', 'R12', 'S12', 'T12'};
BSr = [];
BCr = [];
AC1r = [];
AC2r = [];
AC3r = [];
AC4r = [];
BEr = [];
AEr = [];
BSw = [];
BCw = [];
AC1w = [];
AC2w = [];
AC3w = [];
AC4w = [];
BEw = [];
AEw = [];
for j = 1 : length(rats)
    ratname = rats{j}
    odir = 'G:\frequencyDataLFP\';
    idir =  ['G:\frequencyDataLFP\' ratname '\'];
	eList = dir(idir);
    for i = 3: 16 : length(eList)
        eName = eList(i).name;
		load([idir eName])
        BSr = [BSr BS_RC BS_RR];
        BCr = [BCr BC_RC BC_RR];
        AC1r = [AC1r AC1_RC AC1_RR];
        AC2r = [AC2r AC2_RC AC2_RR];
        AC3r = [AC3r AC3_RC AC3_RR];
        AC4r = [AC4r AC4_RC AC4_RR];
        BEr = [BEr BE_RC BE_RR];
        AEr = [AEr AE_RC AE_RR];
        
        BSw = [BSw BS_WC BS_WR];
        BCw = [BCw BC_WC BC_WR];
        AC1w = [AC1w AC1_WC AC1_WR];
        AC2w = [AC2w AC2_WC AC2_WR];
        AC3w = [AC3w AC3_WC AC3_WR];
        AC4w = [AC4w AC4_WC AC4_WR];
        BEw = [BEw BE_WC BE_WR];
        AEw = [AEw AE_WC AE_WR];
    end
end
save([odir 'AverageFrqResponse.mat'], 'BSr', 'BCr', 'AC1r', 'AC2r', 'AC3r', 'AC4r', 'BSw', 'BCw', 'AC1w', 'AC2w', 'AC3w', 'AC4w','BEr', 'AEr', 'BEw', 'AEw');   
        
FqDis = [1:25];     
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
main_handle = figure; hold on;
        XX = [1 : length(FqDis)];%-200;
        xi = 1:0.25:25; 
       % XX1 = [1 :0.5 :length(FqDis)*2-1];
       XX1 = [1:100];
        
        iBSr = mean(BSr,2);
        iBTr = mean(BCr,2);
        iACr = (mean(AC1r,2)+mean(AC1r,2)+mean(AC1r,2)+mean(AC1r,2))/4;

        iBEr = mean(BEr,2);
        iAEr = mean(AEr,2);
       plot(XX1, iBSr(XX1),'k');
       plot(XX1, iBTr(XX1),'c');
       plot(XX1, iACr(XX1),'g');
%        plot(XX1, iAC2r(XX1),'y');
%        plot(XX1, iAC3r(XX1),'k');
%        plot(XX1, iAC4r(XX1),'b');
       plot(XX1, iBEr(XX1),'r');
       plot(XX1, iAEr(XX1),'b');
        legend('BS','BC','AC','BE','AE');
        xlabel('Frequency (Hz)');
        ylabel('Power');
%         
% inset_handle = figure;
% hold on;
%         XX2 = [4 :0.5 :8];
% thetaF = [8:16];
%        h1= plot(XX2, iBSr(thetaF),'k');
%        h2= plot(XX2, iBTr(thetaF),'c');
%        h3= plot(XX2, iACr(thetaF),'g');
%        h4= plot(XX2, iBEr(thetaF),'r');
%        h5= plot(XX2, iAEr(thetaF),'b');
%       % legend([h1 h2 h3 h4 h5],'BS','BC','AC','BE','AE');
% %        xlabel('Frequency (Hz)');
% %         ylabel('Power');
%        inset_size = 0.78;
% [h_main, h_inset]=inset(main_handle, inset_handle, inset_size)
%         titleN = ['Frequency response r'];
%        % title(titleN);
%         saveas(h_main(1),['D:\bcheng\work\paper\my\paper2_LFP\fig\' titleN],'png');
%         
       main_handle = figure; hold on;
        XX = [1 : length(FqDis)];%-200;
        xi = 1:0.25:25; 
         XX1 = [1:100];
        
                iBSr = mean(BSr,2);
        iBTr = mean(BCw,2);
        iAC1r = mean(AC1w,2)/2;
        iAC2r = mean(AC2w,2)/2;
        iAC3r = mean(AC3w,2)/2;
        iAC4r = mean(AC4w,2)/2;
        iBEr = mean(BEw,2);
        iAEr = mean(AEw,2);
       plot(XX1, iBSr(XX1),'k');
       plot(XX1, iBTr(XX1),'c');
       plot(XX1, iAC1r(XX1),'g');
       plot(XX1, iAC2r(XX1),'y');
       plot(XX1, iAC3r(XX1),'k');
       plot(XX1, iAC4r(XX1),'b');
       plot(XX1, iBEr(XX1),'r');
       plot(XX1, iAEr(XX1),'b');
        legend('BS','BC','AC1','AC2','AC3','AC4','BE','AE');
        xlabel('Frequency (Hz)');
        ylabel('Power');
%         
% inset_handle = figure;
% hold on;
%         XX2 = [4 :0.5 :8];
% thetaF = [8:16];
%        h1= plot(XX2, iBSr(thetaF),'k');
%        h2= plot(XX2, iBTr(thetaF),'c');
%        h3= plot(XX2, iACr(thetaF),'g');
%        h4= plot(XX2, iBEr(thetaF),'r');
%        h5= plot(XX2, iAEr(thetaF),'b');
% %        xlabel('Frequency (Hz)');
% %         ylabel('Power');
%        inset_size = 0.78;
% [h_main, h_inset]=inset(main_handle, inset_handle, inset_size)
%         titleN = ['Frequency response w'];
%        % title(titleN);
%         saveas(h_main(1),['D:\bcheng\work\paper\my\paper2_LFP\fig\' titleN],'png');
%         
%         
%         
