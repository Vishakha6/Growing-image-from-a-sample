function BestMatches=FindMatches(SampleImage,Template,Mask)
    ErThresh=0.1;
    D=SSD(SampleImage,Template,Mask);
    rows=size(D,1);
    Totweight=sum(Mask(:));
    D=D./Totweight;
    
    %SSD <= min(SSD)*(1+ErrThreshold)
    List=find(D(:)<=min(D(:))*(1+ErThresh));      
    %Getting the best matches from List.
    BestMatches=zeros(length(List),2);
    for i=1:length(List)
        BestMatches(i,1)=mod(List(i),rows);
        BestMatches(i,2)=1+floor(List(i)/rows);
        if  BestMatches(i,1)==0
            BestMatches(i,1)=rows;
            BestMatches(i,2)=BestMatches(i,2)-1;
        end
    end
end
    
    