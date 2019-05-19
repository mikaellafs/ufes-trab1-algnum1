## Copyright (C) 2019 gabri
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} main (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: gabri <gabri@LAPTOP-GDFUG9L9>
## Created: 2019-05-12

function retval = main (input1, input2)
  continuar = 1;
  while(continuar)
    escolha = menu("Escolha o que quer resolver","Sistema Linear - Exercicio_1","Sistema Linear - Exercicio_2","Ajuste - Exercicio_3");
    switch escolha
      case 1
       source("script1.m")
      case 2
       source("script2.m")
      case 3
        source("script3.m")
    endswitch
    continuar = yes_or_no("Continuar?");
  end 
endfunction
