function polar = polarForm(x,y)
%input: x,y coming from z =  x + i*y
%ouptut: r, theta for which re^(i*theta) = z
%r has the same formula everywhere, theta has
%different values for different cases.
r = sqrt(x^2 + y^2);
if x > 0
    theta = atan(y/x);
elseif x < 0
    if y > 0
        theta = atan(y/x) + pi;
    elseif y == 0
        theta = pi;
    elseif y < 0
        theta = atan(y/x) - pi;
    end
elseif x == 0
    if y > 0
        theta = pi/2;
    elseif y == 0
        theta = 0;
    elseif y < 0
        theta = -pi/2;
    end
end
polar = [r, theta];
end

        