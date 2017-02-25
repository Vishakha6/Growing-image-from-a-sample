SampleImage= [1 1 1 0 0 0 1 1 1;
              1 1 1 0 0 0 1 1 1; 
              1 1 1 0 0 0 1 1 1; 
              0 0 0 1 1 1 0 0 0;
              0 0 0 1 1 1 0 0 0; 
              0 0 0 1 1 1 0 0 0;
              1 1 1 0 0 0 1 1 1;
              1 1 1 0 0 0 1 1 1; 
              1 1 1 0 0 0 1 1 1]; 
Template=[1 0 0; 
          0 1 1;
          0 1 1];
      
%Trying different template. (Called second template in result image).
%Template=[1 1 0; 
%          1 0 1;
%          0 1 0];
Mask=[1 1 1;
      1 1 0;
      1 1 0];
Window=[5,5];
SampleImageSize=[300,300];

outputImage=zeros(SampleImageSize(1),SampleImageSize(2));
SampleImageMask=zeros(SampleImageSize(1),SampleImageSize(2));
A=randi([1,size(SampleImage,1)],1);
B=randi([1,size(SampleImage,2)],1);

%This will compute the sum of squared difference between a little portion of the new image you are making and every portion of the sample.
D=SSD(SampleImage,Template,Mask);

%This finds all candidate pixels in the sample that have a neighborhood that is sufficiently similar to the template.
BestMatches=FindMatches(SampleImage,Template,Mask);
Filter=GetNeighborhoodWindow(SampleImage,[A,B],Window);
imageA=ceil(size(outputImage,1)/2); 
imageB=ceil(size(outputImage,2)/2);

outputImage(imageA-floor(Window(1)/2):imageA+floor(Window(1)/2),imageB-floor(Window(2)/2):imageB+floor(Window(2)/2))=Filter;
SampleImageMask(imageA-floor(Window(1)/2):imageA+floor(Window(1)/2),imageB-floor(Window(2)/2):imageB+floor(Window(2)/2))=1;

[outputImage,SampleImageMask]=GrowImage(SampleImage,outputImage,SampleImageMask,Window);

figure
colormap gray
imagesc(SampleImage)
figure
colormap gray
imagesc(outputImage)