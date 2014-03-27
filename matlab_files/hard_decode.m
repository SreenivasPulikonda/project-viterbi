%hard decision viterbi decoder

function [x_hat] = hard_decode(g,r)

%receives the generator polynomial and the corrupted encoded data bit
%stream
%initializes and pdates matrices for storing the maximum path metric int
%trellis and the correspponding path
%calls the functions bin_state, encode_bit, int_state, hard_dist
%generates the output of the hard decision viterbi decoder
r = [0 1 1 0 0 0 1 0 1 1] %used to verify the theoritical working of the 
% (2 1 3) convolution encoder
[n,k] = size(g);
m = k-1;
max_state = 2^m;            % number of states
[temp, rec_size] = size(r);
l_total = rec_size/n;       %number of input bits including tail bits
l_info = l_total -m;        %number of input bits excluding tail bits

%set infinity to a small value
inf = -10;
%initializes trellis and path matrices
trellis = inf * ones(max_state, l_total);
path = zeros(max_state, l_total);
new_path = path;


for state = 1:max_state
    state_vector = bin_state(state-1, m);
    [out_0, state_0] = encode_bit(g, 0, state_vector);
    [out_1, state_1] = encode_bit(g, 1, state_vector);
    output(state, :) = [out_0 out_1];
    transition(state, :) = [(int_state(state_0)+ 1) (int_state(state_1)+ 1)];
end
    
y_segment = r(1, 1:n);
for i = 0:1
    hypothesis = output(1, n*i+1:n*(i+1));
    next_state = transition(1, i+1);
    hamming_dist = hard_dist(hypothesis, y_segment);
    path_metric = hamming_dist;
    trellis(next_state, 1) = path_metric;
    path(next_state, 1) = i;
end

counter = n+1; 
for time = 2:l_total
    y_segment = r(1, counter:counter+n-1);
    counter = counter+n;
    for state = 1:max_state
        for i = 0:1
            hypothesis = output(state, n*i+1:n*(i+1));
            next_state = transition (state, i+1);
            hamming = hard_dist(hypothesis, y_segment);
            
    path_metric = hamming +trellis(state, time-1);
    if path_metric > trellis (next_state, time)
        trellis(next_state, time) = path_metric;
        new_path(next_state, 1:time) = [path(state, 1:time-1) i];
    end
end
end
path = new_path;
end
k2 = 1;
for j = 2:max_state
    if trellis(j, l_total) > trellis(k2, l_total)
        k2 = j;
    end
end
trellis
path(1, 1:l_total) = path(k2, 1:l_total);
path
x_hat = path(1, 1:l_info)
 

    