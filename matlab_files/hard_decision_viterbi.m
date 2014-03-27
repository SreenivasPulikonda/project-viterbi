clear all
clc
close all
iteration = 3;

N = 3
eb_no = [2:1:7];
le = length(eb_no);
for kk = 1:iteration
    kk

d0 = rand(1,N);
d0(d0 >= 0.5) = 1;
d0(d0<0.5) = 0;
d0;

g = [1,1,1;1,0,1]

antipodal_conv = encode_block(g,d0);
antipodal_conv(antipodal_conv >= 1) = 1;
antipodal_conv(antipodal_conv <= 0) = -1;
a = antipodal_conv


ltx = length(antipodal_conv);

eb_no;
es_no = eb_no + 10* log10(1/2);
no = 1./(10.^(es_no./10));

for i = 1:le
    i;
    


no(i);
noise = sqrt(no(i)*0.5)*randn(1,ltx);
rec_bits = antipodal_conv + noise(1:length(antipodal_conv));

rec_bits(rec_bits<=0) = 0;
rec_bits(rec_bits >0) = 1;
rec_bits;

estimated_bits = hard_decode(g, rec_bits)

out = d0-estimated_bits;
ber(:,i) = sum(abs(out))/(N);
end

ber_it(kk,:) = ber;
end

avg_ber = sum(ber_it, 1) ./ (iteration)

ebn_db = [0:1:10];
ebp = 0:0.1:max(ebn_db);
ebpn = 10.^(ebp/10);
ber = sqrt(2*ebpn);

figure(1)
semilogy(ebp, ber, 'k-', eb_no, avg_ber, 'r^-', 'linewidth', 2)
title('plot of ber vs eb/no')
xlabel('eb/no')
ylabel('bit error rate')
legend('uncoded bpsk', 'code rate = 1/2 or 1/3, m = 2 or 6, hard-decision(standard or tested)')
axis([0 max(ebn_db) 1E-6 1])
grid

    