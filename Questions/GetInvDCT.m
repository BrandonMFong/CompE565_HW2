% Takes the frame and partitions it by the block 
function out = GetInvDCT(Frame)
    const = Constants();
    [rows, columns] = size(Frame); 
    ReconstructedImg = int32(Frame); % Convert to 32 bit

    % Init interval variables when working with blocksizeXblocksize
    RowMax = const.BlockSize;
    ColumnMax = const.BlockSize;
    
    StatusRow = waitbar(0,'[Inverse DCT] Sweeping Rows...');
    for RowMin = 1:const.BlockSize:rows % sweeping rows
        if(RowMax > rows) 
            break; % Nothing left in the photo to sweep
        end % Bounding since I am inc by Blocksize
        
        StatusColumn = waitbar(0,'[Inverse DCT] Sweeping Columns...');
        for ColumnMin = 1:const.BlockSize:columns % Sweeping columns

            if (ColumnMax > columns) 
                ColumnMax = const.BlockSize; % reset
            end % Bounding since I am inc by Blocksize

            % Getting DCT Block [ReconstructedImg[Block] <= InvDCTBlock]
            Block = GetInvDCTBlock(int32(Frame(RowMin:RowMax,ColumnMin:ColumnMax)));
            ReconstructedImg(RowMin:RowMax,ColumnMin:ColumnMax) = Block;

            % Increment Column Block
            ColumnMax = ColumnMax + const.BlockSize; % bound this

            % Progress
            waitbar((ColumnMin)/(columns),StatusColumn,"[Inverse DCT] Sweeping Columns...")
        end
        close(StatusColumn)

        % Increment Row Block
        RowMax = RowMax + const.BlockSize; % bound this

        % Progress
        waitbar((RowMin)/(rows),StatusRow,"[Inverse DCT] Sweeping Rows...")
    end
    close(StatusRow)

    out = ReconstructedImg;
end


function out = GetInvDCTBlock(PixelBlock) % PixelBlock is already 32 bit
    [rows, columns] = size(PixelBlock);
    InvDCTOutput = PixelBlock; % declare, ensures same type and size
    for m = 0:rows-1
        for n = 0:columns-1
            InvDCTOutput(m+1,n+1) = GetPixelCoefficient(cm_cn_handler(m,n),PixelBlock);
        end
    end
    out = InvDCTOutput;
end

function out = GetPixelCoefficient(var,pixel)
    [M, N] = size(pixel);

    % Calculate the inner loop of DCT
    Loop = int32(0);
    for i = 0:(M-1)
        for j = 0:(N-1)
            part1 = cos(((2*i + 1)*var.m*pi)/(2*M));
            part2 = cos(((2*j + 1)*var.n*pi)/(2*N));
            pix = pixel(i+1, j+1, :); % Index pixel
            Loop = Loop + int32(var.cm * var.cn * pix * part1 * part2);
        end
    end
    out = (1/4) * Loop;
end

