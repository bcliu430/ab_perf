Array=csvread('result.csv');
NumofVM = Array(:,1);
ReqPerSec = Array(:,2);

figure
plot(NumofVM,ReqPerSec)
saveas(gcf,'ab_on_Xen_plot.jpg')

