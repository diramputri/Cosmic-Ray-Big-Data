load('Regression Column Vectors.mat')
humiditydew = table(DewPoint, Humidity, 'VariableNames',{'Dew Point','Humidity'});
lm7 = fitlm(humiditydew,'linear')