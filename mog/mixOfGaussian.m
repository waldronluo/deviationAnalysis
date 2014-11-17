function model = mixOfGaussian (data)

dataDim = size(data, 2) - 1;
classNum = max (data(:,end));

dataLabels = data(:, end);
dataOrig = data(:, 1 : dataDim);

model.n = [];
model.phi = [];
model.mu = [];
model.cov = zeros(dataDim, dataDim, classNum);


for i = 1:classNum

    n = sum(data(:,end) == i);
    model.n = [model.n;sum(data(:,end) == i)];

    model.mu = [model.mu; mean(data(data(:,end) == i,1:dataDim))];

    model.phi = [model.phi; (sum(data(:,end)==i) + 1) / ...
    (sum(size(data, 1)) + classNum)];

    tmp = data(data(:,end) == i, 1:dataDim) .- model.mu(i,:);
    model.cov(:,:,i) = tmp' * tmp ./ size(tmp, 1);

end

end
