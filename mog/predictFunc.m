function predictLabels = predictFunc (model, data)
% This function is used for testing.
% model: The model trained from mixOfGaussian
% data: testing data.
    p = [];
    for i = 1:size(data, 1)
        p = [p;[gaussianpdf(model, data(i,1:size(data, 2) - 1))]];
    end

    [possi, predictLabels] = max(p');
    predictLabels = predictLabels';

end
