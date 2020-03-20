% Decoder:

% DCT matrices from Encoder.m
% DCT_Y
% DCT_CbCr(:,:,const.Cb)
% DCT_CbCr(:,:,const.Cr)

% Quantized matrices from Encoder.m
% QDCT_Y
% QDCT_Cb
% QDCT_Cr

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) Compute the inverse Quantized images obtained in Step (b). (10 points)
const = Constants();

IQuantized_QDCT_Y = IQuantize(QDCT_Y, const.Lum_Quant_Matrix);
IQuantized_QDCT_Cb = IQuantize(QDCT_Cb, const.Chrom_Quant_Matrix);
IQuantized_QDCT_Cr = IQuantize(QDCT_Cr, const.Chrom_Quant_Matrix);

QDCT_Y(41:48,9:16)
IQuantized_QDCT_Y(41:48,9:16)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (d) Reconstruct the image by computing Inverse DCT coefficients. (15 points)
Inverse_QDCT_Y = GetInvDCT(IQuantized_QDCT_Y);
Inverse_QDCT_Cb = GetInvDCT(IQuantized_QDCT_Cb);
Inverse_QDCT_Cr = GetInvDCT(IQuantized_QDCT_Cr);
