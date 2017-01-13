clc
clear
Array=csvread('result.csv');
VCPU = Array(:,1);
ReqPerSec = Array(:,2);

figure
plot(VCPU,ReqPerSec)
saveas(gcf,'ab_perf.jpg')

