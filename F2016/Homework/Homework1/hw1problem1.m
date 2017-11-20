rho = (@(TC) 5.5289e-8 * TC^3 - ...
    8.5016e-6 * TC^2 + 6.5622e-5*TC + .99987)
tempsF = 32:3.6:93.2; %define the temperature vector
tempsC = (5/9)*(tempsF - 32); %convert to Celsius.
densities = arrayfun(@(t) rho(t), tempsC);
plot(tempsC,densities)
