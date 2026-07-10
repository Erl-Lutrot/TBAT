clear all
clc
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%edit this section

%subcarriers_selection=[ sub1, sub2, sub3, sub4];
%subcarriers_selection=[]; %allof them
%snr=200;  %[dB] so high that noise is negligable
%snr= some value
%cir=[tau1;c1];
%cir=[tau1, tau2; c1, c2];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure(1);
trra_plot_cir(cir); 

s_tx=trra_sig_ofdm();

s_chan=trra_wchannel(s_tx,cir);
s_noise=trra_add_noise(s_chan,snr);

s_rx=trra_rx_ofdm(s_noise,subcarriers_selection);

figure(2)
spc=trra_spectrum(s_tx);
trra_plot_spectrum(spc,'Tx');

figure(3)
spc=trra_spectrum(s_chan);
trra_plot_spectrum(spc,'Channel output (noiseless)');

figure(4)
spc=trra_spectrum(s_noise);
trra_plot_spectrum(spc,'Channel output (noisy)');
%trra_marker( ( [some freqs in MHz ]); %uncomment if needed

figure(5)
plot(s_rx,'o');
axis equal
axis square
grid on
title('Constellations for selected subcarriers')

