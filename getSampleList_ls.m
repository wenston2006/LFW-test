function [sampleList] = getSampleList_ls(nameSampleTxt)
% nameSampleTxt = 'image_list.txt';

fid = fopen(nameSampleTxt);
CC = textscan(fid, '%s');
fclose(fid);

sampleList = containers.Map('KeyType', 'char', 'ValueType', 'int32');

nSample = length(CC{1});
nCounts = 1 : nSample;
sampleList = containers.Map(CC{1}, nCounts);

