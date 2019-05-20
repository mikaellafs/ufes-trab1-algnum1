clc;
clear all;
fprintf('QUESTAO 4\nObjetivo: O objetivo desse exercıcio é usar ajuste nao-linear')
fprintf(' pelo método dos quadrados mínimos, para ajustar polinomios no Octave e resolver aplicações.\n\n')

disp('Vamos utilizar dois modelos de Michaelis-Menten [1] para analisar o crescimento de uma bactéria v com uma função ')
disp('da concentração de oxigenio[S], descritos pelas equações:')
disp('Caso 1: v = vm*[S]/(ks + [S])')
disp('Caso 2: v = vm*[S]^2/(ks^2 + [S]^2)')
disp('onde vm é o crescimento máximo da bactéria e ks é a constante representando a metade do crescimento máximo.')
fprintf('\n\nUse o método dos quadrados mínimos para ajustar os dados da tabela abaixo com versões linearizadas ')
fprintf('das equações (1) e (2). Além de estimar os parâmetros dos modelos, avalie a qualidade dos ajustes através ')
fprintf('de medidas estatisticas e gráficos dos ajustes.\n\n')

S = [1.3, 1.8, 3, 4.5, 6, 8, 9]
v = [0.07, 0.13, 0.22, 0.275, 0.335, 0.35, 0.36]

################# LETRA A #################################
fprintf('\na) Determine os coeficientes dos ajustes e recupere as equações dos modelos originais. Estime a taxa de crescimento em [S] = 7.\n')
disp('Tecle algo para continuar...')
pause;
% CASO 1
fprintf('\nCASO 1:\nLinearizando: z = 1/v \n=> z = (ks + [S])/(vm*[S])\n=> z = ks/(vm*[S]) + 1/vm = a2*1/[S] + a1\nem que a2 = ks/vm e a1 = 1/vm e g2([S])= 1/[S] e g1([S]) = 1\n\n')
disp('Tecle algo para seguir para o calculo dos coeficientes...')
pause;
disp('Devemos adaptar a tabela para z:')
S = [1.3, 1.8, 3, 4.5, 6, 8, 9]
z = [v.^(-1)]

Metodo_dos_quadrados_minimos = ['Σg1g1 *a1 +  ', 'Σg1g2 *a2', '  = Σzg1';'Σg2g1 *a1 +  ', 'Σg2g2 *a2', '  = Σz*g2']
tam = length(S);
C = [sum(linspace(1,1,tam)), sum(S.^(-1)); sum(S.^(-1)), sum(S.^(-2))]; %% matriz dos coeficientes
r21 = 0;
for i=1:tam
  r21 = r21 + z(i)/S(i);
endfor
R = [sum(z); r21];

%% Resolvendo a = C\R
result1 = C\R

fprintf('Daí, a1 = %f e a2 = %f\n', result1(1), result1(2))
disp('Tecle algo para continuar...')
pause;
fprintf('\nRecuperando os coeficientes da equação:\nvm = 1/a1 e ks = a2*vm, logo:\n')
vmCaso1 = 1/result1(1)
ksCaso1 = result1(2)*vmCaso1

% CASO 2
fprintf('\n\nCASO 2:\nLinearizando: z2 = 1/v \n=> z = (ks^2 + [S]^2)/(vm*[S]^2)\n=> z = ks^2/(vm*[S]^2) + 1/vm = a2*1/[S]^2 + a1\nem que a2 = ks^2/vm e a1 = 1/vm e g2([S])= 1/[S]^2 e g1([S]) = 1\n\n')
disp('Tecle algo para seguir para o calculo dos coeficientes...')
pause;
disp('Podemos usar a mesma tabela z anterior:')
S = [1.3, 1.8, 3, 4.5, 6, 8, 9]
z = [v.^(-1)]

Metodo_dos_quadrados_minimos

C = [sum(linspace(1,1,tam)), sum(S.^(-2)); sum(S.^(-2)), sum(S.^(-4))]; %% matriz dos coeficientes
r21 = 0;
for i=1:tam
  r21 = r21 + z(i)/(S(i)^2);
endfor
R = [sum(z); r21];

%% Resolvendo a = C\R
result2 = C\R

fprintf('Daí, a1 = %f e a2 = %f\n', result2(1), result2(2))
disp('Tecle algo para continuar...')
pause;
fprintf('\nRecuperando os coeficientes da equação:\nvm = 1/a1 e ks = (a2*vm)^(1/2), logo:\n')
vmCaso2 = 1/result2(1)
ksCaso2 = (result2(2)*vmCaso2)^(1/2)

disp('Tecle algo para ir para continuar')
pause;
disp('')

function [v] = caso1Original(s, vmCaso1, ksCaso1)
  v = vmCaso1*s/(ksCaso1 + s);
endfunction

function [z] = caso1Linear(s, result1)
  z = result1(2)/s + result1(1);
endfunction

function [v] = caso2Original(s, vmCaso2, ksCaso2)
  v = vmCaso2*s^2/(ksCaso2^2 + s^2);
endfunction

function [z] = caso2Linear(s, result2)
  z = result2(2)/s^2 + result2(1);
endfunction

