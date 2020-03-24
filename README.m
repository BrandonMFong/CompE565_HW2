Setup
% HW2: JPEG based Image Compression
% Joseph Morga & Brandon Fong
% CompE 565 Homework 2
% Due Date: Sunday, March 22, 2020 11:00 pm
% Name & ID : Joseph Morga (817281186), Brandon Fong (819295224)
% email: jmorga@sdsu.edu, fong.m.brandon97@gmail.com
% Link to Report: https://docs.google.com/document/d/1pDCAfS1MUaPxmLuEfVz3SwN3DK2Poj1Mux8VzdtdbcA/edit
% Link to Git: https://github.com/BrandonMFong/CompE565_HW2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 1: Encoder: (Use 4:2:0 YCbCr component image)
% Implementation 1: Image => DCT => Qunatize + Zig Zag Scan
% M-file name: Source\Encoder.m
% Usage: NA
% Location of output image: .\Ouptuts\
% Parameters: NA
% Other parameters here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Encoder

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 2: Display each band (Red, Green and Blue) of the image file (15 points)
% Implementation 1: Inverese Quantize => Inverse DCT
% M-file name: Source\Decoder.m
% Usage: NA
% Location of output image: .\Ouptuts\
% Parameters: NA
% Other parameters here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Decoder

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 3: ** Required by guidlines 
% • Display the Error Image (by subtracting the reconstructed image form the
% original) for the luminance image. (10 points)
% • PSNR for the luminance component of the decoded image. (10 points)
% Implementation 1: Difference Image + PSNR
% M-file name: Source\Evaluate.m
% Usage: NA
% Location of output image: .\Ouptuts\
% Parameters: NA
% Other parameters here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Evaluate


SaveOutputs
