function data = MCDataDevNB (dataCollectPath)
%  Struct: data1, data2, data3 ... dataN, label

    FcLLB = loadLLBData ('..', 'FC');
    expLLB = loadLLBData('..', 'exp');

    FcMC = loadMCData ('..', 'FC');
    expMC = loadMCData('..', 'exp');

    FcP = loadPData ('..', 'FC');
    expP = loadPData('..', 'exp');

    labels = [];
    data = [];

    for i = 1:size(FcMC, 1)
        %====================================
        % Determine class
        %====================================
        labelNum = 0;
        if (strfind(FcMC(i,end).data, '+x'))
            labelNum = labelNum + 1 * 2^0;
        end
        if (strfind(FcMC(i,end).data, '+y'))
            labelNum = labelNum + 1 * 2^1;
        end
        if (strfind(FcMC(i,end).data, '-y'))
            labelNum = labelNum + 1 * 2^2;
        end
        if (strfind(FcMC(i,end).data, '+0'))
            labelNum = labelNum + 1 * 2^3;
        end
        if (strfind(FcMC(i,end).data, '-0'))
            labelNum = labelNum + 1 * 2^4;
        end

        %====================================
        % Make it sequence
        %====================================

        if (labelNum == 1) labelNum = 1;
        elseif (labelNum == 2) labelNum = 2;
        elseif (labelNum == 3) labelNum = 4;
        elseif (labelNum == 4) labelNum = 2;
        elseif (labelNum == 5) labelNum = 4;
        elseif (labelNum == 8) labelNum = 3;
        elseif (labelNum == 9) labelNum = 5;
        elseif (labelNum == 10) labelNum = 6;
        elseif (labelNum == 11) labelNum = 7;
        elseif (labelNum == 12) labelNum = 6;
        elseif (labelNum == 16) labelNum = 3;
        elseif (labelNum == 17) labelNum = 5; end;

        %====================================

        %====================================
        % Determine the start and end time
        % of Rotation State
        %====================================
        startTime = 0;
        endTime = 0;
        if (size(FcMC(i, 7).data, 1) == 2)
            startTime = FcMC(i, 7).data(2);
            endTime = FcMC(i, 1).data(end, 11);
        elseif (size(FcMC(i, 7).data, 1) >= 3)
            startTime = FcMC(i, 7).data(2);
            endTime = FcMC(i, 7).data(3);
        else
            '?'
            %never reach here.
        end
        %====================================
        % MzR: The whole rotation state.
        %====================================
        MzR = mean(FcMC(i, 6).data( ... % select rotation states
        FcMC(i,6).data(:, 11) >= startTime & FcMC(i,6).data(:,8) <= endTime ...
        ,5));

        %====================================
        % Determine the start and end time
        % of MyR
        %====================================
        startTime = 0;
        endTime = 0;
        if (size(FcMC(i, 7).data, 1) == 2)
            startTime = FcMC(i, 7).data(2);
            endTime = FcMC(i, 1).data(end, 11);
        elseif (size(FcMC(i, 7).data, 1) >= 3)
            startTime = FcMC(i, 7).data(2);
            endTime = FcMC(i, 7).data(3);
        else
            '?'
            %never reach here.
        end

        endTime = (startTime + endTime) / 2;

        %====================================
        %MyR
        %====================================
        MyR = mean(FcMC(i, 5).data( ... % select rotation states
        FcMC(i,5).data(:, 11) >= startTime & FcMC(i,5).data(:,8) <= endTime ...
        ,3));

        %====================================
        % Determine the start and end time
        % of FxA
        %====================================
        startTime = FcMC(i, 7).data(1);
        endTime = FcMC(i, 7).data(2);
        startTime = (startTime + endTime) * 2 / 3;

        %====================================
        %FxA
        %====================================
        FxA = mean(FcMC(i, 1).data( ... % select rotation states
        FcMC(i,1).data(:, 11) >= startTime & FcMC(i, 1).data(:,8) <= endTime ...
        ,3));

        if (!(isnan (MzR) | isnan (MyR) | isnan (FxA)))
            data = [data;MyR, MzR, FxA, labelNum];
        else
            FcMC(i,7).data
        end
    end

end
