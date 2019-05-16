load "bcsstk01.mat";
A = Problem.A;

load "fs_183_3.mat";
B = Problem.A;

load "hor_131.mat";
C = Problem.A;

fprintf('QUESTÃƒO 1\nObjetivo: Observar o comportamento dos mÃ©todos diretos, para cada uma das matrizes escolhidas.\n\n')

######################### LETRA A: #########################
disp('a) Obtenha os fatores L,U e P e observe a configuraÃ§Ã£o de esparsidade das matrizes A,L e U.')
fprintf('O que podemos observar com relaÃ§Ã£o ao preenchimento no processode decomposiÃ§Ã£o LU?\n\n')
pause;

% DecompÃµe uma matriz A e obtÃ©m a esparsidade de L, U e A
function [] = letraA(A)
  [L,U,P]=lu(A);
  disp('Esparsidade de A')
  figure
  spy(A)
  pause;
  
  disp('Esparsidade de L')
  figure
  spy(L)
  pause;
  
  disp('Esparsidade de U')
  figure
  spy(U)
  pause;
  close all
endfunction

fprintf('Trabalhando com a primeira matriz\n')
letraA(A);
fprintf('Tecle enter para seguir para prÃ³xima matriz\n\n')
pause;

fprintf('Trabalhando com a segunda matriz\n')
letraA(B);
fprintf('Tecle enter para seguir para prÃ³xima matriz\n\n')
pause;

fprintf('Trabalhando com a terceira matriz\n')
letraA(C);
fprintf('Tecle enter para seguir para conclusÃµes\n\n')
pause;

%%DISCUTIR SOBRE OS RESULTADOS
disp('CONCLUSÃƒO: ')

disp('Proximo item...')
pause;

######################### LETRA B: #########################

fprintf('b) Calcule a soluÃ§Ã£o do sistema linear onde b=Aâˆ—ones(n,1) e a norma do mÃ¡ximo relativa do resÃ­duo\n\n')
% Calcula a soluÃ§Ã£o do sistema linear onde b=Aâˆ—ones(n,1) e a norma do maximo relativa ao residuo
function [x, norm] = letraB(A)
  n=rows(A);
  b=A*ones(n,1);
  x = A\b
  r = b-A*x
  disp("Norma do mÃ¡ximo relativa ao resÃ­duo")
  norm((b-A*x)/b,inf)
endfunction

fprintf('Trabalhando com a primeira matriz\n')
letraB(A)
fprintf('Tecle enter para seguir para prÃ³xima matriz\n\n')
pause;

fprintf('Trabalhando com a segunda matriz\n')
letraB(B)
fprintf('Tecle enter para seguir para prÃ³xima matriz\n\n')
pause;

fprintf('Trabalhando com a terceira matriz\n')
letraB(C)
fprintf('Tecle enter para seguir para conclusÃµes\n\n')
pause;

%% DISCUTIR SOBRE OS RESULTADOS
disp('CONCLUSÃƒO: ')
disp('Proximo item...')
pause;
######################### LETRA C: #########################
fprintf('c) Calcule o nÃºmero de condicionamento das matrizes escolhidas.')
fprintf('O que podemos dizer sobre a qualidade da soluÌ§cÌƒao encontrada?')

fprintf('Trabalhando com a primeira matriz\n')
cond(A)
fprintf('Tecle enter para seguir para prÃ³xima matriz\n\n')
pause;

fprintf('Trabalhando com a segunda matriz\n')
cond(B)
fprintf('Tecle enter para seguir para prÃ³xima matriz\n\n')
pause;

fprintf('Trabalhando com a terceira matriz\n')
cond(C)
fprintf('Tecle enter para seguir para conclusÃµes\n\n')
pause;

%%DISCUTIR SOBRE OS RESULTADOS
disp('CONCLUSÃƒO: ')
