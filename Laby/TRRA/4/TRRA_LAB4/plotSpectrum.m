function s = plotSpectrum(spectrum,sampleRate,symbolRate)

sp = 20*log10(abs(fftshift((spectrum.')/max(abs(spectrum)))));

s = dsp.SpectrumAnalyzer('InputDomain','Frequency',...
    'SampleRate',sampleRate,'YLabel','Amplitude (dB)',...
    'YLimits',[-20 0]);

if nargin == 3
    df = sampleRate/length(sp);
    freq = -sampleRate/2:df:sampleRate/2-df;
    sps = sampleRate/symbolRate;
    num = round(length(spectrum)/sps);
    sp = sp(round(length(spectrum)/2)+1-num:round(length(spectrum)/2)+1+num);
    freq = freq(round(length(spectrum)/2)+1-num:round(length(spectrum)/2)+1+num);
    s.FrequencyVectorSource = 'Property';
    s.FrequencyVector = freq;
end

step(s,sp);
