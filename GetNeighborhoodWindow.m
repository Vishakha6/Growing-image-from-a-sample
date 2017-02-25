function Template=GetNeighborhoodWindow(outputImage,Pixel,WindowSize)
    Template=zeros(WindowSize(1),WindowSize(2));                    
    % Returns a window of window size around the given pixel.
    for i1=1:floor(WindowSize(1)/2)+1
        if Pixel(1)-i1<1
            break
        end
    end
    i1=i1-1;
    
    for i2=1:floor(WindowSize(1)/2)+1
        if Pixel(1)+i2>size(outputImage,1)
            break
        end
    end
    i2=i2-1;
    
    for j1=1:floor(WindowSize(2)/2)+1
        if Pixel(2)-j1<1
            break
        end
    end
    j1=j1-1;
    
    for j2=1:floor(WindowSize(2)/2)+1
        if Pixel(2)+j2>size(outputImage,2)
            break
        end
    end
    j2=j2-1;
    
    Template(ceil(WindowSize(1)/2)-i1:ceil(WindowSize(1)/2)+i2,ceil(WindowSize(2)/2)-j1:ceil(WindowSize(2)/2)+j2)=outputImage(Pixel(1)-i1:Pixel(1)+i2,Pixel(2)-j1:Pixel(2)+j2);
end
    