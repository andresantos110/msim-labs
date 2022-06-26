function [v,t] = p5(espacamento, ndoses, dose)
  
  d = gerad(espacamento, ndoses, dose);
  
  c2 = p1(0,espacamento,ndoses,dose,d);
  u = p2(c2,0);
  lim = size(u);
  h=1;
  v=zeros(1,lim(2));
  v(1)=1;
  t=zeros(1,lim(2));
  
  % Realização do Módulo CT para o dia k
  for k=1:lim(2)-1
    t(k+1)=k*h;
    v(k+1) = v(k) + h * tTumor(v(k), u(k));
  end
  
 % Impressão do gráfico volume de tumor-tempo resultante da dose original
  
 figure(4);
 x=plot(t,v,t,d);
 xlabel('Dias','FontSize',12);
 ylabel('Volume do Tumor (mm^3)','FontSize',12);
 %title('Evolução do volume do tumor','FontSize',12);
 legend('v(t)','Location','Southeast');
 
 
end
  
  % Função que corresponde a d/dt[V]
  function eqLog = tTumor(v, u)
    a = 0.09; 
    b = 1;
    kt = 10;
    eqLog = a*v*(1-v/kt)-b*u*v;
  end
  
  % Função que corresponde gera um vetor d variável
  function d2 = gerad(espacamento, ndoses, dose)
  
  size = ndoses*espacamento;
  d2(1)=dose;
  intervalo1 = 4; % Primeiro espaçamento entre doses
  intervalo2 = 20; % Segundo espaçamento entre doses
  nrep = 5; % Número de repetições do primeiro espaçamento
  
  for k=1:size
    for l=1:intervalo1 *nrep  %Número de vezes que é repetido o primeiro espaçamento
      if((mod(l,intervalo1))==0) d2(l+1) = dose; % Criação do vetor d
      else d2(l+1) = 0; 
      end
    end
   if((mod((k-intervalo1*nrep),intervalo2))==0) d2(k+1) = dose; % Criação do vetor d
      else d2(k+1) = 0;
      end
   end
  
  end
 