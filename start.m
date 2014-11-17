addpath ('./mog');
addpath ('./nb');
addpath ('./plot');

warning off;

results = main('..', @mixOfGaussian, @predictFunc, @MCDataDev);
%results
save('results.mat', 'results');

%gaussianplot3(results);
