% Saving into ./Outputs directory
savevar = jsondecode(fileread('Save.json'));
save("./Outputs/PSNR_Y.txt", "PSNR_Y", '-ascii')
save("./Outputs/PSNR_Cb.txt", "PSNR_Cb", '-ascii')
save("./Outputs/PSNR_Cr.txt", "PSNR_Cr", '-ascii')

fid = fopen('./Outputs/Inverse_QDCT_Cb.csv','wt');
for ii = 1:size(Inverse_QDCT_Cb,1)
    fprintf(fid,'%g,',Inverse_QDCT_Cb(ii,:));
    fprintf(fid,'\n');
end
fclose(fid)

imwrite(DCTBlock1,'./Outputs/DCTBlock1.jpg')
imwrite(DCTBlock2,'./Outputs/DCTBlock2.jpg')
imwrite(NewImgYCbCr,'./Outputs/NewImgYCbCr.jpg')
imwrite(NewImgRGB,'./Outputs/NewImgRGB.jpg')
imwrite(DiffImg,'./Outputs/DiffImg.jpg')