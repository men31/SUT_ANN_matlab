prompt = input('Enter a, b or c : ', 's');
testVal(prompt);
%{
function [] = testVal(x)
    if x == 'a'
        fprintf('val is 1 \n');
    elseif x == 'b'
        fprintf('val is 2 \n');
    elseif x == 'c'
        fprintf('val is 3 \n');
    else
        fprintf('Try again \n');
        prompt = input('Enter a, b or c : ', 's');
        testVal(prompt);
    end
end
%}
function [] = testVal(x)
    if x == 'a' || x == 'b' || x == 'c' 
        fprintf('val is %s \n', x);
    else
        fprintf('Try again \n');
        prompt = input('Enter a, b or c : ', 's');
        testVal(prompt);
    end
end