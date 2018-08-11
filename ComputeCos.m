function [score] = ComputeCos(Feat1, Feat2)
        numer = sum(Feat1.*Feat2);
        denom = sqrt(sum(Feat1.^2)) * sqrt(sum(Feat2.^2));
        score = 0.5 * (numer / denom + 1);
        