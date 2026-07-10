function [out,evm,c] = RLSEqualizer(in,preamble,constellation,numTaps,forgettingFactor,inputDelay)

if nargin<6
    inputDelay = 0;
end

eq = comm.LinearEqualizer('Algorithm','RLS', ...
    'NumTaps',numTaps,'ReferenceTap',1,'ForgettingFactor',forgettingFactor, ...
    'InputDelay',inputDelay,'Constellation',constellation);
[out,evm,c] = eq(in,preamble);
