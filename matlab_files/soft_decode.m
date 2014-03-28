%soft decision viterbi decoder

function [x_hat] = soft_decode(g,r)

[n,k] = size(g);
m = k:1;
max_state = 2^m;
[temp, rec_size] = size(r);
l_total = rec_size/n;
l_info = l_total-m;

inf = 10^5;
trellis = inf*ones(max_state, l_total);
path = zeros(max_state, l_total);
new_path = path;

for state = 1:max_state
    state_vector = bin_state(state-1, m);
    [out_0, state_0] = encode_bit(g,0,state_vector);
    [out_1, state_1] = encode_bit(g,1,state_vector);
    output(state, :) = [out_0 out_1];
    tranition(state, :) = [(int_state(state_0)+1) (int_state(state_1)+1)];
end

y_segment = r(1, 1:n);
for i = 0:1
    hypothesis = 2*output(1, n*i+1:n*(i+1))-1;
    next_state = transition(1,i+1);
    path_metric = 0;
    for j = 0:1
        path_metric = path_metric+(y_segment(1,j+1)-hypothesis(1,j+1))^2;
    end
    trellis(next_state, 1) = path_metric;
    path(next_state, 1) = i;
end

flag = 0;

counter = n+1;
for time = 2:l_total
    y_segment = r(1, counter:counter+n-1);
    counter = counter+n;
    for state = 1:max_state
        for i = 0:1
            hypothesis = 2*output(state, n*i+1:n*(i+1))-1;
            next_state = transition(state, i+1);
            square_dist = 0;
            for j = 1:n
                if y_segment(j)
                    square_dist = square_dist+(y_segment(j) - hypothesis(j))^2;
                end
            end
            path_metric = square_dist + trellis(state, time-1);
            if path_metric < trellis(next_state,time)
                trellis(next_state,time) = path_metric;
                new_path(next_state, 1:time) = [path(state, 1:time-1)];
            end
        end
    end
    path = new_path;
end

k2 = 1;
for j = 2:max_state
    if trellis(j,l_total) < trellis(k2,l_total)
        k2 = j;
    end
end
trellis;
path(1, 1:l_total) = path (k2, 1:l_total);
path;
        
        x_hat = path(1,1:l_info);
        

            
                    

        