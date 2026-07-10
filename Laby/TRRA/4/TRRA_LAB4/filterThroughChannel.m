function out = filterThroughChannel(h,in)

out = conv(h,in);
out = out(1:end-length(h)+1);
