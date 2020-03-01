function out = GetDCT(m,n,Pixel)
    M = 8; N = 8;
    cm = 0; cn = 0;
    if ((m == 0) && (n == 0))
        cm = 1 / sqrt(2);cn = 1 / sqrt(2);
    elseif((m != 0) && (n == 0))
        cm = 1;cn = 1 / sqrt(2);
    elseif((m == 0) && (n != 0))
        cm = 1 / sqrt(2);cn = 1;
    else
        cm = 1; cn = 1;
    end

    Loop = 0;

    for i = 0:(M-1)
        for j = 0:(N-1)

        end
    end
end