pathDelays=[0,100,120,250];
pathGains=[0,-3,-6,-10];
pathPhases=[0,90,180,0];
sampleRate=1e5;
[~, h]=createCIR(pathDelays, pathGains, pathPhases, sampleRate);
p=plotCIR(h, sampleRate)
H=fft(h,512);
s=plotSpectrum(H, sampleRate)