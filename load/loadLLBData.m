function cases = loadLLBData ( rootPath, casesBeginWith )

    cases = [];
    casesPath = ls (rootPath);

    for i = 1:size(casesPath, 1)
        caseName = casesPath(i, :);
        if (strncmp(caseName, casesBeginWith, size(casesBeginWith, 2)))
            
            fx = load (strcat (rootPath, '/', caseName, '/', 'llBehaviors', '/', 'llBehaviors_Fx.mat'));
            fy = load (strcat (rootPath, '/', caseName, '/', 'llBehaviors', '/', 'llBehaviors_Fy.mat'));
            fz = load (strcat (rootPath, '/', caseName, '/', 'llBehaviors', '/', 'llBehaviors_Fz.mat'));
            mx = load (strcat (rootPath, '/', caseName, '/', 'llBehaviors', '/', 'llBehaviors_Mx.mat'));
            my = load (strcat (rootPath, '/', caseName, '/', 'llBehaviors', '/', 'llBehaviors_My.mat'));
            mz = load (strcat (rootPath, '/', caseName, '/', 'llBehaviors', '/', 'llBehaviors_Mz.mat'));
            State.data = load (strcat (rootPath, '/', caseName, '/', 'State.dat'));
            Name.data = caseName;
            cases = [cases; fx fy fz mx my mz State Name];
        end
    end
    

end
