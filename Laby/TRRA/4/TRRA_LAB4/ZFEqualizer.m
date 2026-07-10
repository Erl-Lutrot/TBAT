function [out,c] = ZFEqualizer(in,h,N)

if nargin == 3
    LF = N*2+1;
else
    LF = length(in)*2+1;
end
k0 = round(LF/2);
qF = LF-1;

HH = zeros(LF);
Mz = zeros(LF,1);
Mz(round(LF/2)) = 1;

for q=0:qF
    for p=0:qF
        idx = k0-qF/2+q-p;
        if idx>=1 && idx<=length(h)
            HH(q+1,p+1) = h(idx);
        end
    end
end
c = HH\Mz;

out = conv(c,in);
out = out(((length(c)-1)/2)+1:(end-(length(c)-1)/2));
