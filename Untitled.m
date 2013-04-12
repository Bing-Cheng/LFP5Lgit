FqDis = [1:25];     
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
main_handle = figure; hold on;
        XX = [1 : length(FqDis)];%-200;
        xi = 1:0.25:25; 
       % XX1 = [1 :0.5 :length(FqDis)*2-1];
       XX1 = [1:1000]';
        
        iBSr = mean(BSr,2);
        iBTr = mean(BCr,2);
        iACr = mean(ACr,2);
        iBEr = mean(BEr,2);
        iAEr = mean(AEr,2);
       h1= plot( iBSr,'k');
       h2= plot(XX1, iBTr,'c');
       h3= plot(XX1, iACr,'g');
       h4= plot(XX1, iBEr,'r');
       h5= plot(XX1, iAEr,'b');
        legend([h1 h2 h3 h4 h5],'BS','BC','AC','BE','AE');
        xlabel('Frequency (Hz)');
        ylabel('Power');