clc
clear
Array=csvread('result.csv');
VCPU = Array(:,1);
ReqPerSec = Array(:,2);
Stdev = Array(:,3);

figure
plot(VCPU,ReqPerSec,VCPU, Stdev)
legend('ReqPerSec','Stdev')
saveas(gcf,'ab_perf.jpg')

