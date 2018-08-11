function [MatchScores, NAbsent] = ComputeMatchScores(pairs, samplelist, feats, Method)
    [NSamePair,~] = size(pairs);
    MatchScores = zeros(NSamePair, 1);
    NAbsent = 0;
    for ii = 1 : NSamePair
        name1 = pairs{ii, 1};
        name2 = pairs{ii, 2};
        if isKey(samplelist, name1)
            Id1 = samplelist(name1); 
        else
            NAbsent = NAbsent + 1;
            continue;
        end;
        if isKey(samplelist, name2)
            Id2 = samplelist(name2); 
        else
            NAbsent = NAbsent + 1;
            continue;
        end;
        
        Feat1 = feats(Id1, :);
        Feat2 = feats(Id2, :);
        
        if strcmp(Method, 'zzz')
            ScoreTmp = MatchTemplate(Feat1, Feat2);
        elseif strcmp(Method, 'zzz1822')
            ScoreTmp = MatchTemplate1822(Feat1, Feat2);            
        elseif strcmp(Method, 'cos')
            ScoreTmp = ComputeCos(Feat1, Feat2);  
        elseif strcmp(Method, 'Eu')
            ScoreTmp = ComputeEuDist(Feat1, Feat2);  
        end;
        MatchScores(ii) = ScoreTmp;
    end;
    