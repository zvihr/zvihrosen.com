X = [0 1 2 3 4; 3 1 5 0 2];
xx = 0:.01:4;
yy = spline(X(1,:),X(2,:),xx);
plot(xx,yy,X(1,:),X(2,:))

