%����namePairTxtΪLFW���Լ��б��ַ��nameSampleTxtΪ�����б��ַ��nameFeatsMatΪ��������������
%TypeΪ�������ƶȷ�����'Eu'����ŷ˹���룬'cos'����cosine���룬'zzz'�����ŷʽ���루������keda���ݣ�
close all; clc;
namePairTxt = 'pairs.txt';
[same_pair, diff_pair, lfw_label] = getlfwPairs_ls(namePairTxt);

nameSampleTxt = 'image_list.txt';
[sampleList] = getSampleList_ls(nameSampleTxt);%% vgg���ݲ���
nameFeatsMat = 'lfw_vgg_feature.mat';
load(nameFeatsMat);
Feats = caffeFeature;

fStep = 1.6667e-004;
BatchSize = 300;

% Type = 'Eu';
%���������ʺͼ�����
% [TruePositive_vgg_1, FalsePositive_vgg_1] = ComputeTPandFP(same_pair, diff_pair, sampleList,Feats, Type, fStep, BatchSize);

Type = 'cos';
%���������ʺͼ�����
[TruePositive_vgg_2, FalsePositive_vgg_2] = ComputeTPandFP(same_pair, diff_pair, sampleList,Feats, Type, fStep, BatchSize);
%%
% save('vgg_TP_FP.mat', 'FalsePositive_vgg_1', 'TruePositive_vgg_1', 'FalsePositive_vgg_2', 'TruePositive_vgg_2');
save('vgg_TP_FP.mat', 'FalsePositive_vgg_2', 'TruePositive_vgg_2');
disp('done!');