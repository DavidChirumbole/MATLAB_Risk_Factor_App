function number = countrytonumber(countryname)
% takes the country name as a string as input and produces the
% corresponding number 1-231 (numbers are given in alphabetical order).
FullArray = readtable('RiskFactorAnalysis.csv');
FullArray = table2cell(FullArray);
% creating blank (2,231) cell array. The two rows will hold the country name
% as a string and the corresponding country number
array = cell(2,231);
% filling the first row with country numbers 1-231
for i = 1:231
    array{1,i} = i;
    
end
% filling the second row with country names (strings) from FullArray
for j = 1:231
    array{2,j} = FullArray{(j*28),1};
end
% assigning a country number to variable "number" by comparing user input
% country name string to county name strings in the second row of the array
% "array"
for p = 1:231
    if strcmp(array{2,p},countryname)
        number = array{1,p};
    end
end