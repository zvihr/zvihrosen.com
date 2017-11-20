function [inc, zrs, elapsedTime] = increment(f,a,b,n)
tic
stp = (b-a)/n; %define interval length
integers = 0:n;
pts = a + integers*stp; %list x points
vals = arrayfun(f,pts); %list y values
inc = zeros(2,0);
zrs = [];
for j=2:n
    if not(sign(vals(j)) == sign(vals(j-1)));
        if vals(j) == 0
            zrs = [zrs pts(j)];
        elseif vals(j-1) == 0
        else
            inc = [inc [[pts(j-1);pts(j)]]];
    end
end
end
elapsedTime = toc
hold on
plot(pts,vals);
s = size(inc);
t = s(2);
for i=1:t
    plot([inc(1,i),inc(1,i),inc(2,i),inc(2,i),inc(1,i)],...
        [-0.2,0.2,0.2,-0.2,-0.2],'.-r')
end
s2 = size(zrs);
for i=1:s2
    plot(zrs(i),0,'*g')
end
end