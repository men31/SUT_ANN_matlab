%Example of perceptron
%data input is in data.mat file
load data
p=points;
t=group;
%plotpv(p,t) %plot vector
net = perceptron;
net = configure(net,p,t);
net= train(net,p,t); %must replace net parameter

%test network with the train input
%can compare with target t
a=net(p)
t

figure
% test with new input
tn1=[-2;-3];
an1=net(tn1)
plotpv(tn1,an1);
point = findobj(gca,'type','line');
point.Color = 'red';

hold on
plotpv(p,t);
plotpc(net.IW{1},net.b{1});
hold off
