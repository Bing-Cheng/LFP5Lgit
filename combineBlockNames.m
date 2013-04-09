
function cBlockNames =combineBlockNames(B1,B2)
k=1;
for i = 1 : length(B1)
    for j = 1 : length(B2)
        B1Date= B1{i};
        B2Date= B2{j};
        if B1Date(1:end-1) == B2Date(1:end-1)
            C{k} = B1{i};
            k = k+1;
        end
    end
end
cBlockNames = C;
