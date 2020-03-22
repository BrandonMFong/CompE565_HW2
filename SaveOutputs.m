% Saving into ./Outputs directory
var = jsondecode(fileread('Save.json'));
save("./Outputs/PSNR_Y.txt", "PSNR_Y", '-ascii')
save("./Outputs/PSNR_Cb.txt", "PSNR_Cb", '-ascii')
save("./Outputs/PSNR_Cr.txt", "PSNR_Cr", '-ascii')
save("./Outputs/Inverse_QDCT_Cb.txt", "Inverse_QDCT_Cb", '-ascii','-tabs')

imwrite(imread(FigA),'FigA.tif')
imwrite(imread(FigB),'FigB.tif')
imwrite(imread(FigC),'FigC.tif')
imwrite(imread(FigD),'FigD.tif')
imwrite(imread(FigE),'FigE.tif')