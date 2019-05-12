exemplo/dados.txt                                                                                   0000664 0001750 0001750 00000000157 13455420636 013701  0                                                                                                    ustar   avalli                          avalli                                                                                                                                                                                                                 0  -0.447
.1  1.978
.2  3.28
.3  6.16
.4  7.08
.5  7.34
.6  7.66
.7  9.56
.8  9.48
.9  9.3
1.  11.2
                                                                                                                                                                                                                                                                                                                                                                                                                 exemplo/main.m                                                                                      0000664 0001750 0001750 00000003725 11701042224 013135  0                                                                                                    ustar   avalli                          avalli                                                                                                                                                                                                                 clc
clear
clear functions
%
% -----------------------------------------------------------
% 	Introducao ao Calculo Numerico usando o Octave/Matlab		              
%             Prof. Andrea Valli
%------------------------------------------------------------
% Descricao do Trabalho 
% -----------------------------------------------------------
introd
disp(' ');
disp('Tecle alguma coisa para continuar...'); pause
%
% -----------------------------------------------------------
% Parte I - Resolucao de Sistemas Lineares
% -----------------------------------------------------------
ex1
disp(' ');
disp('Tecle alguma coisa para continuar...'); pause
%
% -----------------------------------------------------------
% Parte 2 - Ajuste de Curvas
% -----------------------------------------------------------
ex2
disp(' ');
disp('Tecle alguma coisa para continuar...'); pause
%
% -----------------------------------------------------------
% Parte 3 - Solucao de Equacoes Diferenciais Ordinarias
% -----------------------------------------------------------
ex3
disp(' ');
disp('Tecle alguma coisa para continuar...'); pause
% -----------------------------------------------------------
% Parte 4 - Raizes de Equacoes
% -----------------------------------------------------------
ex4
disp(' ');
disp('Tecle alguma coisa para continuar...'); pause
% -----------------------------------------------------------
% Parte 5 - Interpolacao
% -----------------------------------------------------------
ex5
disp(' ');
disp('Tecle alguma coisa para continuar...'); pause
% -----------------------------------------------------------
% Parte 6 - Integracao
% -----------------------------------------------------------
ex6
disp(' ');
disp('Tecle alguma coisa para continuar...'); pause
%
% -----------------------------------------------------------
% Final da Apresentacao
% -----------------------------------------------------------
disp(' ');
disp('Tecle alguma coisa para terminar a apresentacao...'); pause
clc
                                           exemplo/ex1.m                                                                                       0000664 0001750 0001750 00000007242 11700602614 012710  0                                                                                                    ustar   avalli                          avalli                                                                                                                                                                                                                 clc
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questao 1: Resolucao de Sistemas Lineares,
%            calculo de determinantes, calculo da inversa,
%            produto matriz-vetor
%
% Seja o sistema Ax = b
%         
% onde
%                 
%         |  2  1 -1  5  6 |       | 13 |
%     A = |  1  2  3 -7 -2 |   B = | -3 | 
%         | -7  3  2  0  4 |       |  2 |
%         | -1  0  3  1  1 |       |  4 |    
%         |  3  5 -8  1  7 |       |  8 |  
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Resolucao de um sistema linear Ax = b usando o comando x = A\b');
disp('comando para entrar a matriz A: ');
disp(' A=[2  1 -1  5  6; 1  2  3 -7 -2; -7  3  2  0  4; -1  0  3  1  1; 3  5 -8  1  7]');
disp('comando para definir o vetor b: ');
disp(' b=[13; -3; 2; 4; 8]');
disp(' ');
A=[2  1 -1  5  6; 1  2  3 -7 -2; -7  3  2  0  4; -1  0  3  1  1; 3  5 -8  1  7]
b=[13; -3; 2; 4; 8]
x = A\b
disp(' ');
disp('Tecle alguma coisa para continuar...'); pause;
clc;
clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Determinante de A e inversa de A.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Determinante de A ( det(A) ) e inversa de A ( inv(A) ):');
disp(' ');
determinate = det(A)
inversa_A = inv(A)
disp(' ');
disp('Tecle alguma coisa para continuar...'); pause
clc;
clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% produto matriz-vetor: c = A*b.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('produto c = A*b:');
disp(' ');
c = A * b
disp(' ');
disp('Tecle alguma coisa para continuar...'); pause
clc;
clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questao 2: Resolva o sistema H x = b pelo metodo de 
%            Gauss-Seidel and SOR com precisao E=10^-7 
%            utilizando o octave/matlab. 
%
%           4  1 0 0 0 0 ... 0  0  0 0       1
%          -2  4 1 0 0 0 ... 0  0  0 0       2
%           0 -2 4 1 0 0 ... 0  0  0 0       3
%     H =   .                            b = 4
%           .
%           0  0 0 0 0 0 ... 0 -2  4 1       18
%           0  0 0 0 0 0 ... 0  0 -2 4       19
%
% Para isso, e' necessario fazer um codigo na linguagem do 
% octave/matlab para resolver o problema.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     
disp('Fazer um programa para resolver o sistema Hx=b pelo');
disp('metodo iterativo de Gauss-Seidel');
% construcao da matriz H e vetor b 'so para mostrar na tela
% no c'odigo de gauss-seidel s'o precisamos definir os valores 
% das diagonais
h4 = zeros(19,1);
h4 += 4;
h2 = zeros(18,1);
h2 += -2;
h1 = zeros(18,1);
h1 += 1;
H = diag(h4,0);
H += diag(h2,-1);
H += diag(h1,1);
b=zeros(19,1);
b+=3;
b(1) = 5;
b(19) = 2;
% inprime matriz H e vetor b
H
b

