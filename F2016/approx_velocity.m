function v = approx_velocity(mass, init_velocity, elapsed_time, drag_coeff, step)
%Uses Euler's method with step size "step" to approximate velocity
%given the defining differential equation.
    g = 9.81; %units in m/s^2
    v = init_velocity;
    t = 0;
    h = step;
    while t < elapsed_time
        if t + step > elapsed_time, h = elapsed_time - t; end
        v = v + (g - (drag_coeff/mass)*v^2) * h;
        t = t + h;
    end
end