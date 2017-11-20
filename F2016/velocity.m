function v = velocity(mass, init_velocity, elapsed_time, drag_coeff)
%Uses explicit formula to compute velocity
    g = 9.81; %units in m/s^2
    v = sqrt(mass*g/drag_coeff)*tanh(sqrt(g*drag_coeff/mass)*elapsed_time);
end
