function[y] = hard_dist(w,p)

[r1, c1] = size(w);
[r2, c2] = size(p);
hd = 0;
if(c1 ~= c2), error('matrix sizes do not match'), end
for i = 1:c1
    if w(i) == p(i)
        hd = hd+1;
    end
end
y= hd;