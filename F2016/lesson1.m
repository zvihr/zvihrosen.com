mass = 68.1; %units in kilograms
init_velocity = 0; % units in m/s
elapsed_time = 12; % units in s
drag_coeff = 0.25; % units in kg/m
step1 = .1; %for the numerical approximation
step2 = 2;

times1 = [0:.1:12];
times2 = [0:1:12];
approx1 = arrayfun(@(time) (approx_velocity(mass, init_velocity, time, drag_coeff, step1)), times2);
approx2 = arrayfun(@(time) (approx_velocity(mass, init_velocity, time, drag_coeff, step2)), times2);
exact = arrayfun(@(time) (velocity(mass, init_velocity, time, drag_coeff)), times1);
plot(times2, approx1,'go', times2, approx2,'r*',times1,exact,'-b')
title('Actual Velocity with Numerical Approximations')
xlabel('Time (s)')
ylabel('Velocity (m/s)')
legend('Step Size .1', 'Step Size 2', 'Actual','Location','east')
grid