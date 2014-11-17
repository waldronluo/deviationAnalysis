
function p = gaussianpdf (model, x, against)
% This function gives out p(y|x).
% pxydf is p(x|y)
% p is p (y|x)

    p = [];
    pxydf = [];
    for i = 1:size(model.mu, 1)
        pxydf = [pxydf, singlegaupdf(model,x,i)];
    end

    %pxydf
    for i = 1:size(against, 2)
        p = [p, pxydf(against(i)) * model.phi(against(i)) / (pxydf(against) * model.phi(against))];
    end

end

