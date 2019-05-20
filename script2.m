clc;
load "bcsstk01.mat";
A = Problem.A;

load "fs_183_3.mat";
B = Problem.A;

load "hor_131.mat";
C = Problem.A;

fprintf('QUESTÃO 2\nObjetivo: O objetivo desse exercício  ́e observar o comportamento dos métodos iterativos estudados, para cada ')
fprintf('uma das matrizes escolhidas. Considere nos testes tolerância niter = 0.00001, número máximo de = 10000, parâmetro ω ∈ (0,2) e b=A∗ones(n,1).\n\n')

######################### LETRA A: #########################

fprintf("A) Avalie o comportamento dos processos iterativos de cada método, Seidel, Jacobi")
fprintf(" e SOR, utilizando a função fatora. Faça algumas escolhas do paramêtro")
fprintf(" w com o objetivo de diminuir o número de iterações do método SOR.\n\n")
disp("Tecle algo para continuar...")
pause;
function [] = letraA(A,w)
  [MJ,MS,MSOR] = fatora (A,w);
  [v,lambda]=eig(MJ);
  fprintf('MATRIZ JACOBI\n\n')
  if (max(abs(diag(lambda)))<1) 
      fprintf("Converge, pois o max lambda em modulo da matriz é menor que 1.\n\n");
  else
      fprintf("Não converge, pois não foi satisfeito que o max lambda da matriz seja menor que 1.\n\n")
  endif

  fprintf('MATRIZ SEIDEL\n\n')
  [v,lambda]=eig(MS);
  if (max(abs(diag(lambda)))<1) 
      fprintf("Converge, pois o max lambda em modulo da matriz é menor que 1.\n\n");
   else 
      fprintf("Não converge, pois não foi satisfeito que o max lambda da matriz seja menor que 1.\n\n")
  endif
  fprintf('MATRIZ SOR\n\n')
  [v,lambda] = eig(MSOR);
  if (max(abs(diag(lambda)))<1) 
      fprintf("Converge, pois o max lambda em modulo da matriz é menor que 1.\n\n");
      disp("Valor do maior lambda em modulo")
      disp(max(abs(diag(lambda))));
  else 
      fprintf("Não converge, pois não foi satisfeito que o max lambda da matriz seja menor que 1.\n\n")
  endif
endfunction
##PARA A PRIMEIRA MATRIZ##
fprintf("##RESOLVENDO (A) PARA PRIMEIRA MATRIZ##\n\n")
letraA(A,1.9);
fprintf("\nO valor do 'W' utilizado foi 1.9, a partir dos teste vimos que é ")
fprintf("o melhor valor pois nos retornar o menor max lambda em modulo e converge.\n\n")
disp("Tecle algo para continuar...")
pause;
##PARA A SEGUNDA MATRIZ##
fprintf("\n##RESOLVENDO (A) PARA A SEGUNDA MATRIZ##\n\n")
letraA(B,1.2);
fprintf("\n O valor otimo de 'W' econtrado foi 1.2, visto que")
fprintf(" foi o min max lambda em modulo retornado e que convergiu.\n\n")
disp("Tecle algo para continuar...")
pause;
##PARA A TERCEIRA MATRIZ##
fprintf("\n##RESOLVENDO (A) PARA A TERCEIRA MATRIZ##\n\n")
letraA(C,1.2);
fprintf("\n O valor melhor encontrado para 'W' foi 1.9, onde o metodo")
fprintf(" converge e retorna o min max lambda em modulo\n\n")
disp("Tecle algo para continuar...")
pause;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
######################### LETRA B: #########################
clc;
fprintf("\nB) Calcule a solução de cada sistema pelos métodos Jacobi, Seidel e Sor para o melhor valor de w encontrado\n\n\n");
disp("Tecle algo para continuar...")
pause;

nmaxiter = 10000;
tol = 0.00001;
##PARA A PRIMEIRA MATRIZ##
n = rows(A);
b = A*ones(n,1);
fprintf("\n##RESOLVENDO (B) PARA A PRIMEIRA MATRIZ##")
fprintf("\nO método de jacobi não converge como vimos na letra (A), logo não vamos resolver para")
fprintf(" esse método.\n\n")
disp("Tecle algo para continuar...")
pause;

disp("Método Seidel")
[x,iter1,res1] = sor (A,b,tol,nmaxiter,1)

disp("Tecle algo para continuar...")
pause;

disp("Método SOR para w = 1.9, como vimos na letra (A)")

[x,iter2,res2] = sor (A,b,tol,nmaxiter,1.9)

disp("Tecle algo para continuar...")
pause;

##PARA A SEGUNDA MATRIZ##
n = rows(B);
b = B*ones(n,1);
fprintf("\n##RESOLVENDO (B) PARA A SEGUNDA MATRIZ##\n\n")
disp("Método Jacobi")
[x,iter3,res3] = jacobi(B,b,tol,nmaxiter)
disp("Tecle algo para continuar...")
pause;

disp("Método Seidel")
[x,iter4,res4] = sor(B,b,tol,nmaxiter,1)
disp("Tecle algo para continuar...")
pause;

