function p = plotCIR(h,sampleRate)

absh = abs(h.');
p = dsp.ArrayPlot('NumInputPorts',1,'YLimits',[0 max(absh)],'SampleIncrement',1/sampleRate*1e6,'XLabel',['Delay (' char(956) 's)']);
p(absh);
