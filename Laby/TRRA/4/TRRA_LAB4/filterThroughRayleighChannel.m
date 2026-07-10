function [out,delay] = filterThroughRayleighChannel(raychan,in)

raychan.ChannelFiltering = true;
raychan.Visualization = 'Off';

out = raychan(in);

delay = finddelay(x,y);
