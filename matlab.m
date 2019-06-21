clc
clear

data = xlsread('data_for_run_matlab.xlsx', 1, 'B2:AE1308');
label = xlsread('data_for_run_matlab.xlsx', 1, 'B1309:AE1309');

protein = [1:1307];

res = [];
label_response = [];

for i = 1:30 
    col = [];
    for j = protein
        col = [col; data(j,i)];
    end
    res = [res col];
    label_response = [label_response label(1,i)];
end

res = [res; label_response];



