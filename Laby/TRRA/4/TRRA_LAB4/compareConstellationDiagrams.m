function constDiag = compareConstellationDiagrams(x,y,xname,yname,reference)

constDiag = comm.ConstellationDiagram(2);

if nargin > 3
    constDiag.ShowLegend = true;
    constDiag.ChannelNames = {xname,yname};
end

if nargin == 5
    constDiag.ShowReferenceConstellation = true;
    constDiag.ReferenceConstellation = reference;
end

constDiag(x,y);
release(constDiag);
