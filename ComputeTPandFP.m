function [TruePositive, FalsePositive] = ComputeTPandFP(same_pair, diff_pair, sampleList, Feats, Type, fStep, BatchSize)
% Type = 'zzz';
% Type = 'cos';
% Type = 'Eu';
% fStep = 0.02;
% BatchSize = 300;

[SamePair_Scores, NSameAbsent] = ComputeMatchScores(same_pair, sampleList, Feats, Type);
[DiffPair_Scores, NDiffAbsent] = ComputeMatchScores(diff_pair, sampleList, Feats, Type);

if ~strcmp(Type, 'Eu')
    [TruePositive, FalsePositive] = ComputePlotROC(SamePair_Scores, NSameAbsent,DiffPair_Scores, NDiffAbsent, fStep, BatchSize);
else
    [TruePositive, FalsePositive] = ComputePlotROCEU(SamePair_Scores, NSameAbsent,DiffPair_Scores, NDiffAbsent, fStep, BatchSize);
end;
