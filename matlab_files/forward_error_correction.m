% Forward Error Correction Technique

clear all
clc
close all
iteration = 3           %Number of Trails
N = 10000               %Number of input bits
eb_no = [2:1:7];          %signal to noise ratio
le = length(eb_no);

for kk = 1:iteration
    kk
end
% d0 = [1, 0, 1] % 3 input bits are used for verifing fec technique
% theoretically


d0 = rand(1,N);         %Generation of Random input bits of length N 
                        %used for testing fec technique practically
d0(d0 >= 0.5) = 1;
d0(d0 < 0.5) = 0;
d0;

%Standard generator polynomials for which the FEC technique is implemented
g = [1,1,1; 1,0,1] %generator polynomial for rate 1/2 m=2 conv encoder
%g = [1,0,0,1,1,1,1; 1,1,0,1,1,0,1] rate 1/2 m=6
%g = [1,1,1;1,1,1;1,0,1] rate 1/3 m=2
%g = [1,0,0,1,1,1,1,; 1,0,1,0,1,1,1;1,1,0,1,1,0,1] rate 1/3 and m=6
%convolutional coding
% tested generator polynomials for which the fec technique is implemented
%soft conv coding 

                    

        

antipodal_conv(antipodal_conv >= 1) = 1;        %conversion of encoded bits into antipodal signal

antipodal_conv(antipodal_conv <= 1) = -1;
antipodal_conv;

ltx = length(antipodal_conv);
eb_no;
es_no = eb_no + 10*log10(1/2);          %es_no is calculated depending on the convolution encoder used
no = 1./(10.^(es_no ./ 10));
for i = 1:le
    i;
                                  %generating awgn channel
no(i);
noise = sqrt(no(i) * 0.5) * randn(1,ltx);
rec_bits = antipodal_conv+noise(1:length(antipodal_conv));
%addition of noise to transmitted bits
%bit error rate calculation
out = d0-estimated_bits;
ber(:, i) = sum(abs(out)) / (N);
end
ber_it(kk, :) = ber;

avg_ber = sum(ber_it, 1) ./ (iteration)

%analytical calculations

ebn_db = [0:1:10];
ebp = 0:0.1:max(ebn_db);
ebpn = 10.^(ebp/10);
ber = Qf(sqrt(2*ebpn));
%plotting commands
figure(1)
semilogy(ebp, ber, 'k-', eb_no, avg_ber, 'r^-', 'Linewidth', 2)
title('plot of BER vs eb/no')
xlabel('eb/no')
ylabel('bit error rate')
legend('uncoded bpsk', 'code rate = 1/2 or 1/3, m = 2 or 6, hard or soft decision(standard or tested)')
axis([0 max(ebn_db) 1E-6 1])
grid

