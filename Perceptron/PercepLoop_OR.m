clear all %clear all variables
close all %close all figure
clc %clear screen

p =[0 0; 0 1; 1 0; 1 1]; %input vectors (input patterns)
t =[0 1 1 1]'; %target output
w = [-1.2 -0.5]; %initial weight according to Example2.1
b = 1; %initial bias according to Example2.1

%plot input, target, and initial weight(line wp+b =0)
%see help for plotpv and plotpc

pt = p';
tt = t';
plotpv(pt,tt)

plotpc([w(1,1) w(1,2)],b)

%create table to show result of each iteration 
head = sprintf('IterNo\t\t p\t\t y\t\t t\t\t e\t\t w11\t w12\t b');
out = sprintf('--\t\t\t--\t\t --\t\t --\t\t --\t\t %.1f \t %.1f\t %.1f',...
w(1,1),w(1,2),b);
disp(head)
disp(out)

%prepare to save result in file
fid = fopen('resultOR.txt','w+');
fprintf(fid,'IterNo\t p\t\t y\t\t t\t\t e\t\t w11\t w12\t b\n');
fprintf(fid,'--\t\t --\t\t --\t\t --\t\t --\t\t %.1f \t %.1f\t %.1f\n',...
w(1,1),w(1,2),b);
fprintf(fid,'---------------------------------------------------------------------\n');

update = 1;
iter = 0;
while update == 1
    for i = 1:4
        iter = iter+1;
        n(i,1) = w(1,1)*p(i,1) + w(1,2)*p(i,2)+ b;
        if n(i,1) >= 0
            y(i,1) = 1;
        elseif n(i,1) < 0
            y(i,1) = 0;
        end %of if
        
        e(i,1) = t(i,1)-y(i,1);
        w(1,1) = w(1,1) + e(i,1)*p(i,1);
        w(1,2) = w(1,2) + e(i,1)*p(i,2);
        b = b+e(i,1);
        
        out = sprintf('%d \t\t\t p%d \t%d \t\t%d \t\t%d \t\t %.1f \t %.1f\t %.1f',...
        iter, i, y(i,1), t(i,1), e(i,1), w(1,1),w(1,2),b);
        disp(out)
        fprintf(fid,'%d \t\t p%d \t%d \t\t%d \t\t%d \t\t %.1f \t %.1f\t %.1f\n',...
        iter, i, y(i,1), t(i,1), e(i,1), w(1,1),w(1,2),b);
    end %of for
    fprintf(fid,'---------------------------------------------------------------------\n');
    
    if any(e) == 0
    update = 0;
    end %of if
end %of while

fclose(fid);
epoch = iter/4;

%plot output of weight after training
figure
pt = p';
tt = t';
plotpv(pt,tt)
plotpc([w(1,1) w(1,2)],b)
