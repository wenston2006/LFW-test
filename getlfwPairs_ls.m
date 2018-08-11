function [same_pair, diff_pair, lfw_label] = getlfwPairs_ls(namePairTxt)
% fid = fopen('pairs.txt');
fid = fopen(namePairTxt);

CC = fscanf(fid,'%d %d');
n_set = CC(1);n_num=CC(2);

same_pair = cell(n_set*n_num,2);
diff_pair = cell(n_set*n_num,2);
lfw_label = zeros(n_set*n_num * 2,2);

for i=1:n_set
    CC = textscan(fid, '%s %d %d\n', n_num);
    for j = 1 : n_num        
        p = CC{1}(j);id1=CC{2}(j);id2=CC{3}(j);
%         same_pair((i-1)*n_num + j,1) = {sprintf('G:/face-lfw/%s/%s_%04d.jpg',p{1},p{1},id1)};
%         same_pair((i-1)*n_num + j,2) = {sprintf('G:/face-lfw/%s/%s_%04d.jpg',p{1},p{1},id2)};
        same_pair((i-1)*n_num + j,1) = {sprintf('%s_%04d.jpg',p{1},id1)};
        same_pair((i-1)*n_num + j,2) = {sprintf('%s_%04d.jpg',p{1},id2)};
        lfw_label(j,1) = id1;
        lfw_label(j,2) = id2;
    end;
    CC = textscan(fid, '%s %d %s %d\n', n_num);
    for j = 1 : n_num         
         p1 = CC{1}(j);id1=CC{2}(j);p2=CC{3}(j);id2=CC{4}(j);
%         diff_pair((i-1)*n_num + j,1) = {sprintf('G:/face-lfw/%s/%s_%04d.jpg',p1{1},p1{1},id1)};
%         diff_pair((i-1)*n_num + j,2) = {sprintf('G:/face-lfw/%s/%s_%04d.jpg',p2{1},p2{1},id2)};
        diff_pair((i-1)*n_num + j,1) = {sprintf('%s_%04d.jpg',p1{1},id1)};
        diff_pair((i-1)*n_num + j,2) = {sprintf('%s_%04d.jpg',p2{1},id2)};
        lfw_label(n_num+j,1) = id1;
        lfw_label(n_num+j,2) = id2;
    end;
end;
fclose(fid);