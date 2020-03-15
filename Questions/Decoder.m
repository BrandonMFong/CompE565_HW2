% Decoder:

% DCT matrices from Encoder.m
% DCT_Y = GetDCT(luma);
% DCT_CbCr(:,:,const.Cb) = GetDCT(cbcrsubsample(:,:,const.Cb));
% DCT_CbCr(:,:,const.Cr) = GetDCT(cbcrsubsample(:,:,const.Cr));

% Quantized matrices from Encoder.m
% QDCT_Y = Quantize(DCT_Y,const.Lum_Quant_Matrix);
% QDCT_Cb = Quantize(DCT_Cb,const.Chrom_Quant_Matrix);
% QDCT_Cr = Quantize(DCT_Cr,const.Chrom_Quant_Matrix);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) Compute the inverse Quantized images obtained in Step (b). (10 points)    
Inverse_QDCT_Y = GetInvDCT(QDCT_Y);
Inverse_QDCT_Cb = GetInvDCT(QDCT_Cb);
Inverse_QDCT_Cr = GetInvDCT(QDCT_Cr);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (d) Reconstruct the image by computing Inverse DCT coefficients. (15 points)