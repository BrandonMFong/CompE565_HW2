% Encoder: (Use 4:2:0 YCbCr component image)

% 4:2:0 SubSample
cbcrsubsample = GetCbCrSubSample(); % From GetSubSample.m
% chromeCB = cbcrsubsample(:,:,Cb);
% chromeCR = cbcrsubsample(:,:,Cr);
luma = GetLuma(); % From GetLuma.m

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (a) Compute the 8x8 block DCT transform coefficients of the luminance and chrominance components of the image.
    % • Please display the DCT coefficient matrix as well as image of the DCT transformed image blocks of the first 2
    % blocks in the 6th row (of blocks) from top for the luminance component. (15 points)

% Define constants in Constant.m
const = Constants();

% GetDCT.m
DCT_Y = GetDCT(luma);
DCT_CbCr = cbcrsubsample;
%TODO step into this and see if everything is calculating correctly
DCT_CbCr(:,:,const.Cb) = GetDCT(cbcrsubsample(:,:,const.Cb));
DCT_CbCr(:,:,const.Cr) = GetDCT(cbcrsubsample(:,:,const.Cr));
DCT_Cb = DCT_CbCr(:,:,const.Cb);
DCT_Cr = DCT_CbCr(:,:,const.Cr);

% Display the image
DCTBlock1 = DCT_Y(41:48,1:8);
DCTBlock2 = DCT_Y(41:48,9:16);
figure, imshow(DCTBlock1);title('DCT Image - Block 1 [Y]'); 
figure, imshow(DCTBlock2);title('DCT Image - Block 2 [Y]');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (b) Quantize the DCT image by using the JPEG luminance and chrominance quantizer matrix from the lecture notes.
    % • Report the following output only for the first 2 blocks in the 6th row from top of the luminance component:
        % (a) DC DCT coefficient; 
        % (b) Zigzag scanned AC DCT coefficients. (20 points)

% Quantizer.m 
QDCT_Y = Quantize(DCT_Y,const.Lum_Quant_Matrix);
QDCT_Cb = Quantize(DCT_Cb,const.Chrom_Quant_Matrix);
QDCT_Cr = Quantize(DCT_Cr,const.Chrom_Quant_Matrix);

% b - a
IDCTBlock1 = QDCT_Y(41:48,1:8) % First block 
IDCTBlock2 = QDCT_Y(41:48,9:16) % Second block

% b - b 
% TODO do the zig zag scan
