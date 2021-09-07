clear all
close all
%Example of perceptron
%data input is in data.mat file
%load data
points = [0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1;
          1 1 1 1 0 0 0 1 1 1 1 1 1 0 0 0 1 1 1 1;
          1 1 1 1 0 0 0 1 1 1 1 1 0 0 0 1 1 1 1 1;
          1 0 0 1 1 0 0 1 1 1 1 1 0 0 0 1 0 0 0 1;
          1 1 1 1 1 0 0 0 1 1 1 1 0 0 0 1 1 1 1 1;
          1 1 1 1 1 0 0 0 1 1 1 1 1 0 0 1 1 1 1 1;
          1 1 1 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1;
          1 1 1 1 1 0 0 1 1 1 1 1 1 0 0 1 1 1 1 1;
          1 1 1 1 1 0 0 1 1 1 1 1 0 0 0 1 0 0 0 1;
          1 1 1 1 1 0 0 1 1 0 0 1 1 0 0 1 1 1 1 1];

group = [1 0 0 0 0 0 0 0 0 0;
         0 1 0 0 0 0 0 0 0 0;
         0 0 1 0 0 0 0 0 0 0;
         0 0 0 1 0 0 0 0 0 0;
         0 0 0 0 1 0 0 0 0 0;
         0 0 0 0 0 1 0 0 0 0;
         0 0 0 0 0 0 1 0 0 0;
         0 0 0 0 0 0 0 1 0 0;
         0 0 0 0 0 0 0 0 1 0;
         0 0 0 0 0 0 0 0 0 1];

p=points'
t=group'
%plotpv(p,t) %plot vector
%net = newp(minmax(p),10); %minmax will auto set min and max of p 
net = perceptron;


net.trainParam.epochs = 30;


net= train(net,p,t); %must replace net parameter

%test network with an old input
%can compare with target t
a=net(p)

