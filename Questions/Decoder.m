% Decoder:

% DCT matrices from Encoder.m
% DCT_Y
% DCT_CbCr(:,:,const.Cb)
% DCT_CbCr(:,:,const.Cr)

% Quantized matrices from Encoder.m
% QDCT_Y
% QDCT_CbCr(:,:,const.Cb)
% QDCT_CbCr(:,:,const.Cr)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) Compute the inverse Quantized images obtained in Step (b). (10 points)
const = Constants();
IQuantized_QDCT_CbCr = QDCT_CbCr;
IQuantized_QDCT_Y = IQuantize(QDCT_Y, const.Lum_Quant_Matrix);
IQuantized_QDCT_CbCr(:,:,const.Cb) = IQuantize(QDCT_CbCr(:,:,const.Cb), const.Chrom_Quant_Matrix);
IQuantized_QDCT_CbCr(:,:,const.Cr) = IQuantize(QDCT_CbCr(:,:,const.Cr), const.Chrom_Quant_Matrix);

QDCT_Y(41:48,9:16)
IQuantized_QDCT_Y(41:48,9:16)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (d) Reconstruct the image by computing Inverse DCT coefficients. (15 points)
Inverse_QDCT_CbCr = IQuantized_QDCT_CbCr;
Inverse_QDCT_Y = GetInvDCT(IQuantized_QDCT_Y,GetVarName(IQuantized_QDCT_Y));
Inverse_QDCT_CbCr(:,:,const.Cb) = FixCbCr(GetInvDCT(IQuantized_QDCT_CbCr(:,:,const.Cb),GetVarName(IQuantized_QDCT_CbCr)));
Inverse_QDCT_CbCr(:,:,const.Cr) = FixCbCr(GetInvDCT(IQuantized_QDCT_CbCr(:,:,const.Cr),GetVarName(IQuantized_QDCT_CbCr)));

% Upsample
NewImgYCbCr = GetUpSample(Inverse_QDCT_Y,Inverse_QDCT_CbCr);
NewImgRGB = ycbcr2rgb(NewImgYCbCr);
figure, imshow(NewImgYCbCr);title('New Image [YCbCr]');
figure, imshow(NewImgRGB);title('New Image [RGB]');
