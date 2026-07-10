function [out,evm,c] = LMSEqualizer(in,preamble,constellation,numTaps,stepSize,inputDelay)

if nargin<6
    inputDelay = 0;
end

eq = comm.LinearEqualizer('Algorithm','LMS', ...
    'NumTaps',numTaps,'ReferenceTap',1,'StepSize',stepSize, ...
    'InputDelay',inputDelay,'Constellation',constellation);
[out,evm,c] = eq(in,preamble);
