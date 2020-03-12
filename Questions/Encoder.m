% Encoder: (Use 4:2:0 YCbCr component image)

% 4:2:0 SubSample
ycbcrsubsample = GetCbCrSubSample(); % From GetSubSample.m
% chromeCB = ycbcrsubsample(:,:,Cb);
% chromeCR = ycbcrsubsample(:,:,Cr);
luma = GetLuma(); % From GetLuma.m

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (a) Compute the 8x8 block DCT transform coefficients of the luminance and chrominance components of the image.
% • Please display the DCT coefficient matrix as well as image of the DCT transformed image blocks of the first 2
% blocks in the 6th row (of blocks) from top for the luminance component. (15 points)

% Define constants in Constant.m
const = Constants();

% GetDCT.m
DCT_Y = GetDCT(luma)
% DCT_Cb = GetDCT(ycbcrsubsample(:,:,Cb))
% DCT_Cr = GetDCT(ycbcrsubsample(:,:,Cr))

% Display the image

% displaying the first two blocks
figure, imshow(DCT_Y(6:14,1:8));title('DCT Image [Y]'); 
figure, imshow(DCT_Y(6:14,9:16));title('DCT Image [Y]'); 

% figure, imshow(luma);title('ycbcrsubsample Image [Y]');
% figure, imshow(DCT_Y);title('DCT Image [Y]');

% figure, imshow(ycbcrsubsample(:,:,const.Cb));title('ycbcrsubsample Image [Cb]');
% figure, imshow(DCT_Cb);title('DCT Image [Cb]');

% figure, imshow(ycbcrsubsample(:,:,const.Cr));title('ycbcrsubsample Image [Cr]');
% figure, imshow(DCT_Cr);title('DCT Image [Cr]');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (b) Quantize the DCT image by using the JPEG luminance and chrominance quantizer matrix from the lecture notes.
% • Report the following output only for the first 2 blocks in the 6th row from top of the luminance component:
% (a) DC DCT coefficient; (b) Zigzag scanned AC DCT coefficients. (20 points)