% 1. O objetivo deste exercício é observar o comportamento dos métodos diretos, para cada uma das matrizes escolhidas

% a)Obtenha os fatores L, U e P utilizando a função [L,U,P]=lu(A) e 
%   observe a configuração de esparsidade das matrizes A, L e U.
%   O que podemos observar com relação ao preenchimento no processo de decomposição LU?


disp('Enunciado aqui tambem?')
disp('')

% Matriz 1:
disp('Matriz 1: fs_183_3.mat')
load matrizes/fs_183_3.mat
A = Problem.A
[L, U, P] = lu(A)
spy(A)
pause
spy(L)
pause
spy(U)
disp('Pressione qualquer tecla para ir para proxima matriz...');
pause

%--------------------------------------------------------------------------------------
% Matriz 2:
disp('Matriz 2: orsirr_1.mat')
load matrizes/orsirr_1.mat
A = Problem.A
[L, U, P] = lu(A)
spy(A)
pause
spy(L)
pause
spy(U)
disp('Pressione qualquer tecla para ir para proxima matriz...');
pause

%--------------------------------------------------------------------------------------
% Matriz 3:
disp('Matriz 2: plat362.mat')
load matrizes/plat362.mat
A = Problem.A
[L, U, P] = lu(A)
spy(A)
pause
spy(L)
pause
spy(U)
disp('Pressione qualquer tecla para ir para o proximo item...');
pause

%--------------------------------------------------------------------------------------

% Conclusao: Aqui ou uma pra cada matriz?


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% b) Calcule a solução do sistema linear onde b = A*ones(n,1), através de x = A\b, e a norma do máximo
%    relativa do resíduo usando norm((b - A*x)/b, inf).
