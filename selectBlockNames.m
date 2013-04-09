rats={'A09', 'O10', 'Q10', 'T10', 'G11', 'K11', 'O12', 'R12', 'S12', 'T12'};
sessionNumber = 0;
for i = 1 : length(rats)
    ratname = rats{i};
load(['G:\preparedDataLFP\', ratname, '_blockname']);
tmp = blockname;
load(['G:\preparedDataLFP\', ratname, '_blocknameBE']);
cBlockNames = combineBlockNames(tmp,blockname);
save(['G:\preparedDataLFP\', ratname, '_cblockname'],'cBlockNames');
sessionNumber = sessionNumber + length(cBlockNames);
end
sessionNumber