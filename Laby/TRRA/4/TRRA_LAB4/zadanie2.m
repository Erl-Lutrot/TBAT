pathDelays=[0,100,120,250];
avgPathGains=[0,-3,-6,-10];
dopplerShift=150;
sampleRate=1e5;
samplesNumber=1e6;
rayleighchan=createRayleighChannel(pathDelays, avgPathGains, dopplerShift, sampleRate);
[h, hInterpolated, tapDelays]=getRayleighCIR(rayleighchan, samplesNumber)