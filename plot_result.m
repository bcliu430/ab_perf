Array=csvread('result.csv');
NumofVM = Array(:,1);
Mean = Array(:,2);
Stdev = Array(:,3);

figure
plot(NumofVM,Mean, NumofVM, Stdev)
legend('Mean','Stdev')
saveas(gcf,'ab_on_Xen_plot.jpg')

