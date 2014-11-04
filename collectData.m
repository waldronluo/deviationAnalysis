function data = collectData (dataCollectPath)

    FcLLB = loadLLBData ('..', 'FC');
    expLLB = loadLLBData('..', 'exp');

    FcMC = loadMCData ('..', 'FC');
    expMC = loadMCData('..', 'exp');

    FcP = loadPData ('..', 'FC');
    expP = loadPData('..', 'exp');

    mean(FcMC(1).data(:,3))
    pause

    data = randi ([1, 10], 100, 2);
    data = [data ; (randi ([11, 20], 100, 2))];
    %labels = randi(2,100,1);
    labels = ones(100, 1);
    labels = [labels; ones(100, 1) + 1];
    data = [data,labels];


end
