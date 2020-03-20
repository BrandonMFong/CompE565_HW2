function out = GetPSNR(FrA,FrB)
    const = Constants();
    in = ((const.Peak_Signal).^2)/MSE(FrA,FrB);
    out = 10*log10(in);
end
function out = MSE(A,B)
    MSEY = mean(mean((A-B).^2)); 
end