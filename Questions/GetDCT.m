function out = GetDCT(value,BlockSize)

    [rows, columns] = size(value); 
    DCT = int32(value); % Convert to 32 bit

    % Init interval variables when working with blocksizeXblocksize
    Row_MaxInterval = BlockSize;
    Column_MaxInterval = BlockSize;
    
    for Row_MinInterval = 1:BlockSize:rows % sweeping rows
        if(Row_MaxInterval > rows) 
            break; % Nothing left in the photo to sweep
        end % Bounding since I am inc by Blocksize
        
        for Column_MinInterval = 1:BlockSize:columns % Sweeping columns
            if (Column_MaxInterval > columns) 
                Column_MaxInterval = BlockSize;
            end % Bounding since I am inc by Blocksize

            % Getting DCT Block [DCTImage[Block] <= DCTBlock]
            Block = GetDCTBlock(int32(value(Row_MinInterval:Row_MaxInterval,Column_MinInterval:Column_MaxInterval))); % From GetDCTBlock.m
            DCT(Row_MinInterval:Row_MaxInterval,Column_MinInterval:Column_MaxInterval) = Block;

            % Increment Column Block
            Column_MaxInterval = Column_MaxInterval + BlockSize; % bound this
        end

        % Increment Row Block
        Row_MaxInterval = Row_MaxInterval + BlockSize; % bound this
    end

    out = DCT;
end
% m and n is indexing which DCT coefficient you want
% So this function only returns a DCT coefficient
function out = GetDCTBlock(Pixel)
    [rows, columns] = size(Pixel);
    DCTOutput = Pixel;
    for m = 0:rows-1
        for n = 0:columns-1
            DCTOutput(m+1,n+1) = GetDCTCoefficient(m,n,Pixel,rows,columns);
        end
    end
    out = DCTOutput;
end

function out = GetDCTCoefficient(m,n,pixel,M,N)
    % Get the Cp var   
    var = cm_cn_handler(m,n);

    % Calculate the inner loop of DCT
    Loop = int32(0);
    for i = 0:(M-1)
        for j = 0:(N-1)
            part1 = cos(((2*i + 1)*m*pi)/(2*M));
            part2 = cos(((2*j + 1)*n*pi)/(2*N));
            pix = pixel(i+1, j+1, :);
            Loop = Loop + int32(pix * part1 * part2);
        end
    end

    out = (2/sqrt(M*N)) * var.cm * var.cn * Loop;
end

