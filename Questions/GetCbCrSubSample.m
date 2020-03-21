% Taking some lines from our homework 1
function Output = GetCbCrSubSample()
    const = Constants();
    rgbImage = imread('Flooded_house.jpg','jpg'); 
    ycbcr=rgb2ycbcr(rgbImage);
    Output(:,:,const.Cb:const.Cr) = ycbcr(1:2:end,1:2:end,const.Cb:const.Cr);  
end