function [ total_time ] = summate( table, string )
%SUMMATE summates the total time spent in table with string
%   Input: table to analyze, string to search for
%   Output: total time spent doing string label

% Variables
new_table = filter_table(table, string);
NUM_ROWS = size(new_table, 1);
TIME_OFFSET = 2;
total_time = 0;

% Summate in a loop
for index = 1:NUM_ROWS
    time_at_index = new_table{index, TIME_OFFSET};
    total_time = cell2mat(time_at_index) + total_time;
end

end
