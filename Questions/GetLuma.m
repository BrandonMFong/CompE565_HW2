% Taking some lines from our homework 1
function Output = GetCbCrSubSample()
    Y = 1;Cb = 2;Cr = 3;
    rgbImage = imread('Flooded_house.jpg','jpg'); 
    ycbcr=rgb2ycbcr(rgbImage);
    Output(:,:,Y) = ycbcr(:,:,Y);     
end