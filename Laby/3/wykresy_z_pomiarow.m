% Wczytaj plik s1p
S = sparameters('gruba.s1p');

% Ekstrakcja częstotliwości (w Hz)
freq = S.Frequencies;

% Ekstrakcja parametru S11
S11 = rfparam(S, 1, 1);

% Przeliczenie do dB
S11_dB = 20*log10(abs(S11));

% Rysowanie wykresu
figure;
plot(freq/1e9, S11_dB, 'LineWidth', 1.5);
grid on;
xlabel('Częstotliwość [GHz]');
ylabel('|S_{11}| [dB]');
title('Charakterystyka |S_{11}| w funkcji częstotliwości');