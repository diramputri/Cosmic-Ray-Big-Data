function [fitresult, gof] = LinFits(Celsius, Count, Pascals, WindSpeed, Code, Humidity, DewPoint)
load('Regression Column Vectors.mat')

%% Initialization.

% Initialize arrays to store fits and goodness-of-fit.
fitresult = cell( 6, 1 );
gof = struct( 'sse', cell( 6, 1 ), ...
    'rsquare', [], 'dfe', [], 'adjrsquare', [], 'rmse', [] );

%% Fit: 'Count v. Temp'.
[xData, yData] = prepareCurveData( Celsius, Count );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult{1}, gof(1)] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'Count v. Temp' );
h = plot( fitresult{1}, xData, yData );
legend( h, 'Count vs. Celsius', 'Count v. Temp', 'Location', 'NorthEast' );
% Label axes
title 'Count v. Temp'
xlabel Celsius
ylabel Count

%% Fit: 'Count v. Pressure'.
[xData, yData] = prepareCurveData( Pascals, Count );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult{2}, gof(2)] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'Count v. Pressure' );
h = plot( fitresult{2}, xData, yData );
legend( h, 'Count vs. Pascals', 'Count v. Pressure', 'Location', 'NorthEast' );
% Label axes
xlabel Pascals
ylabel Count

%% Fit: 'Count v. Windspeed'.
[xData, yData] = prepareCurveData( WindSpeed, Count );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult{3}, gof(3)] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'Count v. Windspeed' );
h = plot( fitresult{3}, xData, yData );
legend( h, 'Count vs. WindSpeed', 'Count v. Windspeed', 'Location', 'NorthEast' );
% Label axes
xlabel WindSpeed
ylabel Count

%% Fit: 'Count v. Cloud Cover'.
[xData, yData] = prepareCurveData( Code, Count );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult{4}, gof(4)] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'Count v. Cloud Cover' );
h = plot( fitresult{4}, xData, yData );
legend( h, 'Count vs. Code', 'Count v. Cloud Cover', 'Location', 'NorthEast' );
% Label axes
xlabel Code
ylabel Count

%% Fit: 'Count v. Humidity'.
[xData, yData] = prepareCurveData( Humidity, Count );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult{5}, gof(5)] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'Count v. Humidity' );
h = plot( fitresult{5}, xData, yData );
legend( h, 'Count vs. Humidity', 'Count v. Humidity', 'Location', 'NorthEast' );
% Label axes
xlabel Humidity
ylabel Count

%% Fit: 'Count v. Dewpoint'.
[xData, yData] = prepareCurveData( DewPoint, Count );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult{6}, gof(6)] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'Count v. Dewpoint' );
h = plot( fitresult{6}, xData, yData );
legend( h, 'Count vs. DewPoint', 'Count v. Dewpoint', 'Location', 'NorthEast' );
% Label axes
xlabel DewPoint
ylabel Count



%create tables of muon count and _____; perform linear regression analysis
%These commands will return R2 values for the respective tables
%Muon count in response to *weather factor*
muontemp = table(Celsius, Count, 'VariableNames',{'Temperature','Muon'});
lm1 = fitlm(muontemp,'linear')
muonpressure = table(Pascals, Count, 'VariableNames',{'Pressure','Muon'});
lm2 = fitlm(muonpressure, 'linear')
muonwind = table(WindSpeed, Count, 'VariableNames',{'Windspeed','Muon'});
lm3 = fitlm(muonwind, 'linear')
muoncloud = table(Code, Count, 'VariableNames',{'CloudCover','Muon'});
lm4 = fitlm(muoncloud, 'linear')
muondew = table(DewPoint, Count, 'VariableNames',{'Dewpoint','Muon'});
lm5 = fitlm(muondew, 'linear')
muonhumidity = table(Humidity, Count, 'VariableNames',{'Humidity','Muon'});
lm6 = fitlm(muonhumidity, 'linear')

end
