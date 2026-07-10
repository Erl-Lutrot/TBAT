function [delays,h] = createCIR(pathDelays,pathGains,pathPhases,sampleRate)

pd_idx = round(pathDelays*1e-6*sampleRate)+1;
pd_idx_num = accumarray(pd_idx(:),1);
h = zeros(1,2^(nextpow2(length(pd_idx_num)+1)));
for q=1:length(pd_idx_num)
    if pd_idx_num(q)>1
        aaa = pd_idx==q;
        h(q) = sum(10.^(pathGains(aaa)/20).*exp(1i*pi*pathPhases(aaa)/180));
    elseif pd_idx_num(q)==1
        aaa = pd_idx==q;
        h(q) = 10.^(pathGains(aaa)/20).*exp(1i*pi*pathPhases(aaa)/180);
    end
end

delays = 0:length(h)-1;
delays = delays/sampleRate*1e6;
