function [center, Unow] = fcm(data, cluster_n)
    [row, col] = size(data);
    
    U = rand(row, col, cluster_n);
    dep_sum = sum(U, 3);
    dep_sum = repmat(dep_sum, [1,1, cluster_n]);
    U = U./dep_sum;

    m=2;            %weighting exponent
    epsilon=0.01;   %termination criterion
    max_iter=100;   %maximum iterations
    
    center = zeros(cluster_n,1); % 
%
    for i=1:cluster_n
        center(i,1) = sum(sum(U(:,:,i).*data))/sum(sum(U(:,:,i)));
    end

  pre_obj_fcn = 0;
  for i=1:cluster_n
    pre_obj_fcn = pre_obj_fcn + sum(sum((U(:,:,i) .*data - center(i)).^2));
  end
  
  for iter = 1:max_iter  
    Unow = zeros(size(U));
    for i=1:row
        for j=1:col
            for uII = 1:cluster_n
                tmp = 0;
                for uJJ = 1:cluster_n
                    disUp = abs(data(i,j) - center(uII));
                    disDn = abs(data(i,j) - center(uJJ));
                    tmp = tmp + (disUp/disDn).^(2/(m-1));
                end
                Unow(i,j, uII) = 1/(tmp);
 
            end            
        end
    end
    
    now_obj_fcn = 0;
    for i=1:cluster_n
        now_obj_fcn = now_obj_fcn + sum(sum((Unow(:,:,i) .*data - center(i)).^2));
    end
    
    
    if max(max(max(abs(Unow-U))))<epsilon || abs(now_obj_fcn - pre_obj_fcn)<epsilon
        break;
    else
        U = Unow.^m;
        for i=1:cluster_n
            center(i,1) = sum(sum(U(:,:,i).*data))/sum(sum(U(:,:,i)));
        end
        pre_obj_fcn = now_obj_fcn;
    end
    
    %{
    for i=1:cluster_n
        figure;
        imshow(Unow(:,:,i),[]);
    end
    %}
    
  end
 end