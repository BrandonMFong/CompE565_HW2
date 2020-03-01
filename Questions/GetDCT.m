function out = GetDCT(m,n,Pixel)
    M = 8; N = 8;
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

    Loop = 0;

    for i = 0:(M-1)
        for j = 0:(N-1)
            Loop = Pixel(i+1, j+1, :) * ((cos(2*i + 1))/2*M) * ((cos(2*j + 1))/2*N);
        end
    end

    out = (2/sqrt(M*N)) * cm * cn * Loop;
end