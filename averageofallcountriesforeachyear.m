function avg = averageofallcountriesforeachyear(categorynumber)
% Creates an array of the average numbers of deaths per 100,000 for the chosen category
% of all countries for each year. This will be used for plotting.
FullArray = readtable('RiskFactorAnalysis.csv');
FullArray = table2cell(FullArray);
% creating (1,28) array. 28 columns corresponding to the 28 years studied.
avg = zeros(1,28);
for i = 1:28 % going through each year 1-28 (i = 1:28)
   % creating counter variable
    sum = 0;
     
        for k = i:28:6468 % going through each country 1-231 (6468/28 = 231)for year i
            % adding deaths per 100,000 values to counter variable
          sum = sum + FullArray{k,categorynumber};  
            
        end
        % dividing the counter variable value by 231 to get the average,
        % then storing that average in the index of avg for year i (1<=i<=28)
        avg(1,i) = sum/231;
        
end
    