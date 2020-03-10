% Encoder: (Use 4:2:0 YCbCr component image)

% 4:2:0 SubSample
ycbcrsubsample = GetCbCrSubSample(); % From GetSubSample.m
luma = GetLuma(); % From GetLuma.m

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (a) Compute the 8x8 block DCT transform coefficients of the luminance and chrominance components of the image.
% • Please display the DCT coefficient matrix as well as image of the DCT transformed image blocks of the first 2
% blocks in the 6th row (of blocks) from top for the luminance component. (15 points)

% Enumerating rows, columns, and num of colors
% [rows, columns, numberOfColorChannels] = size(ycbcrsubsample); 
[rows, columns, numberOfColorChannels] = size(luma); 

Y=1;Cb=2;Cr=3; % Define YCbCr component index

% Define blocksize
BlockSize = 8;

% Get DCT 
DCT_Y = GetDCT(luma,BlockSize);
DCT_Cb = GetDCT(ycbcrsubsample(:,:,Cb),BlockSize);
DCT_Cr = GetDCT(ycbcrsubsample(:,:,Cr),BlockSize);

% Display the image
figure, imshow(luma(:,:));title('ycbcrsubsample Image [Y]');
figure, imshow(DCT_Y(:,:));title('DCT Image [Y]');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (b) Quantize the DCT image by using the JPEG luminance and chrominance quantizer matrix from the lecture notes.
% • Report the following output only for the first 2 blocks in the 6th row from top of the luminance component:
% (a) DC DCT coefficient; (b) Zigzag scanned AC DCT coefficients. (20 points)