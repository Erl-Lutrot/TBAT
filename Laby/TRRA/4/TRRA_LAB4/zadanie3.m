pathDelays=[0,2,3,5];
pathGains=[0,-3,-6,-10];
pathPhases=[0,75,64,139];
h=createCIR2(pathDelays, pathGains, pathPhases);

num = 5000;
modulation = 'QPSK';
[x, data, constellation]=generateSymbols(num, modulation);
y=filterThroughChannel(h, x);
constDiag=plotConstellationDiagram(x, constellation)
constDiag2=plotConstellationDiagram(y, constellation)

out=addNoise(y, 20);
constDiag3=plotConstellationDiagram(out, constellation)