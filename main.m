% Ćwiczenie 4 - zad. 2.1 
% Wyznaczanie parametrów T i T_0 (FODT)
% Nastawy regulatora PI k_p i T_i (IMC, SIMC)

G = FODT([5 3], [8 7], 1, 2, 0)

[k, t] = IMC(G)