% Wczytanie danych z plików POMIAR (1 oraz 2 charakterystyka H; 3 oraz 4 charakterystyka E)
data_H = dlmread('POMIAR1.TXT', ';', 29, 0); % Pomijamy nagłówek
data_E = dlmread('POMIAR3.TXT', ';', 29, 0);

% Normalizacja danych
max_H = max(data_H(:, 2));
min_H = min(data_H(:, 2));
normalized_H = (data_H(:, 2) - min_H) / (max_H - min_H);

max_E = max(data_E(:, 2));
min_E = min(data_E(:, 2));
normalized_E = (data_E(:, 2) - min_E) / (max_E - min_E);

% Konwersja na skalę decybelową
dB_H = 10 * log10(normalized_H);
dB_E = 10 * log10(normalized_E);

% Konwersja czasu na kąt obrotu (zakładając 60 sekund na obrót)
% (obrót od 8 do 68 sekundy)
angle_H = ((data_H(:, 1)-8)/ 60) * 360;
angle_E = ((data_E(:, 1)-8)/ 60) * 360;

% Filtracja danych (tylko obrót 0-360°)
idx_H = angle_H <= 360;
idx_E = angle_E <= 360;

angle_H = angle_H(idx_H);
normalized_H = normalized_H(idx_H);
dB_H = dB_H(idx_H);

angle_E = angle_E(idx_E);
normalized_E = normalized_E(idx_E);
dB_E = dB_E(idx_E);

%% Wykresy dla charakterystyki H
% 1. Skala liniowa mocy (prostokątna)
figure;
plot(angle_H, normalized_H, 'b', 'LineWidth', 1.5);
title('Charakterystyka H - Skala liniowa mocy (prostokątna)');
xlabel('Kąt [°]');
ylabel('Znormalizowana moc');
grid on;

% 2. Skala liniowa mocy (biegunowa)
figure;
polarplot(deg2rad(angle_H), normalized_H, 'b', 'LineWidth', 1.5);
title('Charakterystyka H - Skala liniowa mocy (biegunowa)');

% 3. Skala liniowa natężenia pola (prostokątna)
figure;
plot(angle_H, sqrt(normalized_H), 'b', 'LineWidth', 1.5);
title('Charakterystyka H - Skala liniowa natężenia pola (prostokątna)');
xlabel('Kąt [°]');
ylabel('sqrt(moc)');
grid on;

% 4. Skala liniowa natężenia pola (biegunowa)
figure;
polarplot(deg2rad(angle_H), sqrt(normalized_H), 'b', 'LineWidth', 1.5);
title('Charakterystyka H - Skala liniowa natężenia pola (biegunowa)');

% 5. Skala decybelowa (prostokątna)
figure;
plot(angle_H, dB_H, 'b', 'LineWidth', 1.5);
title('Charakterystyka H - Skala decybelowa (prostokątna)');
xlabel('Kąt [°]');
ylabel('Poziom [dB]');
ylim([-30, 0]);
grid on;

% 6. Skala decybelowa (biegunowa)
figure;
polarplot(deg2rad(angle_H), dB_H + 30, 'b', 'LineWidth', 1.5); % Przesunięcie, aby -30 dB było na zewnątrz
title('Charakterystyka H - Skala decybelowa (biegunowa)');
rlim([0, 30]);

%% Wykresy dla charakterystyki E
% 1. Skala liniowa mocy (prostokątna)
figure;
plot(angle_E, normalized_E, 'r', 'LineWidth', 1.5);
title('Charakterystyka E - Skala liniowa mocy (prostokątna)');
xlabel('Kąt [°]');
ylabel('Znormalizowana moc');
grid on;
hold on;
plot([0, 360], [0.5, 0.5], 'k--', 'LineWidth', 1); % Zaznaczenie kierunku pręta
hold off;
legend('Charakterystyka E', 'Kierunek pręta');

% 2. Skala liniowa mocy (biegunowa)
figure;
polarplot(deg2rad(angle_E), normalized_E, 'r', 'LineWidth', 1.5);
title('Charakterystyka E - Skala liniowa mocy (biegunowa)');
hold on;
polarplot([0, deg2rad(90)], [0, 1], 'k--', 'LineWidth', 1); % Zaznaczenie kierunku pręta
hold off;
legend('Charakterystyka E', 'Kierunek pręta');

% 3. Skala liniowa natężenia pola (prostokątna)
figure;
plot(angle_E, sqrt(normalized_E), 'r', 'LineWidth', 1.5);
title('Charakterystyka E - Skala liniowa natężenia pola (prostokątna)');
xlabel('Kąt [°]');
ylabel('sqrt(moc)');
grid on;
hold on;
plot([0, 360], [0.7, 0.7], 'k--', 'LineWidth', 1); % Zaznaczenie kierunku pręta
hold off;
legend('Charakterystyka E', 'Kierunek pręta', 'Location','southeast');

% 4. Skala liniowa natężenia pola (biegunowa)
figure;
polarplot(deg2rad(angle_E), sqrt(normalized_E), 'r', 'LineWidth', 1.5);
title('Charakterystyka E - Skala liniowa natężenia pola (biegunowa)');
hold on;
polarplot([0, deg2rad(90)], [0, 1], 'k--', 'LineWidth', 1); % Zaznaczenie kierunku pręta
hold off;
legend('Charakterystyka E', 'Kierunek pręta');

% 5. Skala decybelowa (prostokątna)
figure;
plot(angle_E, dB_E, 'r', 'LineWidth', 1.5);
title('Charakterystyka E - Skala decybelowa (prostokątna)');
xlabel('Kąt [°]');
ylabel('Poziom [dB]');
ylim([-30, 0]);
grid on;
hold on;
plot([0, 360], [-15, -15], 'k--', 'LineWidth', 1); % Zaznaczenie kierunku pręta
hold off;
legend('Charakterystyka E', 'Kierunek pręta', 'Location','southeast');

% 6. Skala decybelowa (biegunowa)
figure;
polarplot(deg2rad(angle_E), dB_E + 30, 'r', 'LineWidth', 1.5); % Przesunięcie, aby -30 dB było na zewnątrz
title('Charakterystyka E - Skala decybelowa (biegunowa)');
rlim([0, 30]);
hold on;
polarplot([0, deg2rad(90)], [0, 30], 'k--', 'LineWidth', 1); % Zaznaczenie kierunku pręta
hold off;
legend('Charakterystyka E', 'Kierunek pręta');