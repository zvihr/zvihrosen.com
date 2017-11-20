%%
%Plots

%Basic line plot
X = 0:.05:2;
Y = cos(X);
plot(X,Y)
axis([-1,3,-1,3])
title('Part of cosine graph')

%Two line plots
X = 0:.05:2;
Y = cos(X);
Y2 = sin(X);
plot(X,Y,X,Y2)
axis([-1,3,-1,3])
title('Part of cosine graph')

%Alternative for multiple plots
hold on
Y3 = X.^2;
plot(X,Y3)

figure
Y4 = exp(X);
plot(X,Y4)

%With only one data set

plot(Y)

%Scatter plot
X = []; Y = [];
for i=1:50
    X = [X rand]; 
    Y = [Y rand]; 
end
plot(X,Y,'.')
plot(X,Y,'--*r')

%%Plot a matrix
Y = rand(10,3)
plot(Y)

%%
%3D Plots

%3D line plot
Z = 0:pi/50:10*pi;
Y = sin(Z);
X = cos(Z);
plot3(X,Y,Z)

%Surface in 3D
[X,Y,Z] = peaks(50);
surf(X,Y,Z)
help surf

%%
%Find information

help sqrtm
who

%%
%Interactive programming

x = input('Value of x:')
disp('This is a display')

fprintf('A few data types:%s, %f, %d',...
    'check',1.2, 5)
fprintf('More detailed float: %1.3f',1.32765)

save value x
clear 
load value

%%
%Nested loops

L = zeros(1,20);
for i=1:20
    if (i < 10)
        L(i) = i^2;
    else
        L(i) = 2*log(i)
    end
end

%%
%Sneak peek to Error
a = 0;
b = .0001
for i=1:10000
    a = a+b;
end
format long
a