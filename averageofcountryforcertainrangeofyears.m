function finalarray = averageofcountryforcertainrangeofyears(yi,yf,category)
% used for the rank of country between to user-chosen years
FullArray = readtable('RiskFactorAnalysis.csv');
FullArray = table2cell(FullArray);
numofyears = str2double(yf)-str2double(yi);
% creating inital (4,231) array. Row 1 will be country name, row 2 will be
% country number, row 3 will be the average number of deaths per 100,000 for the chosen category
% over the selected year range,
% and row 4 will be country rank based on its average number of
% deaths per 100,000 for the chosen category over the chosen year range.
finalarray = zeros(4,231);
% numbering the countries in the array 1-231 in alphabetical order. (row 2)
for t = 1:231
    finalarray(2,t) = t;
end
% calculating the average for each country over the specified number of
% years and putting it into the array "finalarray." (row 3)
for i = 1:231 % i scans through all 231 countries
    % counter variable
    sum = 0;
    
    for k = 1+(i-1)*28:1+(i-1)*28+27 % k scans through only the desired year range for that country. 
        
        if FullArray{k,3} >= str2double(yi) && FullArray{k,3} <= str2double(yf)
            % adding deaths per 100,000 values within selected year range
            % for country i (1<=i<=231) for the selected category.
            sum = sum + FullArray{k,category};
        end
    end
    % dividing sum by the number of years in the user-selected range to
    % obtain the average number of deaths per 100,000 within the selected year
    % range for the selected category.
    avg = sum/(numofyears+1);
    % storing the average of country i in finalarray
    finalarray(3,i) = avg;
end
%% ranking each element
% creating a temporary array that will be sorted
temp = zeros(1,231);
% copying the row of finalarray that contains the average deaths per 100,000 values 
% for each counry for the chosen category to the temporary array
for j = 1:231
    temp(j) = finalarray(3,j);
end
% sorting temporary array
temp = sort(temp);
% matching the average average value of each element in the temporary array
% to its value in finalarray. The value's position in the temporary array
% (r (rank)) gets placed in the 4th row of finalarray with its corresponding
% average value and country number.
for r = 1:231
for g = 1:231
    if temp(r) == finalarray(3,g)
        finalarray(4,g) = r;
    end
end
end
% making finalarray a cell array in order to put in corresponding country
% names which are strings. (row 1)
finalarray = num2cell(finalarray);
% adding the countries' names to "finalarray."
for q = 1:231
    finalarray{1,q} = FullArray{q*28,1};
end

