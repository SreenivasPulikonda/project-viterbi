%convolution encoder

function [y] = encode_block(g, x)

%receives the generator polynomial and the input bit stream to be encoded
%zero pads the input bit stream
%calls the function encode_bit
%generates the output of the convolution encoder

[n,K] = size(g);
m = K - 1;
[temp, l_info] = size(x);
state = zeros(1,m);
x = [x state];          %zero pads the input bit stream

l_total = l_info + m;

%generates the encoded output bit stream

for i = 1: l_total
    input_bit = x(1,i);
    [output_bits, state] = encode_bit(g, input_bit, state);
    y(n*(i-1) + 1:n*i) = output_bits;
end

y;              %output of the convolution encoder