%%Problem 1
X = [0 2 4 6 9 11 12 15 17 19;
    5 6 7 6 9 8 8 10 12 12]

%x-regression

A = [ones(10,1) X(1,:)']
b = [X(2,:)']
beta = A'*A \ A'*b

%Plotting the data & Regression line
plot(X(1,:),X(2,:),'.')
axis([-2 20 3 15])
hold on 
plot([-2,20],[beta(1) + beta(2)*-2,
    beta(1) + beta(2)*20]);

%Std Error & Correlation computation
sr = sum((beta(1) + beta(2)*X(1,:) - X(2,:)).^2);
syx = sqrt(sr/(10-2));
st = sum((X(2,:) - mean(X(2,:))).^2);
r = ((st - sr)/st)^(1/2)

%y-regression

A = [ones(10,1) X(2,:)']
b = [X(1,:)']
beta = A'*A \ A'*b

plot(X(1,:),X(2,:),'.')
axis([-2 20 3 15])
hold on 
plot([beta(1) + beta(2)*3,
    beta(1) + beta(2)*15],[3,15])

sr = sum((beta(1) + beta(2)*X(2,:) - X(1,:)).^2);
sxy = sqrt(sr/(10-2))
st = sum((X(1,:) - mean(X(1,:))).^2);
r = ((st - sr)/st)^(1/2)


%%Problem 2

Q = @(nm,B,H,S) (1/nm)*((B*H)^(5/3)/(B+2*H)^(2/3))*sqrt(S)
% Note B = 20, H = 0.3
% nm in range (0.027,0.033)
% S  in range (0.00027,0.00033)

in = rand(2,10000);
in(1,:) = .027 + .006*in(1,:);
in(2,:) = .00027 + .00006*in(2,:);
Qdata = zeros(1,10000);
for i=1:10000
    Qdata(i) = Q(in(1,i),20,0.3,in(2,i));
end
hist(Qdata)

%%Problem 3
X = [1 2 3 4 5]';
Y = [2.2 2.8 3.6 4.5 5.5]';

A = [ones(5,1) X X.^(-1)];
b = A'*A \ A'*Y

f = @(x) b(1) + b(2)*x + b(3)*(1/x);
X2 = .8:0.05:5.2; Y2 = arrayfun(f,X2);
plot(X,Y,'.',X2,Y2)


%%Problem 4

X = [1 1 2 2 3 3]';
Y = [2 3 1 3 1 2]';
Z = [3 2 3 1 2 1]';

A = [X.^5 X.^4.*Y X.^3.*Y.^2 X.^2.*Y.^3 X.*Y.^4 Y.^5];
beta = A \ Z

func = @(x,y) ([x.^5 x.^4.*y x.^3.*y.^2 x.^2.*y.^3 x.*y.^4 y.^5]*beta)(1)

fsurf(func,[0,3.5])
hold on
plot3(X,Y,Z,'b*')