disp("Método SOR, para w = 1.2 como vimos na letra (A)")
[x,iter5,res5] = sor(B,b,tol,nmaxiter,1.2)
disp("Tecle algo para continuar...")
pause;

##PARA A TERCEIRA MATRIZ##
n = rows(C);
b = C*ones(n,1);
fprintf("\n##RESOLVENDO (B) PARA A TERCEIRA MATRIZ##\n\n")
fprintf("Não iremos resolver para Jacobi, vimos na letra (A) que esse método não converge\n\n")
fprintf("\n ATENÇAO PARA O PROXIMO METODO SERAO EM CERCA DE 1 HORA DE ESPERA\n")
fprintf(" PARA O METODO SEGUINTE CERCA DE 40 MIN \n")
disp("Tecle algo para continuar...")
pause;
disp("Método Seidel")
[x,iter6,res6] = sor(C,b,tol,nmaxiter,1)
disp("Tecle algo para continuar...")
pause;

disp("Método SOR, para w = 1.2 como vimos na letra (A)")
[x,iter7,res7] = sor(C,b,tol,nmaxiter,1.2)
disp("Tecle algo para continuar...")
pause;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
###################LETRA C:######################

fprintf("\nC) Faça o gráfico da norma do máximo relativa do resíduo com relação")
fprintf(" as iterações, utilizando os dados calculados  nas funções jacobi.m")
fprintf(" sor.m. No mesmo sistema de eixos plote o gráfico dos resíduos ")
fprintf("relativos para os métodos que convergiram.\n\n")

disp("Tecle algo para continuar...")
pause;
##PARA A PRIMEIRA MATRIZ##
fprintf("\n##RESOLVENDO (C) PARA A PRIMEIRA MATRIZ##\n\n")
plot(1:iter1,res1,'-k',1:iter2,res2,'-r');
title("--METODO SEIDEL E SOR DA MATRIZ A--");
xlabel("iterações");
ylabel("NormaResidualMax");
fprintf("\nGrafico gerado somente para os métodos seidel e sor, foram os únicos que convergiram")
fprintf(", o preto é pelo método de seidel e o vermelho pelo método SOR\n\n")
disp("Tecle algo para continuar...")
pause;
##PARA A SEGUNDA MATRIZ##
fprintf("\n##RESOLVENDO (C) PARA A SEGUNDA MATRIZ##\n\n")
plot(1:iter3,res3,'-c',1:iter4,res4,'-g',1:iter5,res5,'-b');
title("--METODO JACOBI,SEIDEL E SOR--");
xlabel("iterações");
ylabel("NormaResidualMax");
fprintf("\nGrafico gerado para os métodos jacobi, seidel e sor")
fprintf(", o ciano é pelo método de jacobi, o verde para o método seidel, e o azul para o SOR\n\n")
disp("Tecle algo para continuar...")
pause;
##PARA A TERCEIRA MATRIZ##
fprintf("##RESOLVENDO (C) PARA A TERCEIRA MATRIZ##\n\n")
plot(1:iter6,res6,'-r',1:iter7,res7,'-m');
title("--METODO SEIDEL E SOR--");
xlabel("iterações");
ylabel("NormaResidualMax");
fprintf("\nGrafico gerado somente para os métodos seidel e sor, foram os únicos que convergiram")
fprintf(", o vermelho é pelo método de seidel e o magento pelo método SOR\n\n")
disp("Tecle algo para continuar...")
pause;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
#######################LETRA D:#######################
fprintf("\nD) Comente suas conclusões sobre o comportamento das matrizes para ")
fprintf("métodos diretos e iterativos\n\n")

disp("CONCLUSÃO: ")
disp("SOBRE MÉTODO DIRETO")
fprintf("\nPara começar a discussão, vamos falar sobre os erros do metodo direto:\n")
fprintf("Possui somente erro de ponto flutuante, ou seja erro de arredondamento, ")
fprintf(" além de erro pela representação númerica no computador (base binaria). ")
fprintf(" Outro fator que persegue o método direto são as matrizes mal condicionadas. ")
fprintf("Aqui elas são passadas despercebidas e nos trazem soluções que parecem otimas ")
fprintf(" mas na verdade podem estar totalmente distantes da exata.")
fprintf(" Apesar disso, resolver sistemas com metodos direto nos poupa tempo")
fprintf(", é um método de solução rápida!\n\n")

disp("SOBRE MÉTODOS ITERATIVOS")
fprintf("\nOs erros dos metodos iterativos são, erros de ponto flutuante os mesmos do metodo direto somado com o de truncamento, erros de truncamento são erros trazidos da aproximação de algo por outra coisa, sendo mais objetivo, aproximando uma função de difícil compreensão por uma de fácil compreensão.")
fprintf(" Como o condicionamento de uma matriz está relacionada com o erro relativo ")
fprintf(", elas são mais fácilmente evitadas aqui! Para saber se um método converge ou não,")
fprintf(" usamos o teorema do raio espectral. Mesmo o metodo iterativo sendo um bom método")
fprintf(", tem um ponto negativo, que mesmo sistemas que convergem, dependendo do tamanho")
fprintf(" podem demorar muito tempo para mostrar resultado.\n\n")

disp("FIM DA QUESTAO!!")
clear all;
