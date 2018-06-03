function [fitresult, gof] = createFit(Thickness, Count)
load('Thickness.mat')
load('Count.mat')

%% Fit: 'Count v. Cloud Thickness'.
[xData, yData] = prepareCurveData( Thickness, Count );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'Count v. Cloud Thickness' );
h = plot( fitresult, xData, yData );
legend( h, 'Count vs. Thickness', 'Count v. Cloud Thickness', 'Location', 'NorthEast' );
% Label axes
xlabel Thickness
ylabel Count

countthickness=table(Thickness, Count)
lm= fitlm(countthickness, 'linear')
