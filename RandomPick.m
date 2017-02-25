function BestMatch=RandomPick(BestMatches)
    Index=randi([1,size(BestMatches,1)],1); % Selects random pixels from the list defined in the BestMatches function.        
    BestMatch=BestMatches(Index,:);
end