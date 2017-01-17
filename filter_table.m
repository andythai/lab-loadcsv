function [ new_table ] = filter_table( table, string )
%FILTER isolates the tags with the string keyword
%   Input: string to search for, table to search in
%   Output: filtered table with just the string keyword related data
%   Dependencies: N/A
% Variable initialization
ENTRY_OFFSET = 1;
TIME_OFFSET = 2;
LABEL_OFFSET = 3;
NUM_ROWS = size(table, 1);

num_matches = 0;

% Iterate through table first to check for matches
for index = 1:NUM_ROWS
    % Check for string equality
    if strcmp(string, char(table{index, LABEL_OFFSET}))
        num_matches = num_matches + 1;
    end
end

% Initialize table based on number of matches
new_table = cell2table(cell(num_matches, 3));
new_table.Properties.VariableNames{1} = 'Entry';
new_table.Properties.VariableNames{2} = 'Seconds';
new_table.Properties.VariableNames{3} = 'Label';

% Iterate through table again to rebuild it
table_index = 1;
for index = 1:NUM_ROWS
    % Check for string equality
    if strcmp(string, char(table{index, LABEL_OFFSET}))
        % Rebuild table
        new_table{table_index, ENTRY_OFFSET} = table{index, ENTRY_OFFSET};
        new_table{table_index, TIME_OFFSET} = table{index, TIME_OFFSET};
        new_table{table_index, LABEL_OFFSET} = table{index, LABEL_OFFSET};
        table_index = table_index + 1;
    end
end

end

