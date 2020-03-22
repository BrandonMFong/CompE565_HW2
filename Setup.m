format long
% Must have Matlab R2016b and higher
% If not, comment out Part B and included Part A
try 

    % A
    % Paths for project
    % addpath './Questions';
    % addpath './Questions/Misc';
    % addpath './QuantizationMatrices';

    % B
    var = jsondecode(fileread('Paths.json'));
    [rows, columns] = size(var.Paths);
    for r = 1:rows
        addpath(var.Paths(r).Path);
    end
catch exception
    throw(exception)
end