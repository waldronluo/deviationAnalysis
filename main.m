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

        results = [];

        for i = 1:(2^(size(model.mu, 1)) - 1) % Any classes set can be determined
            against = [];
            for j = 1:size(model.mu, 1)
               if (bitget(i, j) == 1)
                   against = [against, j];
               end
            end
            if (size(against, 2) <= 1)
                continue;
            end
            testing_data = data(sum(data(:, end) == against, 2) != 0, :);
	        pls = predictfunc(model, testing_data, against);
            against
            rr = sortrows([testing_data(:,end), pls(:,1)], 1)

            r.classes = against;
            r.comparison = rr;
            results = [results, r];
            save('12classes.mat', 'results');
            %pause
            %results.model = model;
	        %results.pls = pls;
	        %results.data = data;
        end
    else
        results = load(pathToData);
        results = results.results;
    end



    %    model
    %
        %sortrows([data(:,end), pls], 1)
        %sum([pls == data(:,end)]) / size(data, 1)

end
