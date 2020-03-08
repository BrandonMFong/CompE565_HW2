
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

