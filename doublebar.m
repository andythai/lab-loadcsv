function [ graph ] = doublebar( set1_array, set2_array, keyword )
%DOUBLEBAR Creates a doublebar graph based on summation of keyword times
%   Input: set1_array is an array of table names
%          set2_array is an array of table names
%               Acquire arrays by use of who command
%               Example: A = who('text*');
%          keyword is the string to search for
%   Output: dataset for use in bar function
% WARNING: WILL TREAT EVERY FILE AS A SEPARATE DAY

% Get sizes
set1_size = size(set1_array, 1);
set2_size = size(set2_array, 1);
largest_size = 0;

% If sets are not equal in size
if set1_size ~= set2_size
    if set1_size > set2_size
        largest_size = set1_size;
    end
    else
        largest_size = set2_size;
end 

% Initialize data arrays
set_data = zeros([largest_size, 2]);

% Generate data for array 1
for index1 = 1:set1_size
    table_var = evalin('base', set1_array{index1});
    set_data(index1, 1) = summate(table_var, keyword);
end

% Generate data for array 2
for index2 = 1:set2_size
    table_var = evalin('base', set2_array{index2});
    set_data(index2, 2) = summate(table_var, keyword);
end

graph = set_data;

end

