%% 6.2. Simple row or column replication. %%
% using ycbcrSubsampled
function out = GetUpSample(luma,)
    const = Constants();
    ycbcrReconstructed62 = luma; % init just to ensure dimensions           
    ycbcrReconstructed62(1:2:end,1:2:end,const.Cb:const.Cr) = cbcrsubsample(:,:,const.Cb:const.Cr);

    for r = 1:rows
        for c = 1:columns
            % if we are in an odd row and it's an even column
            if ((mod(c, 2) == 0) && mod(r, 2) ~= 0)
                % copying the value from the column before index
                ycbcrReconstructed62(r,c,const.Cr) = ycbcrReconstructed62(r,c-1,const.Cr);
                ycbcrReconstructed62(r,c,const.Cb) = ycbcrReconstructed62(r,c-1,const.Cb);
            % if it is an even row
            elseif (mod(r, 2) == 0)
                % copies the entire previous row
                ycbcrReconstructed62(r,:,const.Cr) = ycbcrReconstructed62(r-1,:,const.Cr);
                ycbcrReconstructed62(r,:,const.Cb) = ycbcrReconstructed62(r-1,:,const.Cb);
            end
        end
    end
    out = ycbcrReconstructed62;
end