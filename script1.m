clc
clear
load "bcsstk01.mat";
A = Problem.A;

load "fs_183_3.mat";
B = Problem.A;

load "hor_131.mat";
C = Problem.A;

fprintf('QUESTAO 1\nObjetivo: Observar o comportamento dos metodos diretos, para cada uma das matrizes escolhidas.\n\n')

######################### LETRA A: #########################
disp('a) Obtenha os fatores L,U e P e observe a configuração de esparsidade das matrizes A,L e U.')
fprintf('O que podemos observar com relação ao preenchimento no processo de decomposição LU?\n\n')
pause;

% Decompõe uma matriz A e obtem a esparsidade de L, U e A
function [] = letraA(A)
  [L,U,P]=lu(A);
  fprintf('Esparsidade de A: %d elementos nao nulos\n', nnz(A));
  figure
  spy(A)
  pause;
  
  fprintf('Esparsidade de L: %d elementos nao nulos\n', nnz(L)')
  figure
  spy(L)
  pause;
  
  fprintf('Esparsidade de U: %d elementos nao nulos\n', nnz(U)')
  figure
  spy(U)
  pause;
  close all
endfunction

fprintf('Trabalhando com a primeira matriz\n')
letraA(A);
fprintf('Tecle enter para seguir para proxima matriz\n\n')
pause;

fprintf('Trabalhando com a segunda matriz\n')
letraA(B);
fprintf('Tecle enter para seguir para proxima matriz\n\n')
pause;

fprintf('Trabalhando com a terceira matriz\n')
letraA(C);
fprintf('Tecle enter para seguir para conclusoes\n\n')
pause;

%%DISCUTIR SOBRE OS RESULTADOS
disp('CONCLUSÃO: Podemos observar que a esparsidade das matrizes L e U obtidas é muito menor do que a da matriz A de origem,')
disp('ou seja, espaços que antes eram nulos, passaram a ser não nulos, ocupando muito mais memória');
disp('e necessitando de muito tempo para resolvê-las. Dessa forma, concluimos que método direto para matrizes grandes e esparsas não é muito eficiente');

disp('Proximo item...')
pause;

######################### LETRA B: #########################

fprintf('b) Calcule a soluçao do sistema linear onde b=A*ones(n,1) e a norma do máximo relativa do resi­duo\n\n')
% Calcula a solucao do sistema linear onde b=A*ones(n,1) e a norma do maximo relativa ao residuo
function [x, norm] = letraB(A)
  n=rows(A);
  b=A*ones(n,1);
  x = A\b
  r = b-A*x
  disp("Norma do maximo relativa ao resi­duo")
  norm((b-A*x)/b,inf)
endfunction

fprintf('Trabalhando com a primeira matriz\n')
letraB(A)
fprintf('Tecle enter para seguir para proxima matriz\n\n')
pause;

fprintf('Trabalhando com a segunda matriz\n')
letraB(B)
fprintf('Tecle enter para seguir para proxima matriz\n\n')
pause;

fprintf('Trabalhando com a terceira matriz\n')
letraB(C)
fprintf('Tecle enter para seguir para conclusoes\n\n')
pause;

disp('Proximo item...')
pause;
######################### LETRA C: #########################
fprintf('c) Calcule o numero de condicionamento das matrizes escolhidas.')
fprintf('O que podemos dizer sobre a qualidade da solucao encontrada?')

fprintf('Trabalhando com a primeira matriz\n')
cond(A)
fprintf('Tecle enter para seguir para proxima matriz\n\n')
pause;

fprintf('Trabalhando com a segunda matriz\n')
cond(B)
fprintf('Tecle enter para seguir para proxima matriz\n\n')
pause;

fprintf('Trabalhando com a terceira matriz\n')
cond(C)
fprintf('Tecle enter para seguir para conclusoes\n\n')
pause;

%%DISCUTIR SOBRE OS RESULTADOS
disp('CONCLUSÃO: Para as 3 matrizes, o numero de condicionamento é muito grande, indicando que qualquer')
disp('alteração nos coeficientes da matriz também altera muito o resultado final, sendo então, a qualidade')
disp('da solução muito baixa')
