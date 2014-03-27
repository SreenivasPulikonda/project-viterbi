function [output, state] = encode_bit(g, input, state)

%receives the generator polynomial, the input bit to be encoded and input state bits
%generates the encoded output bits corresponding to the input it and the
%input state bits
%generates the next state bits corresponding to th einput bit and input
%state bits

[n,k] =  size(g); 
m = k-1;

for i = 1:n
    output(i) = g(i,1)*input;
    for j = 2:k
        output(i) = xor(output(i), g(i,j) * state(j-1));
    end;
end

state = [input, state(1:m-1)];

%generates the next state corresponding to the input bit and the previous state
