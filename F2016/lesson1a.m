mass = 68.1; %units in kilograms
init_velocity = 0; % units in m/s
elapsed_time = 12; % units in s
drag_coeff = 0.25; % units in kg/m
step1 = .1; %for the numerical approximation


display(velocity(mass, init_velocity, elapsed_time, drag_coeff))
display(approx_velocity(mass, init_velocity, elapsed_time, drag_coeff, step1))
