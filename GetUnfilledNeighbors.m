function PixelList=GetUnfilledNeighbors(ImageMask,WindowSize)
%We get a list of all unfilled pixels that have filled pixels as their neighbors. 
%(The image is subtracted from its morphological dilation).
    Empty=imdilate(ImageMask,ones(5,5))-ImageMask;
    EmptyList=find(Empty(:)==1);
    ws=size(ImageMask,1);                 
    randomPixel=zeros(length(EmptyList),2);
    for i=1:length(EmptyList)
        A=mod(EmptyList(i),ws);
        B=1+floor(EmptyList(i)/ws);
        if A==0
            A=ws;
            B=B-1;
        end
        randomPixel(i,1)=A;
        randomPixel(i,2)=B;
    end
% The list is randomly permuted and then sorted by decreasing number of
% filled neighbor pixels.
    M=zeros(size(randomPixel,1),1);
    for i=1:size(randomPixel,1)
        Template=GetNeighborhoodWindow(ImageMask,randomPixel(i,:),WindowSize);
        M(i)=sum(Template(:));
    end
    
    [~,Id]=sort(M);
    PixelList=zeros(length(Id),2);
    for i=1:length(Id)
        PixelList(i,:)=randomPixel(Id(i),:);
    end
end