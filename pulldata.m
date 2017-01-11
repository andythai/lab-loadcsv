% Function pulls data from csv files
% Input: 
%   A table imported from ChronoViz
% Output: 
%   T - table to return
% To use: import .csv data as a table, then type in:
% variable = pulldata(tablename) to save as a table.
function T = pulldata(csvfile)

% Initialize variables
START_TIME_OFFSET = 1; % Location of start time column
END_TIME_OFFSET = 2;   % Location of end time column
LABEL_OFFSET = 5;      % Location of labeled title
TIME_FORMAT = 'MM:SS.FFF';
NUM_ROWS = size(csvfile,1);
amount = NUM_ROWS - 1;

% Variables for table output
T = cell2table(cell(amount, 3));
T.Properties.VariableNames{1} = 'Entry';
T.Properties.VariableNames{2} = 'Seconds';
T.Properties.VariableNames{3} = 'Label';

% Initialize vectors
start_time_vector = csvfile(:, START_TIME_OFFSET);
end_time_vector = csvfile(:, END_TIME_OFFSET);
label_vector = csvfile(:, LABEL_OFFSET);
elapsed_time_vector = zeros(amount, 1);

% Calculates elapsed time
for index = 2:NUM_ROWS
    time1 = datevec(start_time_vector{index,1}, TIME_FORMAT);
    time2 = datevec(end_time_vector{index, 1}, TIME_FORMAT);
    elapsed_time_vector(index - 1, 1) = etime(time2, time1);
end

% Print output
fprintf('Analyzing %s data\n', inputname(1));
fprintf('Number of entries: %d\n', amount);
fprintf('Elapsed time values:\n');
for index = 1:amount
    fprintf('%d \t %.1f sec \t ', index, elapsed_time_vector(index));
    T{index,1} = {index};
    T{index,2} = {elapsed_time_vector(index)};
    T{index,3} = {char(label_vector{index + 1, 1})};
    fprintf('%s\n', char(label_vector{index + 1, 1}));
end

