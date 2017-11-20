function Sumfour(n)
    for i=1:floor(n/4)
        for j = (i+1):floor(n/3)
            for k = (j+1):floor(n/2)
                for l = (k+1):(n-5)
                    if i + j + k + l == n
                        fprintf('%d + %d + %d + %d \n', i,j,k,l)
                    end
                end
            end
        end
    end
end
