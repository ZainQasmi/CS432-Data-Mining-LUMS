clear all;
filename = 't20_matches.csv';
% fileID = fopen(filename);
% C = textscan(fileID,'%s %s %s %s %s %s %s %s %s %f %f %f %s %f %f %f %f %s %f %f %f %f %f %f');
% table = readtable(filename,'Delimiter',';','ReadVariableNames',false)

data = read_mixed_csv(filename,',');
a = strcat (',', data(:,2));
data(:,1) = strcat (data(:,1),a);

writetable(data,'myData.txt','Delimiter',',')


% fid = fopen(filename,'r');
% C = textscan(fid, repmat('%s',1,10), 'delimiter',';', 'CollectOutput',true);
% C = C{1};
% fclose(fid);

% fid = fopen(filename,'rt');
% C = textscan(fid, '%s %s %s %d', 'Delimiter','\t', 'HeaderLines',1, ...
%     'MultipleDelimsAsOne',true, 'CollectOutput',false);
% fclose(fid);