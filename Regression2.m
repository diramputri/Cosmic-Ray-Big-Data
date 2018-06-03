%Linear regression models for muon count with temperature, wind speed,
%and air pressure.

%Create column vectors of muon count, temperature, pressure, and windspeed
filename = 'ALL DAILY AVERAGES.xlsx';
num = xlsread(filename);
tbl= table(Count, Celsius, Pascals, WindSpeed, 'VariableNames',{'Muon','Temperature','Pressure','Windspeed'});

%create tables of muon count and _____; perform linear regression analysis
%obtain R2 values from fitlm function
muontemp = table(Count, Celsius, 'VariableNames',{'Muon','Temperature'});
lm1 = fitlm(muontemp,'linear')
muonpressure = table(Count, Pascals, 'VariableNames',{'Muon','Pressure'});
lm2 = fitlm(muonpressure, 'linear')
muonwind = table(Count, WindSpeed, 'VariableNames',{'Muon','Windspeed'});
lm3 = fitlm(muonwind, 'linear')

save('muontemp','muonpressure','muonwind','Count','Celsius','Pascals','WindSpeed');

%%%%%%%%

%Polynomial regression models for muon count with temperature, wind speed,
%and air pressure. The following three functions give the best coefficients
%for a quadratic regression.

p1 = polyfit(Count,Celsius,2) %%best quadratic fit for muon count and temperature
p2 = polyfit(Count,Pascals, 2) %%best for muon count and pressure
p3 = polyfit(Count,WindSpeed, 2) %%best for muon count and windspeed

[xData, yData] = prepareCurveData( Count, Celsius );

% Set up fittype and options.
ft = fittype( 'poly2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.567852659287788 0.426504251336355];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Fit for Muon Count and Temperature' );
h = plot( fitresult, xData, yData );
legend( h, 'Celsius vs. Count', 'Fit for Muon Count and Temperature', 'Location', 'NorthEast' );
% Label axes
xlabel Count
ylabel Celsius

%%%%%%%%%%%%%%%%%%
fitresult = cell( 2, 1 );
gof = struct( 'sse', cell( 2, 1 ), ...
    'rsquare', [], 'dfe', [], 'adjrsquare', [], 'rmse', [] );

%% Fit: 'Fit for Muon Count and Temperature'.
[xData, yData] = prepareCurveData( Count, Celsius );

% Set up fittype and options.
ft = fittype( 'poly2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.567852659287788 0.426504251336355];

% Fit model to data.
[fitresult{1}, gof(1)] = fit( xData, yData, ft, opts );


%% Fit: 'Fit for Muon Count and Pressure'.
[xData, yData] = prepareCurveData( Count, Pascals );

% Set up fittype and options.
ft = fittype( 'poly2' );

% Fit model to data.
[fitresult{2}, gof(2)] = fit( xData, yData, ft );

%%
% Initialize arrays to store fits and goodness-of-fit.
fitresult = cell( 3, 1 );
gof = struct( 'sse', cell( 3, 1 ), ...
    'rsquare', [], 'dfe', [], 'adjrsquare', [], 'rmse', [] );

%% Fit: 'Fit for Muon Count and Temperature'.
[xData, yData] = prepareCurveData( Count, Celsius );

% Set up fittype and options.
ft = fittype( 'poly2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.567852659287788 0.426504251336355];

% Fit model to data.
[fitresult{1}, gof(1)] = fit( xData, yData, ft, opts );

%% Fit: 'Fit for Muon Count and Pressure'.
[xData, yData] = prepareCurveData( Count, Pascals );

% Set up fittype and options.
ft = fittype( 'poly2' );

% Fit model to data.
[fitresult{2}, gof(2)] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'Fit for Muon Count and Pressure' );
h = plot( fitresult{2}, xData, yData );
legend( h, 'Pascals vs. Count', 'Fit for Muon Count and Pressure', 'Location', 'NorthEast' );
% Label axes
xlabel Count
ylabel Pascals

%% Fit: 'Fit for Muon Count and Windspeed'.
[xData, yData] = prepareCurveData( Count, WindSpeed );

% Set up fittype and options.
ft = fittype( 'poly2' );

% Fit model to data.
[fitresult{3}, gof(3)] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'Fit for Muon Count and Windspeed' );
h = plot( fitresult{3}, xData, yData );
legend( h, 'WindSpeed vs. Count', 'Fit for Muon Count and Windspeed', 'Location', 'NorthEast' );
% Label axes
xlabel Count
ylabel WindSpeed
