function maxVal = max_sup(R)

    [y,x] = size(R); 
    var_x = floor(3/2);
    var_y = floor(3/2);
    maxVal = zeros(size(R));

    for u = (var_y + 1):(y - var_y)
        for v = (var_x + 1):(y - var_x)

            x1 = v - var_x; x2 = v + var_x;
            y1 = u - var_y; y2 = u + var_y;

            matrix = R(y1:y2, x1:x2);
            shape = reshape(matrix, [], 1);
            mid = shape(5);
            m = max(shape);

            if(mid < m)
                maxVal(u, v) = 0;
            end

            if(mid >= m)
                maxVal(u, v) = 1;
            end
        end
    end

end