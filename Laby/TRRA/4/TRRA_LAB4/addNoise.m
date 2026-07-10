function out = addNoise(in,snr)

out = awgn(in,snr,'measured');
