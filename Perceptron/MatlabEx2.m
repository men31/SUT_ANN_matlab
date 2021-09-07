clear ; clc; close;

% Call data from dataEx1.m
load dataEx2;
Pattern = X;
Target = target;


% Create a perceptron.
net = perceptron;
net = configure(net, Pattern, Target);


