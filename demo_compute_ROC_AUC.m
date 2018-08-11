% plot the ROC curve for 
load('vgg_TP_FP.mat');
h = figure();
plot(FalsePositive_vgg_2(:,1), TruePositive_vgg_2(:,1), '-r', 'LineWidth', 1);

title(['ROC curve:']); 
xlabel('FP rate');
ylabel('TP rate');
grid on; 
hleg = legend('vgg(cosine meause)',...
              'Location', 'southeast');              

%%
auc_vgg = ComputeAUC(FalsePositive_vgg_2, TruePositive_vgg_2);          %compute AUC

