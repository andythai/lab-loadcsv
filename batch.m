% Function uses pulldata for all tables in varArray
% Input: 
%   An array of variable names. This can be gotten via 
%       varArray = who('CSD*')

function batch(varArray)

WORKSPACE_NUM = size(varArray, 1); % Amount of workspace tables

for index = 1:WORKSPACE_NUM
    table_var = evalin('base', varArray{index});
    output = pulldata(table_var);
    assignin('base', strcat(varArray{index}, '_table'), output);
end

end