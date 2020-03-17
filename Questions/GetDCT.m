% Takes the frame and partitions it by the block 

function out = GetDCT(Frame)
    const = Constants();
    [rows, columns] = size(Frame); 
    DCT = double(Frame); % Convert to 32 bit

    % Init interval variables when working with blocksizeXblocksize
    RowMax = const.BlockSize;
    ColumnMax = const.BlockSize;
    
    StatusRow = waitbar(0,'Calculating DCT');
    for RowMin = 1:const.BlockSize:rows % sweeping rows
        if(RowMax > rows) 
            break; % Nothing left in the photo to sweep
        end % Bounding since I am inc by Blocksize
        
        for ColumnMin = 1:const.BlockSize:columns % Sweeping columns

            if (ColumnMax > columns) 
                ColumnMax = const.BlockSize; % reset
            end % Bounding since I am inc by Blocksize

            % Getting DCT Block [DCTImage[Block] <= DCTBlock]
            Block = GetDCTBlock(double(Frame(RowMin:RowMax,ColumnMin:ColumnMax)));
            DCT(RowMin:RowMax,ColumnMin:ColumnMax) = Block;

            % Increment Column Block
            ColumnMax = ColumnMax + const.BlockSize; % bound this
        end

        % Increment Row Block
        RowMax = RowMax + const.BlockSize; % bound this

        % Progress
        waitbar((RowMin)/(rows),StatusRow,"Calculating DCT")
    end
    close(StatusRow)

    out = DCT;
end

% Takes the block and computes the coefficient 
function out = GetDCTBlock(PixelBlock) %PixelBlock is already 32 bit
    [rows, columns] = size(PixelBlock);
    DCTOutput = PixelBlock; % declare, ensures same type and size
    for m = 0:rows-1
        for n = 0:columns-1
            DCTOutput(m+1,n+1) = GetDCTCoefficient(cm_cn_handler(m,n),PixelBlock);
        end
    end
    out = DCTOutput;
end

% Calculates the coefficient
function out = GetDCTCoefficient(var,pixel)
    [M, N] = size(pixel);

    % Calculate the inner loop of DCT
    Loop = double(0);
    for i = 0:(M-1)
        for j = 0:(N-1)
            part1 = cos(((2*i + 1)*var.m*pi)/(2*M));
            part2 = cos(((2*j + 1)*var.n*pi)/(2*N));
            pix = pixel(i+1, j+1, :); % Index pixel
            Loop = Loop + double(pix * part1 * part2);
        end
    end
    x = double((2/sqrt(M*N)) * var.cn * var.cm * Loop);
    out = x;
end

