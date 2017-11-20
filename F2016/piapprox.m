function piapprox(num_points)
    percentage = 1;
    num_success = 1;
    num_failure = 0;
    plotcircle();
    hold on
    while (num_success + num_failure < num_points)
        p = [rand, rand];
        plot(p(1),p(2),'*');
        if p(1)^2 + p(2)^2 < 1
            num_success = num_success + 1;
        else
            num_failure = num_failure + 1;
        end
        percentage = num_success/(num_success + num_failure);
        piApp = 4 * percentage;
        titleString = sprintf('Approximation of Pi: %f', piApp);
        title(titleString)
        hold on
        pause(.01) 
    end
end

function plotcircle
    t = linspace(0,pi/2,100);
    x = cos(t);
    y = sin(t);
    plot(x,y,'-b');
    axis([0,1,0,1]);
end