function [x, iteration] = method_sor (w)
	% Inicializa vetor x para iteracao k = 0
	for i = 1:19
		x(i) = 0;
	end
	
	iteration = 0;
	while true
		iteration++;

		% Guarda a iteracao anterior
		for i = 1:19
			oldX(i) = x(i);
		end

		% Executa iteracao
		x(1) = (5 - x(2)) / 4;
		x(1) = w * x(1) + (1-w) * oldX(1);
		for i = 2:18
			x(i) = (3 + 2*x(i-1) - x(i+1)) / 4;
			x(i) = w * x(i) + (1-w) * oldX(i);
		end
		x(19) = (2 + 2*x(18)) / 4;
		x(19) = w * x(19) + (1-w) * oldX(19);
		
		% Criterio de parada
		if ( max(abs(x - oldX)) / max(abs(x)) ) < 10^-7
			break
		end
		
		if iteration >= 500 
			printf('Gauss-seidel nao convergiu em 500 iteracoes \n');
			break			
		end
	end
endfunction

% resolve o sistema Hx = b por Gauss-Seidel (w=1)
w = 1;
[sol,iteration] = method_sor (w);
% imprime solucao
printf('Solucao por Gauss-Seidel:\n');
printf('Numero de iteracoes: ');
iteration
x = sol'
disp(' ');
disp('Final da Questao 1');
                                                                                                                                                                                                                                                                                                                                                              exemplo/ex5.m                                                                                       0000664 0001750 0001750 00000004112 13455406224 012715  0                                                                                                    ustar   avalli                          avalli                                                                                                                                                                                                                 clc
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questao 5: Interpolacao
%
% Ex:
%   1) Calcular uma sequencia de polinomios de interpolacao 
%   para a funcao f(x) = 1./(x.+10) + x.^3 + x.^2 - 3 tabelada 
%   no intervalo [-1,1] resolvendo o sistema de Vandermonde
%
%   2) Interpolar a funcao y = sin(2*pi*x/5) no intervalo [0,10]
%   usando diferentes metodos disponiveis no octave: linear, 
%   spline, cubic, nearest
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp("5. Interpolacao");
disp("Exemplo 1: Calcular uma sequencia de polinomios de interpolacao");
disp("para a funcao f(x) = 1./(x.+10) + x.^3 + x.^2 - 3 tabelada no intervalo [-1,1]");
disp(" ");

