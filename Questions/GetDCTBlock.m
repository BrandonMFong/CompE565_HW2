
% m and n is indexing which DCT coefficient you want
% So this function only returns a DCT coefficient
function out = GetDCTBlock(Pixel)
    [rows, columns] = size(Pixel);
    DCTOutput = Pixel;
    for m = 0:rows-1
        for n = 0:columns-1
            DCTOutput(m+1,n+1) = GetDCT(m,n,Pixel,rows,columns);
        end
    end
    out = DCTOutput;
end

function out = GetDCT(m,n,pixel,M,N)
    % Get the Cp var   
    cm = 0; cn = 0;
    if ((m == 0) && (n == 0))
        cm = 1 / sqrt(2);cn = 1 / sqrt(2);
    elseif((m ~= 0) && (n == 0))
        cm = 1;cn = 1 / sqrt(2);
    elseif((m == 0) && (n ~= 0))
        cm = 1 / sqrt(2);cn = 1;
    else
        cm = 1; cn = 1;
    end

    % Calculate the inner loop of DCT
    Loop = 0;
    for i = 0:(M-1)
        for j = 0:(N-1)
            Loop = pixel(i+1, j+1, :) * ((cos(2*i + 1)*m*pi)/2*M) * ((cos(2*j + 1)*n*pi)/2*N);
        end
    end

    out = (2/sqrt(M*N)) * cm * cn * Loop;
end