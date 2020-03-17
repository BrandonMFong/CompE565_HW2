
% Remember that you are quantizing the 8x8 block, not the frame 
% Kind of the same logic of DCT except you are not averaging the whole block
% No conversion needed since GetDCT() returns a 32 bit matrix

function out = Quantize(Frame,QuantizationMatrix)
    const = Constants();
    [rows, columns] = size(Frame); 
    Q = Frame; % Convert to 32 bit

    % Init interval variables when working with blocksizeXblocksize
    RowMax = const.BlockSize;
    ColumnMax = const.BlockSize;
    
    StatusRow = waitbar(0,'Quantizing');
    for RowMin = 1:const.BlockSize:rows % sweeping rows
        if(RowMax > rows) 
            break; % Nothing left in the photo to sweep
        end % Bounding since I am inc by Blocksize
        
        for ColumnMin = 1:const.BlockSize:columns % Sweeping columns
            if (ColumnMax > columns) 
                ColumnMax = const.BlockSize; % reset
            end % Bounding since I am inc by Blocksize

            % Getting DCT Block [DCTImage[Block] <= DCTBlock]
            Block = GetQuantizedBlock(Frame(RowMin:RowMax,ColumnMin:ColumnMax),QuantizationMatrix);
            Q(RowMin:RowMax,ColumnMin:ColumnMax) = Block;

            % Increment Column Block
            ColumnMax = ColumnMax + const.BlockSize; % bound this
        end

        % Increment Row Block
        RowMax = RowMax + const.BlockSize; % bound this

        % Progress
        waitbar((RowMin)/(rows),StatusRow,"Quantizing")
    end
    close(StatusRow)
    out = Q;
end

function out = GetQuantizedBlock(PixelBlock,QuantizedMatrix) %PixelBlock is already 32 bit
    [rows, columns] = size(PixelBlock);
    QuantizedOutput = PixelBlock; % declare, ensures same type and size
    for r = 1:rows
        for c = 1:columns
            QuantizedOutput(r,c) = round(PixelBlock(r,c)/QuantizedMatrix(r,c));
        end
    end
    out = QuantizedOutput;
end

