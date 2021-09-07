clear all
close all
clc
x = [0 0 1 1; 0 1 0 1];
t = [0 1 1 1];

plotpv(x,t)
hold on

net = perceptron;
net = configure(net,x,t);
net.IW{1,1} = [-1.2 -0.5];
%net.IW{1,1} = [0 0];
%net.b{1} = [1];

net = train(net,x,t);
view(net)
y = net(x);

plotpc(net.iw{1,1},net.b{1})

