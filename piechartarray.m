function categorypercentagearray = piechartarray(countrynumber,year1,year2)
% creates the vector that will be used for the pie chart
FullArray = readtable('RiskFactorAnalysis.csv');
FullArray = table2cell(FullArray);
yearnumber1 = year1 - 1989;
yearnumber2 = year2 - 1989;
% creating initial (5,28) array. Each of the rows (2-4) corresponds to one of
% the 4 studied risk factors. The 1st row corresponds to total deaths and
% will be used to calculate average percentages. The 28 columns correspond
% to the 28 years studied.
n = zeros(5,28);
% filling the n array with total deaths, obesity deaths, drug deaths,
% alcohol deaths, and smoking deaths for each year (1-28) for the country that was selected by the user. 
%(These correspond to j = 4:8 becasue these risk factors (including total deaths) are in
% columns 4-8 respectively in FullArray.)
for j = 4:8
for i = ((countrynumber*28) - 27):(countrynumber*28)
    n(j-3,i - ((countrynumber*28)-28)) = FullArray{i, j};
end
end
% creating the final (1,4) array which will store the average percentages of
% total deaths that come from the 4 studied risk factors(obesity deaths, drug deaths,
% alcohol deaths, and smoking deaths) for the user-selected country
categorypercentagearray = zeros(1,4);

% calculating averages of percentages for years in the studied range and
% storing them in categorypercentagearray.
for j = 2:5
    sumofpercentages = 0; % counter variable
    for i = yearnumber1:yearnumber2
        % adding up each percentage for the certain risk factor (j) for each
        % year (i). This sum is stored in sumofpercentages.
        sumofpercentages = sumofpercentages + n(j,i)/n(1,i);
    end
    % dividing sumofpercentages by number of years in the user-selected
    % year range to get the average percentage over those years. This
    % average value is then stored in categorypercentagearray.
    categorypercentagearray(1,j-1) = sumofpercentages/(yearnumber2-yearnumber1 + 1);
end
% switching position of middle two indicies in the array for visual clarity
% in pie chart
p = categorypercentagearray(1,2);
categorypercentagearray(1,2) = categorypercentagearray(1,1);
categorypercentagearray(1,1) = p;