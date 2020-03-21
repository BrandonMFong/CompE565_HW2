% Paths for project
% addpath './Questions';
% addpath './Questions/Misc';

var = jsondecode(fileread('Paths.json'));
[rows, columns] = size(var.Paths);
for r = 1:rows
    addpath(var.Paths(r).Path);
end