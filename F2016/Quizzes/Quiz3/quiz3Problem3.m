X = linspace(-2,2,500);
Y = arrayfun(@(x) (x^3 -3*x - 1), X);
plot(X,Y,X,zeros(1,500));
hold on
plot([1.3,1.3],[-3,2],'k',[0,0],[-3,2],'k')
axis([-2,2,-3,2])
text(0,0.2,'x_1')
text(1.3,0.2,'x_0')
