%变量namePairTxt为LFW测试集列表地址，nameSampleTxt为样本列表地址，nameFeatsMat为所有样本特征；
%Type为计算相似度方法，'Eu'计算欧斯距离，'cos'计算cosine距离，'zzz'计算的欧式距离（仅用于keda数据）
close all; clc;
namePairTxt = 'pairs.txt';
[same_pair, diff_pair, lfw_label] = getlfwPairs_ls(namePairTxt);

nameSampleTxt = 'image_list.txt';
[sampleList] = getSampleList_ls(nameSampleTxt);%% vgg数据测试
nameFeatsMat = 'lfw_vgg_feature.mat';
load(nameFeatsMat);
Feats = caffeFeature;

fStep = 1.6667e-004;
BatchSize = 300;

% Type = 'Eu';
%计算真正率和假正率
% [TruePositive_vgg_1, FalsePositive_vgg_1] = ComputeTPandFP(same_pair, diff_pair, sampleList,Feats, Type, fStep, BatchSize);

Type = 'cos';
%计算真正率和假正率
[TruePositive_vgg_2, FalsePositive_vgg_2] = ComputeTPandFP(same_pair, diff_pair, sampleList,Feats, Type, fStep, BatchSize);
%%
% save('vgg_TP_FP.mat', 'FalsePositive_vgg_1', 'TruePositive_vgg_1', 'FalsePositive_vgg_2', 'TruePositive_vgg_2');
save('vgg_TP_FP.mat', 'FalsePositive_vgg_2', 'TruePositive_vgg_2');
disp('done!');