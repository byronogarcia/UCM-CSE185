function [output, match] = template_matching_normcorr(img, template, threshold)
    
    output = img;

    shift_u = floor(size(template,1)/2);
    shift_v = floor(size(template,1)/2)
    
    %shift_u = floor(size(template,1)/2);
    %shift_v = floor(size(template,2)/2);

    %zero pad
    I1 = zeros(size(img,1)+shift_u*(2),size(img,2)+shift_v*(2));
    I1(1 + shift_u: size(I1, 1)- shift_u,1 + shift_v: size(I1, 2)- shift_v) = img;
    
    %% your code here
    for u = 1 + shift_u: size(I1, 2)- shift_u
        for v = 1 + shift_v: size(I1, 1)- shift_v
            
            x1 = u - shift_u; x2 = u + shift_u;
            y1 = v - shift_v; y2 = v + shift_v;
            patch = I1(y1:y2, x1:x2);

            % normcorr
            patch_m = mean(patch(:));
            template_m = mean(template(:));

            patch = patch(:) - patch_m;
            template = template(:) - template_m;
            patch_n = patch / (norm(patch));
            template_n = template/ (norm(template));

            value = dot(patch_n,template_n);
            %output(u - shift_u, v - shift_v) = value;
            output(v, u) = value;

        end
    end
    
    %% threshold
    match = (output > threshold);
    
end