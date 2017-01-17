# lab-loadcsv
MATLAB scripts to load, pull data, and analyze csv files for my lab. Use pulldata or batch to get the pulldata'ed tables first before passing in the tables using any other function!

<b>batch.m</b><br>
Given an array of imported table variable names, outputs the equivalent pulldata table with an additional '_table' extension at the end.<br>
<br>
<b>doublebar.m</b><br>
Given two arrays of imported pulldata table variable names (one table for active dominant information, the other for active submissive information), and a keyword label, this script outputs a matrix dataset that can be used to compare summated times graphically via the bar function.<br>
<br>
<b>filter_table.m</b><br>
Given a pulldata table and a label keyword, this function outputs a new table with only the data relevant for the filtered keyword.<br>
<br>
<b>pulldata.m</b><br>
Given an imported table, this function outputs a new table with the entry number, time elapsed between an action, and the name / label of the action itself.<br>
<br>
<b>summate.m</b><br>
Given a pulldata table and a keyword, returns the summation of all the elapsed times for the specific keyword action.<br>
