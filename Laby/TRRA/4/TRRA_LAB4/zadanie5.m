pathDelays=[0,2,3,5];
pathGains=[0,-3,-6,-10];
pathPhases=[0,75,64,139];
h=createCIR2(pathDelays, pathGains, pathPhases);

num = 5000;
modulation = 'QPSK';
[x, data, constellation]=generateSymbols(num, modulation);
y=filterThroughChannel(h, x);
%constDiag=plotConstellationDiagram(x, constellation)
%constDiag2=plotConstellationDiagram(y, constellation)

snr=100;
yn=addNoise(y, snr);
[z, c]=MMSEEqualizer(yn, h, snr)
constDiag3=plotConstellationDiagram(z, constellation)

[ber, evm]=calculateErrors(x, z, data, modulation)