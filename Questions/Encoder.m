% Encoder: (Use 4:2:0 YCbCr component image)
% (b) Quantize the DCT image by using the JPEG luminance and chrominance quantizer matrix from the lecture notes.
% • Report the following output only for the first 2 blocks in the 6th row from top of the luminance component:

ycbcrsubsample = GetSubSample(); % From GetSubSample.m


% (a) Compute the 8x8 block DCT transform coefficients of the luminance and chrominance components of the image.
% • Please display the DCT coefficient matrix as well as image of the DCT transformed image blocks of the first 2
% blocks in the 6th row (of blocks) from top for the luminance component. (15 points)

[rows, columns, numberOfColorChannels] = size(ycbcrsubsample);
DCT = ycbcrsubsample;


Row_MaxInterval = BlockSize;
Row_MinInterval = 1;
Column_MaxInterval = BlockSize;
Column_MinInterval = 1;

m = 0; n = 0;
for i = 1:BlockSize:rows
    for j = 1:BlockSize:columns
        Pixel = (Row_MinInterval:Row_MaxInterval,Column_MinInterval:Column_MaxInterval,:);
        DCT(Row_MinInterval:Row_MaxInterval,Column_MinInterval:Column_MaxInterval,:) = GetDCT(m, n, )
    end
end
