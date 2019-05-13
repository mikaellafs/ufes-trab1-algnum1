load bcsstk01.mat;
A = Problem.A;
load fs_183_3.mat;
B = Problem.A;
load hor_131.mat;
C = Problem.A;
#load rail_5177.mat
#D = Problem.A
#load orsirr_1.mat
#E = Problem.A
#load plat362.mat
#F=Problem.A

### PEGANDO L U P DAS 3 MATRIZES ###
disp("TRABALHANDO COM A PRIMEIRA MATRIZ")
#A) salvando as matrizes L U e P
 
[L,U,P]=lu(A);
#figure é uma função que impede de sobrescrever um grafico
figure
spy(A)
#print é uma função que grava o grafico em uma imagem, muito importante não 
#fechar os graficos durante a execução se n a função quebra o programa
print -dpng esparsidadeA.png
figure
spy(L)
print -dpng esparsidadeL.png
figure
spy(U)
print -dpng esparsidadeU.png
clear figure

##SOBRE A ESPARSIDADE DA MATRIZ A##

#não sei mais o que escrever sobre da um help ai
%-------------------------------------------------------------------------------
% Esparsidade da matriz A, a partir do grafico gerado pela função spy() 
% conseguimos ver que a matriz A é uma matriz simetrica e que é 
% consideravelmente esparsa, ou seja possuem zeros que não precisam ser
% representados e por isso omitimos a existência
%-------------------------------------------------------------------------------
##SOBRE A ESPARSIDADE DA MATRIZ L##
%-------------------------------------------------------------------------------
% Pelo grafico gerado a partir da função spy() conseguimos ver que a matriz
% L gerada é esparsa, possui varios zeros que não precisam ser representados
% É evidente que é uma matriz triangular inferior como vimos nos estudos em
% Sala de aula
%-------------------------------------------------------------------------------
##SOBRE A ESPARSIDADE DA MATRIZ U##
%-------------------------------------------------------------------------------
%Vemos que a matriz U gerada é uma matriz esparsa, e conseguimos identificar que
%É uma matriz triangular superior
%-------------------------------------------------------------------------------


#B) RESOLVENDO O SISTEMA LINEAR
n=rows(A);
b=A*ones(n,1);
x = A\b
r = b-A*x
disp("norma do máximo relativa ao resíduo")
norm((b-A*x)/b,inf)

#C) 
disp("condicionamento de A")
cond(A)

##SOBRE O CONDICIONAMENTO DE A##
%-------------------------------------------------------------------------------
%O condicionamento de um sistema identifica se pequenas alterações podem mudar
%O valor final, exemplo 1.1a + 2.0b = 9 e 2a + 3b = 3, se mudarmos para algo da
%Forma 1.15a + 2.0b = 9 e 2.05a+3b = 3, o resultado final vai ser muito 
%Diferente da solução exata, isso se o condicionamento de A der muito alto
%Nosso condicionamento em A aqui deu algo em torno de 882336.26270, o que é
%muito alto, isso significa que trabalhar com metodos diretos não é a melhor
%Solução, o certo seria condicionar nossa matriz para depois resolver
%De fato, o metodo que seria mais usual seria o iterativo, pois sabemos que
%O condicionamento ta relacionado com o erro relativo
%-------------------------------------------------------------------------------

##aqui é para espear o usuario digitar algo e continuar##
while(input("Tecle enter para continuar..."))
end
 
disp("TRABALHANDO COM A SEGUNDA MATRIZ")
#A) 
[L1,U1,P1]=lu(B);
figure
spy(B)
print -dpng esparsidadeB.png
figure
spy(L1)
print -dpng esparsidadeL1.png
figure
spy(U1)
print -dpng esparsidadeU1.png


##DISCUTIR SOBRE OS RESULTADOS



#B) RESOLVENDO O SISTEMA LINEAR
n1=rows(B);
b1=B*ones(n1,1);
x1 = B\b1
r1 = b1-B*x1
norm((b1-B*x1)/b1,inf)

#C) 
cond(B)
while(input("Tecle enter para continuar..."))
end

disp("TRABALHANDO COM A TERCEIRA MATRIZ")
#A) 
[L2,U2,P2]=lu(C);
figure
spy(C)
print -dpng esparsidadeC.png
figure
spy(L2)
print -dpng esparsidadeL2.png
figure
spy(U2)
print -dpng esparsidadeU2.png


##DISCUTIR SOBRE OS RESULTADOS



#B) RESOLVENDO O SISTEMA LINEAR
n2=rows(C);
b2=C*ones(n2,1);
x2 = C\b2
r2 = b2-C*x2
norm((b2-C*x2)/b2,inf)

#C) 
cond(C)


