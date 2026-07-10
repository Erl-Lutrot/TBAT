pathDelays=[0,2,3,5];
pathGains=[0,-3,-6,-10];
pathPhases=[0,75,64,139];
h=createCIR2(pathDelays, pathGains, pathPhases);

num = 5000;
modulation = 'QPSK';
[x, data, constellation]=generateSymbols(num, modulation);
y=filterThroughChannel(h, x);

snr=7;
yn=addNoise(y, snr);
preamble=x(1:100);
stepSize=0.001;
numTaps=10;
[z, evm1, c]=LMSEqualizer(yn, preamble, constellation, numTaps, stepSize)
plot(abs(evm1))
constDiag3=plotConstellationDiagram(z(101: end), constellation)

[ber, evm]=calculateErrors(x(101: end), z(101: end), data(101: end), modulation)