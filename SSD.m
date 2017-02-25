function D=SSD(SampleImage,Template,Mask)
    Mask_ = Template.*Mask;
    Sample=SampleImage.*SampleImage;
    % D gives the sum of squared difference between the new image being
    % made and the sample image.
    D=imfilter(Sample,Mask)-2*imfilter(SampleImage,Mask_)+sum(Mask_(:).^2);
end