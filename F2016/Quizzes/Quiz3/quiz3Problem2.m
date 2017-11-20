X = linspace(-5,5,500);
Y = arrayfun(@(x) (x^2-1)*exp(-x^2), X);
plot(X,Y,X,zeros(1,500));
set(gca,'XTick',[-5,-4,-3,-2,-1,0,1,2,3,4,5])