% calcula a tabela de pontos (fx,fy)
function y = f(x)
	y = 1./(x.+10) + x.^3 + x.^2 - 3;
end
n = 100;
fx = -1:2/n:1;
fy = f(fx);

% calcula os polinomios interpoladores grau=1,2,3 e 4
% montando e resolvendo o sistema de Vandermonde
for grau = 1:4
	n = grau;
	x = -1:2/n:1;
	y = f(x);

	po = fliplr((fliplr (vander (x))\(y'))'); 
	py = polyval(po, fx);
	
	plot(fx, py , fx, fy , x, y, "*")
	printf("Numero de pontos de interpolacao = %d \n", length(x))
	legend(strcat("polinomio interpolador de grau ", num2str(grau)), "funcao f(x)")
	pause
end

% interpolar a funcao y = sin(2*pi*x/5) no intervalo [0,10] usando diferentes
% metodos disponiveis no octave: linear, spline, cubic, nearest
disp(" ");
disp("Exemplo 2: interpolar a funcao y = sin(2*pi*x/5) no intervalo [0,10]");
disp("usando diferentes metodos: linear, spline, cubic, nearest");
disp(" ");
xf = [0:0.05:10];
yf = sin (2*pi*xf/5);
xp = [0:10];
yp = sin (2*pi*xp/5);
lin = interp1 (xp, yp, xf);
spl = interp1 (xp, yp, xf, "spline");
cub = interp1 (xp, yp, xf, "cubic");
near = interp1 (xp, yp, xf, "nearest");
plot (xf, yf, "r", xf, lin, "g", xf, spl, "b",xf, cub, "c", xf, near, "m", xp, yp, "r*");
title('Interpolacao de y = sin(2*pi*x/5) no intervalo [0,10] usando diferentes metodos');
legend ("original", "linear", "spline", "cubic", "nearest")
disp('Final da Questao 5');
                                                                                                                                                                                                                                                                                                                                                                                                                                                      exemplo/ex2.m                                                                                       0000664 0001750 0001750 00000002215 13455420612 012711  0                                                                                                    ustar   avalli                          avalli                                                                                                                                                                                                                 clc
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questao 2: Ajuste de Curvas 
%   p1(x) = a1x + a2                                 
%   p5(x) = a1 x^5 + a2 x^4 + a3 x^3 + a2 x^2 + a1 x + a0 
%
% Ajuste a tabela de dados armazenada no arquivo dados.m 
% polinomios de grau 1 e 5. Faca o grafico dos ajustes.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('2. Ajuste de Curvas: ajuste a tabela de dados armazenada no arquivo');
disp('dados.m polinomios de grau 1 e 5. Faca o grafico dos ajustes.');
disp(' ');

load dados.txt
[l,c] = size(dados);
x = dados(1:l,1);
y = dados(1:l,2);
n = 1;
p1 = polyfit(x,y,n);
fprintf('\n');
fprintf('p1(x) = %3.2f x + %3.2f\n', p1(1), p1(2));
n = 5;
p5 = polyfit(x,y,n);
fprintf('\n');
fprintf('p5(x) = %3.2f x^5  %3.2f x^4  %3.2f x^3  %3.2f x^2 + %3.2f x  %3.2f\n', p5(1), p5(2), p5(3), p5(4), p5(5), p5(6));
fprintf('\n');
fprintf('\n');

xi = linspace(0,1,100);
z1 = polyval(p1,xi);
z5 = polyval(p5,xi);
plot(x,y,'*',xi,z1,";grau 1;",xi,z5,";grau 5;")
xlabel('x'),ylabel('y = f(x)')
title('Ajuste de curvas usando polinomios de graus 1 e 5')
disp('Final da Questao 2');






                                                                                                                                                                                                                                                                                                                                                                                   exemplo/ex4.m                                                                                       0000664 0001750 0001750 00000005032 11701041756 012713  0                                                                                                    ustar   avalli                          avalli                                                                                                                                                                                                                 clc
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questao 4: Raizes de Equacoes
%              y = x**2 + 3*x - 4 = 0
%
% Determinar os zeros da equacao usando Newton 
% e diferentes valores para o ponto inicial x0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp("4. Raizes de Equacoes");
printf("Encontrar as raizes de x**2 + 3*x - 4 = 0 usando Newton:\n\n");

function y = f(x)
	% Funcao
	y = x**2 + 3*x - 4;
end
	
function y = df(x)
	% Derivada da Funcao
	y = 2*x + 3;
end

function [x, iter, error] = Newton (x0, epsilon, iterMax)
% Metodo de Newton:
%   Entrada: 
%     x0 = aproximacao inicial
%     epsilon = precisao desejada
%     iterMax = numero de iteracoes maxima
%   Saida:
%     x = raiz
%     iter = numero de iteracoes
%     error = 1 --> nao convergiu
%
	fx = f(x0);
	dfx = df(x0);
	x = x0;
	iter = 0;
	
	dx = epsilon+1;
	while ( (abs(dx) > epsilon || abs(fx) > epsilon) && (abs(dfx) > 10e-6) && (iter < iterMax) )
		dx = -fx / dfx;
		x += dx;		
		fx = f(x);
		dfx = df(x);
		iter++;
	end

	error = 0;
	if (abs(dfx) < 10e-6)
		if abs(fx) < epsilon
			error = 0;
		else
			error = 1;
		end		
	end
end

function DrawFunction (x0, xf)
	% Desenha o grafico da funcao f(x) no intervalo [x0, xf]
	% e mostra graficamente os zeros exatos (-4,1)
	x = x0:0.2:xf;
	for i = 1:length(x)
		y(i) = f(x(i));
		z(i) = 0;
	end	
	plot(-4,0,'*',1,0,'*',x, z , x, y, "--");
end

% mostra os zeros da funcao graficamente
DrawFunction(-5, 5);

% define a precisao e o numero maximo de iteracoes
% para o metodo de Newton
epsilon = 0.0001;
itermax = 200;

% calcula as raizes por Newton e imprime os resultados
%    x0 = aproximacao inicial
%    raiz = root, 
%    iter = numero de iteracoes
%    error = 1 --> nao convergiu

% Calcula as raizes para diferentes valores de x0
x0 = -1.5;
[root, iter, error] = Newton(x0, epsilon, itermax);
if ( error == 1 ) 
	printf("Nao encontrou a raiz com x0 = %f\n",x0);
else
	printf("raiz = %f em %d iteracoes com x0 = %f\n",root,iter,x0);
end

x0 = -3;
[root, iter, error] = Newton(x0, epsilon, itermax);
if ( error == 1 ) 
	printf("Nao encontrou a raiz com x0 = %f\n",x0);
else
	printf("raiz = %f em %d iteracoes com x0 = %f\n",root,iter,x0);
end

x0 = 2;
[root, iter, error] = Newton(x0, epsilon, itermax);
if ( error == 1 ) 
	printf("Nao encontrou a raiz com x0 = %f\n",x0);
else
	printf("raiz = %f em %d iteracoes com x0 = %f\n",root,iter,x0);
end

disp(' ');
disp('Final da Questao 4');

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      exemplo/ex6.m                                                                                       0000664 0001750 0001750 00000004105 11701041300 012676  0                                                                                                    ustar   avalli                          avalli                                                                                                                                                                                                                 clc
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questao 6: Integracao 
%  
%   Calcular as integrais para as funcoes abaixo usando 
%   quadv (Simpson) e quad (Quadratura Gaussiana) disponiveis 
%   no octave
%
%   Funcoes:
%        f(x)=sin(x)*tan(x),   para 0<=x<=1
%        f(x)=x*tan(x),        para 0<=x<=pi/2    
%        f(x)=(1+x^2)^(3/2),   para 0<=x<=1    
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp("6. Integracao");
disp("Calcular as integrais");
disp("f(x)=sin(x)*tan(x), para 0<=x<=1");
disp("f(x)=x*tan(x),      para 0<=x<=pi/2");
disp("f(x)=(1+x^2)^(3/2), para 0<=x<=1");
disp(" ");
disp(" ");

% Calcula as integrais para tres funcoes diferentes e
% imprime o valor exato e aproximados na tela

% primeira funcao
printf("Funcao: f(x)=sin(x)*tan(x), para 0<=x<=1\n")
function y = f(x)
	y=sin(x).*tan(x);
end

printf("Valor exato:                                                  %.8f...\n", 0.38472019)
printf("Valor aproximado usando a funcao quadv (Regra de Simpson):    %.8f...\n", quadv("f", 0, 1))  
printf("Valor aproximado usando a funcao quad (Quadratura Gaussiana): %.8f...\n", quad("f", 0, 1))  
pause

% segunda funcao
printf("\nFuncao: f(x)=x*tan(x), para 0<=x<=pi/2\n")
function y = f(x)
	y=x.*sin(x);
end

printf("Valor exato:                                                  %.8f...\n", 1.0)  
printf("Valor aproximado usando a funcao quadv (Regra de Simpson):    %.8f...\n", quadv("f", 0, pi/2))  
printf("Valor aproximado usando a funcao quad (Quadratura Gaussiana): %.8f...\n", quad("f", 0, pi/2))  
pause

% terceira funcao
printf("\nFuncao: f(x)=(1+x^2)^(3/2), para 0<=x<=1\n")
function y = f(x)
	y=(1.+(x.^2)).^1.5;
end

printf("Valor exato:                                                  %.8f...\n", 1.56795196)
printf("Valor aproximado usando a funcao quadv (Regra de Simpson):    %.8f...\n", quadv("f", 0, 1))  
printf("Valor aproximado usando a funcao quad (Quadratura Gaussiana): %.8f...\n", quad("f", 0, 1))  

disp(' ');
disp('Final da Questao 6');

                                                                                                                                                                                                                                                                                                                                                                                                                                                           exemplo/ex3.m                                                                                       0000664 0001750 0001750 00000003166 13013365300 012710  0                                                                                                    ustar   avalli                          avalli                                                                                                                                                                                                                 clc
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questao 3: Solucao de Equacoes Diferenciais Ordinarias
%                y' = x + y
%                y(0) = 1
% Calcular a solucao pelo metodo de Euler no intervalo [0,4]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('3. Equacoes Diferenciais Ordinarias');
disp(' Resolver o PVI dy/dx = x + y, y(0) = 1');
disp(' pelo metodo de Euler no intervalo [0,4].');
disp(' ');

function w = f (x, y)
	% y' = f (x, y)
	w = x + y;
end

function [VetX, VetY] = Euler (a, b, h, y0)
	% Runge-Kutta de Ordem 1
	x = a;
	y = y0;
	Fxy = f(x, y);
	VetX(1) = x;
	VetY(1) = y;
	
	index = 2;
	
	while (x < b)
		x += h;	
				
		y += h * Fxy;
		Fxy = f(x, y);
		
		VetX(index) = x;
		VetY(index) = y;
		index++;
	end
end

function itemA()	
	h = 0.4;
	index = 1;
	dh = 0.1;

	while h >= 0.1
		% Solucao por Euler
		[x, y] = Euler(0.0, 4.0, h, 1);
		% Solucao exata
		for i = 1:length(x)
			ty(i) = 2 * e**x(i) - (x(i)+1);
		end
		
		% Calcula erro maximo
		error(index) = max(abs(y - ty));
		index++;
		
		% Plota a solucao exata e aproximada
		printf('Exibindo grafico para ');
		h
		plot(x, ty, x, y, x, y,"*");
		title('Runge-Kutta Ordem 1');
		xlabel('x');
		ylabel('y');
		legend('Exata', 'Aproximada');
		disp("Enter para prosseguir...");
		pause;
		
		% Resolve para um h - dh
		h -= dh;
	end
	
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% - Questao 3:
% Equacoes diferenciais ordinarias
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
itemA();
disp('Final da Questao 3');

                                                                                                                                                                                                                                                                                                                                                                                                          exemplo/introd.m                                                                                    0000664 0001750 0001750 00000000633 11700646500 013511  0                                                                                                    ustar   avalli                          avalli                                                                                                                                                                                                                 % Introducao
clc
clear
disp(' ');
disp('Introducao ao Calculo Numerico usando o Octave/Matlab'); 
disp('Prof. Andrea Valli');
disp(' ');
disp('Programa:');
disp('1. Resolucao de Sistemas Lineares');
disp('2. Ajuste de Curvas');
disp('3. Equacoes Diferenciais Ordinarias');
disp('4. Raizes de Equacoes');
disp('5. Interpolacao');
disp('6. Integracao');
disp('7. Introducao ao metodo das diferencas finitas');



                                                                                                     exemplo/._ex1.m                                                                                     0000664 0001750 0001750 00000010000 13017427734 013122  0                                                                                                    ustar   avalli                          avalli                                                                                                                                                                                                                     Mac OS X            	   2  ∞     ‚                                    ATTR;ö…ˇ  ‚   ú   S                  ú   S  com.dropbox.attributes   xú´VJ) /H ØàOÀÃIÕLâœ…ONÃQ≤R®V MLŒ»Ãâ%ñîÅÖRKÅ%Wﬂ®åÄ0£äÃÇ¨¢Ìbèb∑@ü@[[•⁄⁄Z »©y                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                This resource fork intentionally left blank                                                                                                                                                                                                                            ˇˇexemplo/._ex2.m                                                                                     0000664 0001750 0001750 00000010000 13017427734 013123  0                                                                                                    ustar   avalli                          avalli                                                                                                                                                                                                                     Mac OS X            	   2  ∞     ‚                                    ATTR;ö…ˇ  ‚   ú   S                  ú   S  com.dropbox.attributes   xú´VJ) /H ØàOÀÃIÕLâœ…ONÃQ≤R®V MLŒ»Ãâ%ñîÅÖRKÅ•ú≤dÀîl?„Ù‚Ï≤H'œ ‚RÌb∑@[[•⁄⁄Z ”h                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                This resource fork intentionally left blank                                                                                                                                                                                                                            ˇˇexemplo/._ex3.m                                                                                     0000664 0001750 0001750 00000010000 13017427734 013124  0                                                                                                    ustar   avalli                          avalli                                                                                                                                                                                                                     Mac OS X            	   2  ∞     ‚                                    ATTR;ö…ˇ  ‚   ú   S                  ú   S  com.dropbox.attributes   xú´VJ) /H ØàOÀÃIÕLâœ…ONÃQ≤R®V MLŒ»Ãâ%ñîÅÖRKÅ•¬–Ç¨?'«„àD„äêúÃí`G[[•⁄⁄Z …Ÿ|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                This resource fork intentionally left blank                                                                                                                                                                                                                            ˇˇexemplo/._ex4.m                                                                                     0000664 0001750 0001750 00000010000 13017427734 013125  0                                                                                                    ustar   avalli                          avalli                                                                                                                                                                                                                     Mac OS X            	   2  ∞     ‚                                    ATTR;ö…ˇ  ‚   ú   S                  ú   S  com.dropbox.attributes   xú´VJ) /H ØàOÀÃIÕLâœ…ONÃQ≤R®V MLŒ»Ãâ%ñîÅÖRKÅ•˝¸ º"}oÀ,KÔD}ÛCÁr[[•⁄⁄Z º°                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                This resource fork intentionally left blank                                                                                                                                                                                                                            ˇˇexemplo/._ex5.m                                                                                     0000664 0001750 0001750 00000010000 13017427734 013126  0                                                                                                    ustar   avalli                          avalli                                                                                                                                                                                                                     Mac OS X            	   2  ∞     ‚                                    ATTR;ö…ˇ  ‚   ú   S                  ú   S  com.dropbox.attributes   xú´VJ) /H ØàOÀÃIÕLâœ…ONÃQ≤R®V MLŒ»Ãâ%ñîÅÖRKÅ%Á¨
∑“îbØKó|O«`ã,Ør[[•⁄⁄Z «	L                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                This resource fork intentionally left blank                                                                                                                                                                                                                            ˇˇexemplo/._ex6.m                                                                                     0000664 0001750 0001750 00000010000 13017427734 013127  0                                                                                                    ustar   avalli                          avalli                                                                                                                                                                                                                     Mac OS X            	   2  ∞     ‚                                    ATTR;ö…ˇ  ‚   ú   S                  ú   S  com.dropbox.attributes   xú´VJ) /H ØàOÀÃIÕLâœ…ONÃQ≤R®V MLŒ»Ãâ%ñîÅÖRKÅ%∑¬§Hãå*?_è®`èÇCG„ê@[[•⁄⁄Z ∆–?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                This resource fork intentionally left blank                                                                                                                                                                                                                            ˇˇexemplo/._main.m                                                                                    0000664 0001750 0001750 00000010000 13017427734 013351  0                                                                                                    ustar   avalli                          avalli                                                                                                                                                                                                                     Mac OS X            	   2  ∞     ‚                                    ATTR;ö…ˇ  ‚   ú   S                  ú   S  com.dropbox.attributes   xú´VJ) /H ØàOÀÃIÕLâœ…ONÃQ≤R®V MLŒ»Ãâ%ñîÅÖRKÅ%ÀCøRÛ™‰ƒB˜®àBÀHs«r[[•⁄⁄Z √w0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                This resource fork intentionally left blank                                                                                                                                                                                                                            ˇˇexemplo/._dados.m                                                                                   0000664 0001750 0001750 00000010000 13017427734 013517  0                                                                                                    ustar   avalli                          avalli                                                                                                                                                                                                                     Mac OS X            	   2  ∞     ‚                                    ATTR;ö…ˇ  ‚   ú   S                  ú   S  com.dropbox.attributes   xú´VJ) /H ØàOÀÃIÕLâœ…ONÃQ≤R®V MLŒ»Ãâ%ñîÅÖRKÅ%#ã–rØpw”ê‘‹≤äî–,c”dOG[[•⁄⁄Z øS                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                This resource fork intentionally left blank                                                                                                                                                                                                                            ˇˇexemplo/._.DS_Store                                                                                 0000664 0001750 0001750 00000010000 13017427734 013732  0                                                                                                    ustar   avalli                          avalli                                                                                                                                                                                                                     Mac OS X            	   2  ∞     ‚                                   ATTR;ö…ˇ  ‚   x                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           This resource fork intentionally left blank                                                                                                                                                                                                                            ˇˇexemplo/._introd.m                                                                                  0000664 0001750 0001750 00000010000 13017427734 013724  0                                                                                                    ustar   avalli                          avalli                                                                                                                                                                                                                     Mac OS X            	   2  ∞     ‚                                    ATTR;ö…ˇ  ‚   ú   S                  ú   S  com.dropbox.attributes   xú´VJ) /H ØàOÀÃIÕLâœ…ONÃQ≤R®V MLŒ»Ãâ%ñîÅÖRKÅ•§ÇpwØºà–®®"∑JW??É≤@[[•⁄⁄Z »§X                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                This resource fork intentionally left blank                                                                                                                                                                                                                            ˇˇexemplo/._octave-workspace                                                                          0000664 0001750 0001750 00000010000 13017427734 015447  0                                                                                                    ustar   avalli                          avalli                                                                                                                                                                                                                     Mac OS X            	   2  ∞     ‚                                    ATTR;ö…ˇ  ‚   ú   S                  ú   S  com.dropbox.attributes   xú´VJ) /H ØàOÀÃIÕLâœ…ONÃQ≤R®V MLŒ»Ãâ%ñîÅÖRKÅ•‘Jcœ@√“o◊‚‚<À"ÔÄ†dß¢@[[•⁄⁄Z À(∞                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                This resource fork intentionally left blank                                                                                                                                                                                                                            ˇˇexemplo/                                                                                            0000775 0001750 0001750 00000000000 13461564124 012041  5                                                                                                    ustar   avalli                          avalli                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 