function predictLabels = predictFunc (model, data, against)
% model: keys of gaussian distribution model
% data : testing data
% against: classes that are considered
    p = [];
    if (isempty(who('against')))
        against = [1:size(model.mu, 1)];
    end

    for i = 1:size(data, 1)
        p = [p;[gaussianpdf(model, data(i,1:size(data, 2) - 1), against)]];
    end

    [possi, maxLabels] = max(p');

    predictLabels = [];
    for i = 1:size(data, 1)
        predictLabels = [predictLabels;against(maxLabels(i))];
    end

end
