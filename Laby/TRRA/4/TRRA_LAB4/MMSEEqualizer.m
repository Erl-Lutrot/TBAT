function [out,c] = MMSEEqualizer(in,h,snr,N)

if nargin == 4
    LF = N*2+1;
else
    LF = length(h)*2+1;
end
k0 = round(LF/2);

hAutoCorr = xcorr(h.');
r = [hAutoCorr(length(h):end,1); zeros(LF-length(h),1)];
Firr = toeplitz(r,conj(r));
Firr = Firr+1/2*10^(-snr/10)*eye(LF);

firI = zeros(LF,1);
if k0<length(h)
    firI(1:k0,1) = conj(flipud(h(1:k0,1).'));
else
	firI(k0+1-(length(h):-1:1),1) = conj(flipud(h.'));
end
c = Firr\firI;

out = conv(c,in);
out = out(((length(c)-1)/2)+1:(end-(length(c)-1)/2));
