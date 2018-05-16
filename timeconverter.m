function [year, month, day, hour, minute, second] = timeconverter(unixtime)

% convert unix time to real time and return an array of the corresponding
% day - month - year  hour - minute - second

dt = datetime(unixtime, 'ConvertFrom', 'posixtime');
ds = datestr(dt);
timeArray = double(ds);

% first 2 entries in timeArray are the day
% ascii '0' starts at 48
top = timeArray(1) - 48;
bot = timeArray(2) - 48;
day = top * 10 + bot;

% third entry is a dash (45)
% while loop to read the month until reaching a dash (45)
i = 4;
month = [];
while timeArray(i) ~= 45
    month = [month char(timeArray(i))];
    i = i + 1;
end


% read year
i = i + 1;
year = 0;
% the next four entries are the years
for j= 1:4
   year = (timeArray(i) - 48)*10^(4-j) + year;
   i = i+1;
end
    
    
% skip space
i = i+1;
% read hour (next 2 entries)
% read minutes (the following 2 entries)
% read seconds (the following 2 entries)
hour = 0;
minute = 0;
second = 0;

for j = 1:2
    
    hour = (timeArray(i) - 48)*10^(2-j) + hour;
    % skip the colon and read the minutes
    minute = (timeArray(i + 3) - 48)*10^(2-j) + minute;
    % skip the colon and read the seconds
    second = (timeArray(i + 6) - 48)*10^(2-j) + second;
    
    i = i+1;
end

% change the month to a numeric value
if month == 'Jan'
    month = 1;
elseif month == 'Feb'
    month = 2;
elseif month == 'Mar'
    month = 3;
elseif month == 'Apr'
    month = 4;
elseif month == 'May'
    month = 5;
elseif month == 'Jun'
    month = 6;
elseif month == 'Jul'
    month = 7;
elseif month == 'Aug'
    month = 8;
elseif month == 'Sep'
    month = 9;
elseif month == 'Oct'
    month = 10;
elseif month == 'Nov'
    month = 11;
elseif month == 'Dec'
    month = 12;
end

end