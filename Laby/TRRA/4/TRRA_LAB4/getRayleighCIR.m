function [h,hInterpolated,tapDelays] = getRayleighCIR(raychan,samplesNumber)

raychan.ChannelFiltering = false;
raychan.Visualization = 'Impulse and frequency responses';
raychan.NumSamples = samplesNumber;
raychan.SamplesToDisplay = '100%';
h = raychan();

props = info(raychan);
coeffs = props.ChannelFilterCoefficients;
filtdel = props.ChannelFilterDelay;

tapDelays = -filtdel+(0:size(coeffs,2)-1);
tapDelays = tapDelays/raychan.SampleRate;

hInterpolated = h*coeffs;
