function fibonacci(n)
    memory = 1;
    now = 1;
    fprintf('%d, %d, ', memory,now);
    while now < n 
        fprintf('%d, ', now)
        temp = memory + now;
        memory = now;
        now = temp;
    end
end

    