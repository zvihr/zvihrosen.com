x = 3;
seq = [x];
while (x > 1)
    if (rem(x,2) == 0)
        x = x/2;
    else
        x = 3*x + 1;
    end
    seq = [seq x];
end
disp(seq)