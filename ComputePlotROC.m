function [TruePositive, FalsePositive] = ComputePlotROC(SamePair_Scores, NSameAbsent,DiffPair_Scores, NDiffAbsent, fStep, BatchSize) 
    NSamePair = length(SamePair_Scores) - NSameAbsent;
    NDiffPair = length(DiffPair_Scores) - NDiffAbsent;
    
    threshold = 1:-fStep:0;
    Nthreshold = length(threshold);
    TruePositive = zeros(Nthreshold, 2);
    FalsePositive = zeros(Nthreshold, 2);
    
    blk_start_ids = 1:BatchSize:length(SamePair_Scores);
    NBatch = length(blk_start_ids);
    for ii = 1 : Nthreshold
        thresholdv = threshold(ii);
        TP = []; FP = [];
        for jj = 1 : NBatch
            blk_start = blk_start_ids(jj);
            SamePair_Thresholded = (SamePair_Scores(blk_start: blk_start + BatchSize - 1) > thresholdv);
            DiffPair_Thresholded = (DiffPair_Scores(blk_start: blk_start + BatchSize - 1) > thresholdv);
            SameInd = find(SamePair_Thresholded);
            DiffInd = find(DiffPair_Thresholded);

            TP = [TP; length(SameInd) / BatchSize]; 
            FP = [FP; length(DiffInd) / BatchSize];
        
        end;
        TruePositive(ii, 1) = mean(TP);
        TruePositive(ii, 2) = std(TP);
        FalsePositive(ii, 1) = mean(FP);
        FalsePositive(ii, 2) = std(FP);
    end;
