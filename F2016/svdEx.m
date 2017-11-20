%%Example Diagonalization

A = [1 0 2; -2 -2 9; 1 7 5];
[V,L] = eig(A)
V*L*inv(V)

%%Non-diagonalizable matrix

A = [1 1; 0 1]
[V,L] = eig(A)

%%Compute example SVD

A = [1 0 2 4; 6 -2 -3 1; 1 7 0 -1];
[U,S,V] = svd(A)
U*U'
V*V'
U*S*V'


%%Image processing example

M = imread('grumpy.jpg','JPG');
N = rgb2gray(M);
image(N); colormap('gray');
X = double(N);
[U,S,V] = svd(X);

W = V';
T = diag(S);

n = 20;
Y = U(:,1:n)*diag(T(1:n))*W(1:n,:);
image(Y); colormap('gray');

m = 20;
n = 30;
Y = U(:,m:n)*diag(T(m:n))*W(m:n,:);
image(Y); colormap('gray');