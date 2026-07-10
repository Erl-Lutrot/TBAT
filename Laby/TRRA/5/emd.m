% Wczytanie danych z pliku
data = load('emd.dat');

% Podział danych na kolumny
distance = data(:, 1);  % odległość w metrach
power_dBm = data(:, 2); % moc w dBm

% Tworzenie wykresu
figure;
semilogx(distance, power_dBm, 'b-', 'LineWidth', 1.5);

% Ustawienia osi i etykiet
xlabel('Odległość [m]', 'FontSize', 12);
ylabel('Moc [dBm]', 'FontSize', 12);
title('zmiana mocy na trasie od nadajnika do miejscowości Sanok', 'FontSize', 14);
grid on;

% Dopasowanie wyglądu
set(gca, 'FontSize', 10);

% Opcjonalnie: odwrócenie osi Y (jeśli wartości dBm są ujemne)
% set(gca, 'YDir', 'reverse');