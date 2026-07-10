function constDiag = plotConstellationDiagram(symbols,reference,name)

constDiag = comm.ConstellationDiagram(1, ...
    'ReferenceConstellation',reference);

if nargin == 3
    constDiag.ShowLegend = true;
    constDiag.ChannelNames = {name};
end

constDiag(symbols);
release(constDiag);
