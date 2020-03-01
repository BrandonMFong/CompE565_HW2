% Taking some lines from our homework 1
function Output = GetSubSample()
    rgbImage = imread('Flooded_house.jpg','jpg'); 
    ycbcr=rgb2ycbcr(rgbImage);
    Output(:,:,Cb:Cr) = ycbcr(1:2:end,1:2:end,Cb:Cr);  
end