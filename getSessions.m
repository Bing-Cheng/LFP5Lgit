close all;
clear;
datePos = [5:16];
rats = {'A09', 'O10', 'Q10', 'T10', 'G11', 'K11', 'O12', 'R12', 'S12', 'T12'};
k=1;
sessions ={};
for r = 1 : length(rats)
    ratname = rats{r};
    idir =  ['G:\frequencyDataLFP\' ratname '\'];
	eList = dir(idir);
    for i = 3: 16 : length(eList)
        eName = eList(i).name;
		sessions{k} = eName(datePos);
		
		for j = i+1 : i+15
            eName1 = eList(j).name;
            tmp = eName1(datePos);
            if sessions{k} ~= tmp 
                tmp
            end
        end
	k = k + 1;
    end
	k
end
save('G:\frequencyDataLFP\sessions.mat', 'sessions');

		