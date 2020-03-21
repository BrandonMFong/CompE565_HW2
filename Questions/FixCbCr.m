function out = FixCbCr(Frame)
    [rows,columns] = size(Frame);
    temp = int32(Frame);
    for r = 1:rows 
        for c = 1:columns 
            temp(r,c) = Frame(r,c)*4;
        end
    end
    out = temp;
end