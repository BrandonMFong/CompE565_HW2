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
Inverse_QDCT_Y = GetInvDCT(QDCT_Y);
Inverse_QDCT_Cb = GetInvDCT(QDCT_Cb);
Inverse_QDCT_Cr = GetInvDCT(QDCT_Cr);


luma(41:48,1:8)
luma(41:48,9:16)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (d) Reconstruct the image by computing Inverse DCT coefficients. (15 points)