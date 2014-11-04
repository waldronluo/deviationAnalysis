function results = main (dataCollectPath, anafunc, predictfunc, dataCollectfunc)

    addpath('./load/')

    %=========================
    % Collect
    %=========================

    dataFileName = 'results.mat';
    pathToData = strcat('./' , dataFileName);

    if (!dataIsCollected (pathToData))
        data = dataCollectfunc(dataCollectPath);
        model = anafunc(data);
        pls = predictfunc(model, data);
        results.model = model;
        results.pls = pls;
        results.data = data;
    else
        results = load(pathToData);
        results = results.results;
    end



    %    model
    %
        %sortrows([data(:,end), pls], 1)
        %sum([pls == data(:,end)]) / size(data, 1)

end
