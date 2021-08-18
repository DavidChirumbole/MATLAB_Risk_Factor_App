function number = categorytonumber(category)
% Takes in the category name as a string and produces its corresponding
% number. The corresponding number is the column number that contains
% values for the specified category in the 6468x8 array.
if strcmp(category, 'Total Deaths')
    number = 4;
elseif strcmp(category, 'Obesity Deaths')
    number = 5;
elseif strcmp(category, 'Drug Deaths')
    number = 6;
elseif strcmp(category, 'Alcohol Deaths')
    number = 7;
elseif strcmp(category, 'Smoking Deaths')
    number = 8;
end