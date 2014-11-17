function gaussianplot3 (results)
    printf('In plot program now\n');

    N = 50;

    stdPoss = 0.6826;

    classNum = size(results.model.mu, 1);

    mu = mean(results.data(:, 1:end-1));
    std = std(results.data(:, 1:end-1));
    [x, y, z] = meshgrid(...
    linspace(mu(1) - 3 * std(1), mu(1) + 3 * std(1), N), ...
    linspace(mu(2) - 3 * std(2), mu(2) + 3 * std(2), N), ...
    linspace(mu(3) - 3 * std(3), mu(3) + 3 * std(3), N));

    results.model.mu
    [mu(1) - 3 * std(1), mu(1) + 3 * std(1); ...
    mu(2) - 3 * std(2), mu(2) + 3 * std(2); ...
    mu(3) - 3 * std(3), mu(3) + 3 * std(3)]

    printf('Begin to computer c\n');


    c = zeros(N, N, N, classNum);
    for i = 1:N
        for j = 1:N
            for k = 1:N
                tmpCase = [x(i,j,k), y(i,j,k), z(i,j,k)];
                for l = 1:classNum
                    c(i,j,k,l) = singlegaupdf(results.model, tmpCase, l);% P(exMyR, exMzR, exFxA | y) 
                end
            end
        end
    end
    printf('Finished computation of c.\n');

    save('c.mat', 'c', 'x', 'y', 'z');

    for i=1:classNum

        a = high2low (c(:,:,:,i));
        S = sort (a, 'descend');
        S = S / sum(S);
        pSum = 0;
        for j = 1:size(a,2)
            pSum += S(j);
            if (pSum >= stdPoss)
                break;
            end
        end
        printf('Finished computation of surface possibility in the %d cases.\n', i);

        figure(i);
        S(j) * sum(S)
        isosurface(x,y,z,c( :, :, :, i), S(j) * sum(S));
        xlabel("X");
        ylabel("Y");
        zlabel("Z");
        hold on;
        %p = patch ("Faces", f, "Vertices", v, "FaceVertexCData", c, ...
        %                     "FaceColor", "interp", "EdgeColor", "blue");
    end
    [mu(1) - 3 * std(1), mu(1) + 3 * std(1);...
    mu(2) - 3 * std(2), mu(2) + 3 * std(2);...
    mu(3) - 3 * std(3), mu(3) + 3 * std(3)]

    printf('......Here......');
    pause

end
