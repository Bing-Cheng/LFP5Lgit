close all;
clear;

rats = {'A09', 'O10', 'Q10', 'T10', 'G11', 'K11', 'O12', 'R12', 'S12', 'T12'};
k=1;
for j = 1 : length(rats)
    ratname = rats{j};
    idir =  ['G:\frequencyDataLFP\' ratname '\'];
	eList = dir(idir);
    for i = 3: 16 : length(eList)
        eName = eList(i).name
		session(k) = eName(6:17);
		k = k + 1;
		for j = i+1 : i+15
		tmp = eName(6:17);
		if session(k) ~= tmp 
			tmp
		end
	end
	k
end

		