function ProgrammingProject(app)
% runs the app that I will create for my project. Controls graphs, displays
% and all other GUI elements. This function also calls other functions.
%% Getting all the necessary arrays and variables to run all of the GUI elements
% loading full excel file
FullArray = readtable('RiskFactorAnalysis.csv');
% turning full excel file into a cell array
FullArray = table2cell(FullArray);
% getting the average deaths per 100,000 for all countries for the chosen
% category over the selected year range. The averages are then ranked from
% 1 to 231. The country name, country number, average deaths per 100,000
% for the selected category over the selected year range, and rank of
% average make up the 4 rows of the avg array. The 231 columns correspond
% to the 231 countries. 
avg = averageofcountryforcertainrangeofyears(app.RankDropDown1.Value,app.RankDropDown2.Value,categorytonumber(app.CategoryDropDown.Value));
% converts the string name of a country to its
% corresponding number (Ex. 'Afghanistan' becomes 1. This is because it is
% the 1st country in the original excel file.)
countrynumber = countrytonumber(app.ChooseCountryDropDown.Value);
% Converts the string name of a category to its corresponding row number in
% the original excel file (Ex. 'Obesity Deaths' becomes 5. This is because
% obesity death data is found in column 5 of the original excel file.)
categorynumber = categorytonumber(app.CategoryDropDown.Value);
% the averageofallcountriesforeachyear function outputs an array that is
% used for plotting the average in the standard graph (not pie chart)
% visualization.
averageplotarray = averageofallcountriesforeachyear(categorytonumber(app.CategoryDropDown.Value));
% Creating a simple (1,28) year array with all years listed chronologically
% 1990-2017. This will be used for the x-axis on the standard graph.
yeararray = zeros(1,28);
for i = 1990:2017
    yeararray(i-1989) = i;
end
%% Plotting (graph) depending on the status of include average the check box
% plot includes average
if app.IncludeAverageCheckBox.Value == 1
    plot(app.PlotAxes,yeararray, getcountryarrayforplotting(countrynumber,categorynumber),'r-', yeararray, averageplotarray, 'b-');
    legend(app.PlotAxes, app.ChooseCountryDropDown.Value, 'Average','location','best')
    title(app.PlotAxes, '')
 % plot does not include average
else
    plot(app.PlotAxes,yeararray, getcountryarrayforplotting(countrynumber,categorynumber),'r-');
    legend(app.PlotAxes, app.ChooseCountryDropDown.Value,'location','best')
    title(app.PlotAxes, '')
end

%% Retrieving the rank of the chosen country between the user specified range of years from the avg array
% this displays the country's rank in the ranking system part of the GUI.
% rankings are decided by the average of the country's deaths per 100,000
% for the chosen category over the selected year range. The
% averageofcountryforcertainnumberofyears function calculates the averages
% of all countries over the chosen year range for the chosen category.
for j = 1:231
    if strcmp(app.ChooseCountryDropDown.Value, avg{1,j})
        app.RankLabel.Text = num2str(avg{4,j});
    end
end
%% Plotting the Data in the 3-D pie chart
% explode causes the pieces of the pie chart to separate to increase visual
% clarity.
explode = [1,1,1,1];
% the piechartarrayfunction returns an array of the average percentage of
% the total deaths a particular risk factor accounts for over the chosen
% year range for the chosen country.
piechartarray1 = piechartarray(countrynumber,str2double(app.PieChartYearOneDropDown.Value), str2double(app.PieChartYearTwoDropDown.Value));
% creating the pie chart, giving it a title, and giving it a legend.
pie3(app.PieChartAxes,piechartarray1,explode)
legend(app.PieChartAxes,'Drug','Obesity','Alcohol','Smoking')
title(app.PieChartAxes,'');
%% Setting the Values of Certain Elements based on user input
% These labels help to clarify what is being displayed in the GUI. They
% help to clarify what is going on for the user. They don't serve any other
% function than this.
app.CountryNameLabel.Text = app.ChooseCountryDropDown.Value;
app.CountryNameLabel_2.Text = app.ChooseCountryDropDown.Value;
app.CategoryLabel.Text = app.CategoryDropDown.Value;
app.CountryLabel.Text = app.ChooseCountryDropDown.Value;
app.CategoryLabel_2.Text = app.CategoryDropDown.Value;
app.CategoryLabel_3.Text = app.CategoryDropDown.Value;

