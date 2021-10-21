close; clc; clear;

filename = 'EncodedWine_150k_all.csv';
df = readtable(filename);
y = df(:, {'points'});
x = df(:, 2:end);
y = y{:,:}';
x = x{:,:}';
%y = reshape(y, [1, size(y, 1)]);
%x = reshape(x, [size(x, 2), size(x, 1)]);


% split train and test data.
cutoff = 0.8;
[x_train, x_test, y_train, y_test] = split_train_test(x, y, cutoff);
%y_train = reshape(y_train, [1, size(y_train, 1)]);
%x_train = reshape(x_train, [size(x_train, 2), size(x_train, 1)]);

% define model.
net=feedforwardnet([20, 26]);
net.layers{1}.transferFcn = 'poslin';
net.layers{2}.transferFcn = 'poslin';
net.trainParam.epochs=1000;
net.trainParam.goal=0.0001;
net.trainParam.show=1;
%Mdl = fitrnet(x_train,y_train,"Standardize",true, "LayerSizes",[30 10])

% train
net = train(net,x_train, y_train);
view(net)

%test with test set.
output = sim(net, x_test);
fprintf(' Predict Val : %d\n', output(:, 1));
fprintf(' Actual Val : %d\n', y_test(:, 1));

% sub program for splitting the data.
function [x_train, x_test, y_train, y_test] = split_train_test(x, y, cutoff)
    num_row = size(x, 2);
    x_train = x(:, 1:num_row*cutoff);
    x_test = x(:, num_row*cutoff:end);
    y_train = y(:, 1:num_row*cutoff);
    y_test = y(:, num_row*cutoff:end);
end