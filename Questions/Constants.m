% Defines the class that holds all constants

classdef Constants
    properties
        Y = 1;
        Cb = 2;
        Cr = 3;
        BlockSize = 8;
        Lum_Quant_Matrix = csvread('../QuantizationMatrices/LuminanceQMat.csv');
        Chrom_Quant_Matrix = csvread('../QuantizationMatrices/ChrominanceQMat.csv');
    end
end