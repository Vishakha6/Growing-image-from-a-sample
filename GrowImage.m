function [ITemp,IMTemp]=GrowImage(SampleImage,outputImage,ImageMask,Window)
    ITemp=outputImage; IMTemp=ImageMask;
    while any(IMTemp==0)
        PixelList=GetUnfilledNeighbors(IMTemp,Window);
        for i=1:size(PixelList,1)
            Template=GetNeighborhoodWindow(ITemp,PixelList(i,:),Window);
            Mask=GetNeighborhoodWindow(IMTemp,PixelList(i,:),Window);
            BestMatches=FindMatches(SampleImage,Template,Mask);
            if ~isempty(BestMatches)
                BestMatch=RandomPick(BestMatches);
                ITemp(PixelList(i,1),PixelList(i,2))=SampleImage(BestMatch(1),BestMatch(2));
                IMTemp(PixelList(i,1),PixelList(i,2))=1;
            end
        end
    end
end
    