disp('Estimando v para [S] = 7')
fprintf('Caso 1\n\tLinear: %f\n\tOriginal: %f\n',1/caso1Linear(7, result1), caso1Original(7, vmCaso1, ksCaso1))
fprintf('Caso 2\n\tLinear: %f\n\tOriginal: %f\n',1/caso2Linear(7, result2), caso2Original(7, vmCaso2, ksCaso2))

disp('Tecle algo para ir para o próximo item')
pause;

################# LETRA B #################################
fprintf('\nb)Calcule r2 para os modelos linearizados e originais.\n')
for i=1:tam
  Vcaso1Origial(i) = caso1Original(S(i), vmCaso1, ksCaso1);
  Vcaso1Linear(i) = caso1Linear(S(i), result1);
  Vcaso2Original(i) = caso2Original(S(i), vmCaso2, ksCaso2);
  Vcaso2Linear(i) = caso2Linear(S(i), result2);
endfor

r2s = [coef_determinacao(z,Vcaso1Linear), coef_determinacao(v,Vcaso1Origial), coef_determinacao(z,Vcaso2Linear), coef_determinacao(v,Vcaso2Original)];
fprintf('Caso 1 linear: %f  ; Caso 1 original: %f\nCaso 2 linear: %f  ; Caso 2 original: %f\n', r2s(1), r2s(2), r2s(3), r2s(4))

disp("Tecle algo para continuar...")
pause;
################# LETRA C #################################
fprintf("\nC) Faça os gráficos das soluções linearizadas (Caso1:(1/[S] X 1/v) e Caso2:(1/[S]² X 1/v))")
fprintf(" e originais ([S] X v). Mostre em um mesmo gráfico a curva do ajuste junto com os ")
fprintf("pontos tabelados.\n\n")
disp("Tecle algo para continuar...")
pause;
fprintf("\nS ==>")
disp(S)
fprintf("\n v ==>")
disp(v)
fprintf("\nzCaso1linear ==>")
disp(Vcaso1Linear)
fprintf("\nzCaso2linear ==>")
disp(Vcaso2Linear)
fprintf("\n Segue a seguir os gráficos gerados para [S] X v, 1/[S] X 1/v e 1/[S]² X 1/v.\n\n")
figure;
plot(S,v,'-k')
title("[S] X v")
xlabel("[S]")
ylabel("v");
figure;
S2 = S.^(-1);
v1 = v.^(-1);
hold on
plot(S2,Vcaso1Linear,";Caso 1 linear 1;")
scatter(S2,v1,'m')
title("1/[S] X 1/v")
xlabel("1/[S]")
ylabel("1/v")
hold off
figure;
S3 = S.^(-2);
hold on
plot(S3,Vcaso2Linear,";Caso 2 linear;")
scatter(S3,v1,'m')
title("1/[S]² X 1/v")
xlabel("1/[S]²")
ylabel("1/v")
hold off
disp("Tecle algo para continuar...")
pause;
figure;
printf("\nGráfico dos ajustes ja originais\n\n ")
hold on
plot(S,Vcaso1Origial,";Caso 1 original;",S,Vcaso2Original,";Caso 2 original;");
scatter(S,v,'m')
hold off
disp("Tecle algo para continuar...")
pause;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

####################### LETRA D ####################################
fprintf("\nD) Analise qual caso forneceu um ajuste mais adequado, baseado nos valores estimados ")
fprintf("para [S] = 7, medidas estatisticas e gráficos dos ajustes.\n\n")
disp("Tecle algo para continuar...")
pause;
fprintf("\nCoeficiente de determinação caso1 ajuste =>")
disp(r2s(2))
fprintf("\nCoeficiente de determinação caso2 ajuste =>")
disp(r2s(4))
fprintf("\nAproximação de S = 7 para caso1 =>")
disp(caso1Original(7,vmCaso1,ksCaso1))
fprintf("\nAproximação de S = 7 para caso2 =>")
disp(caso2Original(7,vmCaso2,ksCaso2))
fprintf("\nValor de v quando S = 6 =>")
disp(v(5))
fprintf("\nValor de v quando S = 8 =>")
disp(v(6))
disp("Tecle algo para continuar...")
pause;
fprintf("\nPelo grafico de ajustes gerado na questão C, vimos que o ajuste que mais")
fprintf(" se adequa a equação original é o caso2, sua linha está quase totalmente colidindo")
fprintf(" com os pontos da equação original. Podemos confirmar isso com os dados de coeficiente de determinação")
fprintf(" e os valores que achamos para cada uma aproximação de S = 7... Observando os valores antes e depois de S = 7")
fprintf(" ou seja S=6 e S=8...\n")
fprintf("Sobre o coeficiente de determinação o caso2 ja se destaca, o caso1 é 0.6+- enquanto o caso2")
fprintf(" chega a um valor de 0.9+- ou seja bem proximo de 1 o que nos diz ser nossa melhor escolha")
fprintf(" pelos dados estatisticos. Já pela aproximação de [S]=7, caso1 temos um valor de 0.39473,")
fprintf(" enquando no caso2 nosso valor é de 0.35154... E os extremos onde [S] = 6 é 0.335")
fprintf(" e [S] = 8 é 0.35... Vemos assim que claramente o segundo caso é a melhor escolha!!\n\n")

disp("Tecle algo para continuar...")
pause;
disp("FIM DA QUESTÃO!!")
close all;
