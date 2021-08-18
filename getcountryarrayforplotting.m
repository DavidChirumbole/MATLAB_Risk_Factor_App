function array = getcountryarrayforplotting(countrynumber, categorynumber)
% Allows you to retrieve data points for all years for a selected country for
% a selected category from the large initial data array. This creates the
% array that I will use for plotting the specified country's data for the
% specified category on the standard graph (not pie chart).
FullArray = readtable('RiskFactorAnalysis.csv');
FullArray = table2cell(FullArray);
% creating a (1,28) vector. 28 refers to all 28 years that are studied for
% each country. I will be getting the value of deaths per 100,000 for the
% chosen category for the chosen country for all 28 years studied.
n = zeros(1,28);
% putting the values into n from FullArray
for i = ((countrynumber*28) - 27):(countrynumber*28)
    n(1,i - ((countrynumber*28)-28)) = FullArray{i, categorynumber};
end
% returning "n" as "array"
array = n;
