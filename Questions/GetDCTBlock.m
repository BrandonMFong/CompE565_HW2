
% m and n is indexing which DCT coefficient you want
% So this function only returns a DCT coefficient
function out = GetDCTBlock(Pixel)
    [rows, columns] = size(Pixel);

    for m = 1:rows
        for n = 1:columns
            Pixel(m,n) = GetDCT(m,n,Pixel,rows,columns);
        end
    end
    out = Pixel;
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