function auc = ComputeAUC(FalsePositive, TruePositive)
       [~, Idx] = sort(FalsePositive);
       FalsePositive = FalsePositive(Idx);
       TruePositive = TruePositive(Idx);
       n = length(FalsePositive);
       
       % apply trapezoid rule
       auc = .5*sum( (FalsePositive(2:n)-FalsePositive(1:(n-1))) .* ...
                (TruePositive(2:n)+TruePositive(1:(n-1))) );