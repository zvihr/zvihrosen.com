%%Problem 2
N = [16 4 1; 4 2 1; 49 7 1];
M = [N eye(3)];
M(2,:) = M(2,:) - .25*M(1,:);
M(3,:) = M(3,:) - (49/16)*M(1,:);
M(3,:) = M(3,:) + 5.25*M(2,:);
M(1,:) = M(1,:) - 4*M(2,:);
M(3,:) = (1/1.8750)*M(3,:);
M(2,:) = M(2,:) - .75*M(3,:);
M(1,:) = (1/16)*(M(1,:) + 2*M(3,:));

%%Problem 3

A = [.8 -.4 0; -.4 .8 -.4; 0 -.4 .8];
b = [41 25 105];


%%Last problem
F = [0 1; 1 1];
v = [0 1]';

M = zeros(2,11);
for i=0:10
    M(:,i+1) = F^i*v;
end


