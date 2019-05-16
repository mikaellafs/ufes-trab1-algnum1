load "bcsstk01.mat";
A = Problem.A;

load "fs_183_3.mat";
B = Problem.A;

load "hor_131.mat";
C = Problem.A;

fprintf('QUESTÃO 2\nObjetivo: O objetivo desse exercício  ́e observar o comportamento dos métodos iterativos estudados, para cada')
fprintf('uma das matrizes escolhidas. Considere nos testes tolerância niter = 0.00001, número máximo de = 10000, parâmetro ω ∈ (0,2) e b=A∗ones(n,1).\n\n')

######################### LETRA A: #########################
function 