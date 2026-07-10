clear vars
clc
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%edit this section

%snr=200;  %[dB] so high that noise is negligable
%snr= some value
%cir=[tau1;c1];
%cir=[tau1, tau2; c1, c2];
%cir=trra_cir_multipath(carrier,[ path lengths ],[gammas]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(1);
trra_plot_cir(cir); 

s_tx=trra_sig_single();
%s_tx = trra_set_sym_dur(s_tx,  new symbol duration ); % uncomment if needed
disp(['Symbol duration [s]: ',num2str(trra_get_sym_dur(s_tx))]);

s_chan=trra_wchannel(s_tx,cir);
s_noise=trra_add_noise(s_chan,snr);

[s_rx,s_rx2]=trra_rx_single(s_noise);

figure(2)
spc=trra_spectrum(s_tx);
trra_plot_spectrum(spc,'Tx');

figure(3)
spc=trra_spectrum(s_chan);
trra_plot_spectrum(spc,'Channel output (noiseless)');

figure(4)
spc=trra_spectrum(s_noise);
trra_plot_spectrum(spc,'Channel output (noisy)');

figure(5)
plot(s_rx(100:end-100),'o');
trra_constellation_axes('Rx before amp. and phase correction')

figure(6)
plot(s_rx2(100:end-100),'ro');
trra_constellation_axes('Rx after amp. and phase correction')

