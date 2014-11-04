
function p = gaussianpdf (model, x)
% This function gives out p(y|x).
% pxydf is a vector contains p(x|y) of different y
% p is p (y|x) also of different y
    p = [];
    pxydf = [];
    for i = 1:size(model.mu, 1)
        pxydf = [pxydf, singlegaupdf(model,x,i)];
    end

    %pxydf
    for i = 1:size(model.mu, 1)
        p = [p, pxydf(i) * model.phi(i) / (pxydf * model.phi)];
    end


end

