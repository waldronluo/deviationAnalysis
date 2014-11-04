function cases = loadMCData ( rootPath, casesBeginWith )

    cases = [];
    casesPath = ls (rootPath);

    for i = 1:size(casesPath, 1)
        caseName = casesPath(i, :);
        if (strncmp(caseName, casesBeginWith, size(casesBeginWith, 2)))
            
            fx = load (strcat (rootPath, '/', caseName, '/', 'Composites', '/', 'Composites_Fx.mat'));
            fy = load (strcat (rootPath, '/', caseName, '/', 'Composites', '/', 'Composites_Fy.mat'));
            fz = load (strcat (rootPath, '/', caseName, '/', 'Composites', '/', 'Composites_Fz.mat'));
            mx = load (strcat (rootPath, '/', caseName, '/', 'Composites', '/', 'Composites_Mx.mat'));
            my = load (strcat (rootPath, '/', caseName, '/', 'Composites', '/', 'Composites_My.mat'));
            mz = load (strcat (rootPath, '/', caseName, '/', 'Composites', '/', 'Composites_Mz.mat'));
            if( size(mz.data) == [0, 0])
                caseName
            end
            State.data = load (strcat (rootPath, '/', caseName, '/', 'State.dat'));
            Name.data = caseName;
            cases = [cases; fx fy fz mx my mz State Name];
        end
    end
    

end
