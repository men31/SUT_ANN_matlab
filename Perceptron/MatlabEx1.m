clear ; clc; close;

% Call data from dataEx1.m
load dataEx1;
Pattern = X;
Target = target;


% Create a perceptron.
net = perceptron;
net = configure(net, Pattern, Target);


% Implement the wieght and bias for problem 1a, 1b, 1c.
prompt = input('Enter a, b or c : ', 's');
Promblem = checkProblem(prompt);
if Promblem == 'a'
% 1A) the wieght and bias are 0.
    net.IW{1, 1, 1} = [0, 0, 0];
    net.b{1} = [0];
elseif Promblem == 'c'
% 1B) the wieght and bias are randomized.
    net.IW{1, 1, 1} = 4*(rand(1, 3) - 0.5);
    net.b{1} = 4*(rand(1) - 0.5);
else
% 1c) the wieght and bias are selected.
    net.IW{1, 1, 1} = [-1, 0, 1];
    net.b{1} = [0.5];
end
fprintf('Initial wieght are %d, %d, %d,\n', net.IW{1, 1, 1});
fprintf('Initial bias is %d\n', net.b{1});


% Train the data.
net = train(net, Pattern, Target);


% Test the networks with the input data.
a = net(Pattern);
disp(a);
disp(Target);


% Plot input data with boundary line.
hold on
plotpv(Pattern, Target);
plotpc(net.IW{1},net.b{1});
hold off


%Sub program.
function Promblem = checkProblem(choice)
    if length(choice) == 1
        if choice == 'a' || choice == 'b' || choice == 'c' 
            Promblem = choice;
        else
            fprintf('Try again \n');
            prompt = input('Enter a, b or c : ', 's');
            Promblem = checkProblem(prompt);
        end
    else 
        fprintf('Try again \n');
        prompt = input('Enter a, b or c : ', 's');
        Promblem = checkProblem(prompt);
    end
end

