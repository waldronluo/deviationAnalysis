%=========================================================
% This is a demo.
% Calling main() function to analyze the signal data
% There are five parameters of 'main', which is the main
% function for analyzing data.
% The five parameters are:
% '..' : The path of the data source
% mixOfGaussian: The training function
% predictfunc: Tne testing function
% MCDataDev: The function used for collecting data.
% For example, here MCDataDev specifically used to collect
% exemplars.

addpath ('./mog');
addpath ('./nb');
addpath ('./plot');

warning off;

results = main('..', @mixOfGaussian, @predictFunc, @MCDataDev);
save('results.mat', 'results');

gaussianplot3(results);
