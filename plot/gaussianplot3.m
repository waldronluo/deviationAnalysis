function gaussianplot3 (results)

    N = 50;

    lowerBound = 0.50;

    results.model

    classNum = size(results.model.mu, 1);

    mu = mean(results.data(:, 1:end-1));
    std = std(results.data(:, 1:end-1));
    [x, y, z] = meshgrid(...
    linspace(mu(1) - 3 * std(1), mu(1) + 3 * std(1), N), ...
    linspace(mu(2) - 3 * std(2), mu(2) + 3 * std(2), N), ...
    linspace(mu(3) - 3 * std(3), mu(3) + 3 * std(3), N));
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

    for i=1:classNum
        if (lowerBound > max(max(max(c(:,:,:,i))))) 
            max(max(max(c(:,:,:,i))))
            printf('%d is skiped because it had no larger than %f', i, lowerBound)
            continue;
        end;
        
        figure(i);
        isosurface(x,y,z,c( :, :, :, i),lowerBound);
        xlabel("X");
        ylabel("Y");
        zlabel("Z");
        hold on;
        isosurface(x,y,z,c( :, :, :, i),0.1);
        pause;
        %p = patch ("Faces", f, "Vertices", v, "FaceVertexCData", c, ...
        %                     "FaceColor", "interp", "EdgeColor", "blue");
    end
    [mu(1) - 3 * std(1), mu(1) + 3 * std(1);...
    mu(2) - 3 * std(2), mu(2) + 3 * std(2);...
    mu(3) - 3 * std(3), mu(3) + 3 * std(3)]

    printf('......Here......');
    pause

end
