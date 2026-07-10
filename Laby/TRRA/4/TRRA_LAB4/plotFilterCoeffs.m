function p = plotFilterCoeffs(c)

scale = max(max(real(c)),max(imag(c)));

p = dsp.ArrayPlot('NumInputPorts',2,'YLimits',[-scale scale],'XOffset',-ceil(length(c)/2)+1,'ChannelNames',{'real(c)','imag(c)'});
p(real(c),imag(c));
