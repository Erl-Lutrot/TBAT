function h = createCIR2(pathDelays,pathGains,pathPhases)

h = zeros(1,max(pathDelays)+1);
h(pathDelays+1) = 10.^(pathGains/20).*exp(1i*pi*pathPhases/180);
