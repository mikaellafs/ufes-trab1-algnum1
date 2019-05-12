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

figure
spy(A)
print -dpng esparcidadeA.png
figure
spy(L)
print -dpng esparcidadeL.png
figure
spy(U)
print -dpng esparcidadeU.png

##ESPAÇO PARA ESCREVER SOBRE O RESULTADO DA ESPERCIDADE


#B) RESOLVENDO O SISTEMA LINEAR
n=rows(A);
b=A*ones(n,1);
x = A\b
r = b-A*x
norm((b-A*x)/b,inf)

#C) 
cond(A)

disp("TRABALHANDO COM A SEGUNDA MATRIZ")
#A) 
[L1,U1,P1]=lu(B);
spy(B)
print -dpng esparcidadeB.png
figure
spy(L1)
print -dpng esparcidadeL1.png
figure
spy(U1)
print -dpng esparcidadeU1.png


##DISCUTIR SOBRE OS RESULTADOS



#B) RESOLVENDO O SISTEMA LINEAR
n1=rows(B);
b1=B*ones(n1,1);
x1 = B\b1
r1 = b1-B*x1
norm((b1-B*x1)/b1,inf)

#C) 
cond(B)

disp("TRABALHANDO COM A SEGUNDA MATRIZ")
#A) 
[L2,U2,P2]=lu(C);
spy(C)
print -dpng esparcidadeC.png
figure
spy(L2)
print -dpng esparcidadeL2.png
figure
spy(U2)
print -dpng esparcidadeU2.png


##DISCUTIR SOBRE OS RESULTADOS



#B) RESOLVENDO O SISTEMA LINEAR
n2=rows(C);
b2=C*ones(n2,1);
x2 = C\b2
r2 = b2-C*x2
norm((b2-C*x2)/b2,inf)

#C) 
cond(C)


