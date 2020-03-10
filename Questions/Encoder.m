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

% Init interval variables when working with blocksizeXblocksize
Row_MaxInterval = BlockSize;
Column_MaxInterval = BlockSize;

% Make another instance of the ycbcrsubsample for each component
DCT_Cb = int32(ycbcrsubsample(:,:,Cb));
DCT_Cr = int32(ycbcrsubsample(:,:,Cr));
DCT_Y = int32(luma(:,:,Y));

% TODO working on Y component first
for Row_MinInterval = 1:BlockSize:rows % sweeping rows
    if(Row_MaxInterval > rows) 
        break; % Nothing left in the photo to sweep
    end % Bounding since I am inc by Blocksize
    
    for Column_MinInterval = 1:BlockSize:columns % Sweeping columns
        if (Column_MaxInterval > columns) 
            Column_MaxInterval = BlockSize;
        end % Bounding since I am inc by Blocksize

        % Getting DCT Block [DCTImage[Block] <= DCTBlock]
        DCT_Y(Row_MinInterval:Row_MaxInterval,Column_MinInterval:Column_MaxInterval) = GetDCTBlock(int32(luma(Row_MinInterval:Row_MaxInterval,Column_MinInterval:Column_MaxInterval))); % From GetDCTBlock.m

        % Increment Column Block
        Column_MaxInterval = Column_MaxInterval + BlockSize; % bound this
    end

    % Increment Row Block
    Row_MaxInterval = Row_MaxInterval + BlockSize; % bound this
end

% Display the image
figure, imshow(luma(:,:));title('ycbcrsubsample Image [Y]');
figure, imshow(DCT_Y(:,:));title('DCT Image [Y]');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (b) Quantize the DCT image by using the JPEG luminance and chrominance quantizer matrix from the lecture notes.
% • Report the following output only for the first 2 blocks in the 6th row from top of the luminance component:
% (a) DC DCT coefficient; (b) Zigzag scanned AC DCT coefficients. (20 points)