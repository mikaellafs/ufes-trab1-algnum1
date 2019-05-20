clc;
clear all;
fprintf('QUESTAO 3\nObjetivo: O objetivo desse exercıcio é usar regress̃ao polinomial')
fprintf(' pelo método dos quadrados mínimos, para ajustar polinomios no Octave e resolver aplicações.\n\n')

disp('Os dados a seguir representam o tempo (T), em segundos, de congelamento para um certo volume (V) de uma substância.')
disp('Use a regressão para determinar um modelo para prever T como uma função de V.')
disp('Tente várias possibilidades - linear, parabólica, etc. Estime o tempo de congelamento usando 2.8 volumes.')
disp('Mostre o estudo feito para a regressão polinomial, imprimindo a tabela contento r² e σ.')
disp('Mostre, em um mesmo gráfico, os pontos da tabela e a curva do melhor ajuste')

V =[2.65, 2.65, 2.7, 2.7, 2.75, 2.75, 2.85, 2.85, 2.90, 2.90, 2.95, 2.95, 3.00, 3.00]
T =[6.85, 6.80, 6.70, 6.30, 6.33, 6.20, 5.90, 5.82, 5.80, 5.80, 6.15, 6.00, 6.30, 6.15]

fprintf('Tecle algo para continuar...\n\n')
pause;
%% Funcao que retorna variancia e coeficiente de determinação de um polinomio p, valores V
function [r2, sigma] = r2andVar(p,V,T)
  for i= 1:length(V)
    Tfit(i) = polyval(p, V(i));
  endfor
  r2 = coef_determinacao(T, Tfit);
  sigma = variancia(T, Tfit, length(p));
  
endfunction

## Obtendo tabela de variancia e coeficientes de determinação para cada polinomio
for i=1:6
  p = polyfit(V,T,i);
  [r2, sigma] = r2andVar(p, V, T);
  coefDeterminacao(i) = r2;
  variancias(i) = sigma;
endfor
disp('Testando para polinomios de grau 1 a 6')
disp('Tabela de coeficientes de determinacao e variancia para cada polinomio de grau m')
disp("")
m = [1:6];
fprintf("\nGrau| %f | %f | %f | %f | %f | %f |",1,2,3,4,5,6)
fprintf("\nr²  | %f | %f | %f | %f | %f | %f |",coefDeterminacao)
fprintf("\nvar | %f | %f | %f | %f | %f | %f |\n",variancias)
disp("")
disp('Observando a tabela, podemos concluir que o polinomio de grau 3 é o mais adequado para o ajuste,')
disp('porque apresenta um bom coeficiente de determinacao e uma boa variancia tambem, já que para o grau 4 ')
disp('a variancia aumenta, indicando que o grau 3 já é suficiente')
fprintf('Tecle algo para continuar\n\n')
pause;
%polinomio escolhido
p3 = polyfit(V,T,3);
disp('Estimando tempo para congelar 2.8 volumes')
fprintf('T = %f\n\n', polyval(p3,2.8))

disp('Tecle algo para plotar o grafico do polinomio escolhido com os pontos da tabela')
pause;
V1 = linspace(2.6,3.1,100);
for i=1:length(V1)
  Tfit(i) = polyval(p3, V1(i));
endfor

%plotando grafico de dispersao com o polinomio do ajuste
hold on
plot(V1,Tfit, 'b')
scatter(V, T, 'm')
hold off

disp("Tecle algo para continuar...")
pause;
disp("FIM DA QUESTAO!!")
clear all;
