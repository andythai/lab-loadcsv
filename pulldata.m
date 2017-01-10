% Function pulls data from csv files
% Input: A table imported from ChronoViz
function pulldata(csvfile)

% Initialize variables
START_TIME_OFFSET = 1; % Location of start time column
END_TIME_OFFSET = 2;   % Location of end time column
LABEL_OFFSET = 5;      % Location of labeled title
TIME_FORMAT = 'MM:SS.FFF';
NUM_ROWS = size(csvfile,1);

% Initialize vectors
start_time_vector = csvfile(:, START_TIME_OFFSET);
end_time_vector = csvfile(:, END_TIME_OFFSET);
label_vector = csvfile(:, LABEL_OFFSET);
elapsed_time_vector = zeros(NUM_ROWS - 1, 1);

% Calculates elapsed time
for index = 2:NUM_ROWS
    time1 = datevec(start_time_vector{index,1}, TIME_FORMAT);
    time2 = datevec(end_time_vector{index, 1}, TIME_FORMAT);
    elapsed_time_vector(index - 1, 1) = etime(time2, time1);
end

% Print output
fprintf('Analyzing %s data\n', inputname(1));
fprintf('Number of entries: %d\n', NUM_ROWS - 1);
fprintf('Elapsed time values:\n');
for index = 1:NUM_ROWS - 1
    fprintf('%d \t %.1f sec \t ', index, elapsed_time_vector(index));
    fprintf('%s\n', char(label_vector{index + 1, 1}));
end