% Encoder: (Use 4:2:0 YCbCr component image)
% (b) Quantize the DCT image by using the JPEG luminance and chrominance quantizer matrix from the lecture notes.
% • Report the following output only for the first 2 blocks in the 6th row from top of the luminance component:

ycbcrsubsample = GetSubSample(); % From GetSubSample.m


% (a) Compute the 8x8 block DCT transform coefficients of the luminance and chrominance components of the image.
% • Please display the DCT coefficient matrix as well as image of the DCT transformed image blocks of the first 2
% blocks in the 6th row (of blocks) from top for the luminance component. (15 points)

[rows, columns, numberOfColorChannels] = size(ycbcrsubsample);
DCT = ycbcrsubsample;

BlockSize = 8;
Row_MaxInterval = BlockSize;
Row_MinInterval = 1;
Column_MaxInterval = BlockSize;
Column_MinInterval = 1;
M = BlockSize;
N = BlockSize;

m = 0; n = 0;
for i = 1:BlockSize:rows
    if(Row_MaxInterval > rows) break; end;
    for j = 1:BlockSize:columns
        if (Column_MaxInterval > columns) break; end;
        for m = 0:(M-1)
            for n = 0:(N-1)
                % Create 8x8 block
                Pixel = ycbcrsubsample(Row_MinInterval:Row_MaxInterval,Column_MinInterval:Column_MaxInterval,:);

                % Getting DCT Coefficient
                DCT(Row_MinInterval+m,Column_MinInterval+n,:) = GetDCT(m, n, Pixel);
            end
        end

        % Increment Column Block
        Column_MaxInterval = Column_MaxInterval + BlockSize; % bound this
        Column_MinInterval = Column_MinInterval + BlockSize;
    end

    % Increment Row Block
    Row_MaxInterval = Row_MaxInterval + BlockSize; % bound this
    Row_MinInterval = Row_MinInterval + BlockSize;
end
