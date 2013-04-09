clear; 
close all; 
clc;

rats={'A09', 'O10', 'Q10', 'T10', 'G11', 'K11', 'O12', 'R12', 'S12', 'T12'};
for j = 1 : length(rats)
    ratname = rats{j};

idir1 = ['G:\dataLFP\' ratname,'_wave\sectioned\'];
idir2 = ['G:\dataLFP\' ratname,'_wave\sectionedBE2s\'];
eLoc = 19;
eDir = idir1;
cd(eDir);
eList = dir(eDir);
for i = 3 : length(eList)
eName = eList(i).name;
ePostFix = eName(eLoc);
if ePostFix ~= 'A'
    newName = [eName(1:eLoc-1) 'A' eName(eLoc+1:end)]
    tmp=1
  %  movefile(eName, newName);
end
end

eDir = idir2;
cd(eDir);
eList = dir(eDir);
for i = 3 : length(eList)
eName = eList(i).name;
ePostFix = eName(eLoc);
if ePostFix ~= 'A'
    newName = [eName(1:eLoc-1) 'A' eName(eLoc+1:end)]
    tmp=2
  %  movefile(eName, newName);
end
end
end
tp=0