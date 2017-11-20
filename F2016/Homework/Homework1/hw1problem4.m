A = [6 4 2; 3 2 -6; 2 -2 1; -1 0 0];
B = [2 6 4; 4 -3 1; 4 2 -4; 0 -1 0];

thetaList = zeros(1,4);
cList = zeros(4,3);
magList = zeros(1,4);
for i = 1:4
    figure;
    [theta, c, mag] = dotCross(A(i,:),B(i,:));
    thetaList(i)= theta;
    cList(i,:) = c;
    magList(i) = mag;
end
thetaList
cList
magList