% Função que realiza o conjunto dos módulos
% flag1 = 1 para imprimir gráfico concentração-tempo; flag1 = 0 para não imprimir
% flag2 = 1 para imprimir o gráfico com a relação dose-efeito; flag2 = 0 para não imprimir
% flag3 é a variável de controlo que indica a iteração da função p4
% flag4 é a variável de controlo que nos guarda a função p4 óptima e nos permite não repetir os ciclos if's
% faz4b é a variável que realiza a alínea 4b)
% Nota: Para realizar o 4b) comecar flag1=0; flag2=0; flag3=0; flag4=0;fazb=1
function [v,t] = p4(flag1, flag2, flag3, flag4, faz4b, espacamento, ndoses, dose)
  
  c2 = p1(flag1,espacamento,ndoses,dose,[0]);
  u = p2(c2, flag2);
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
 if((flag3==0)&&(flag4==0)) 
 figure(4);
 x=plot(t,v);
 xlabel('Dias','FontSize',12);
 ylabel('Volume do Tumor (mm^3)','FontSize',12);
 title('Evolução do volume do tumor','FontSize',12);
 legend('v(t)','Location','Southeast');
 end

 if(faz4b==1)
 % Resolução da alínea b)
 % Caso o volume de tumor no dia 25 esteja acima dos 10% ajusta-se o intervalo da toma de doses
 if((1+(espacamento*ndoses)>26)&&(flag4==0))
     if(v(26)>0.1)
        if(espacamento==0)
           return
        end 
        p4(0,0,flag3+1,0,1,espacamento-1,ndoses,dose);
     else
 % Neste ponto do código encontrou-se uma função p4 com o volume óptimo
 % Impressão do gráfico volume de tumor-tempo ao qual as condições se aplicam
          [novo_v,t]=p4(0,0,flag3-1,1,1, espacamento+1,ndoses,dose);         
          figure(5);
          plot(t,novo_v);
          xlabel('Dias','FontSize',12);
          ylabel('Volume do Tumor (mm^3)','FontSize',12);
          title('Evolução do volume do tumor (versão alterada)','FontSize',12);
          legend('v(t)','Location','Southeast');
     end
 else if((1+(espacamento*ndoses)<26)&&(flag4==0))
 % Neste ponto do código encontrou-se uma função p4 com o volume óptimo
 % Impressão do gráfico volume de tumor-tempo ao qual as condições se aplicam
          novo_v=p4(0,0,flag3-1,1,1, espacamento+1,ndoses,dose);
          [novo_v,t]=p4(0,0,flag3-1,1,1,espacamento+1,ndoses,dose);  
          hold on
          figure(5);
          plot(t,novo_v);
          xlabel('Dias','FontSize',12);
          ylabel('Volume do Tumor (mm^3)','FontSize',12);
          title('Evolução do volume do tumor (versão alterada)','FontSize',12);
          legend('v(t)','Location','Southeast');
     end
 end

 end
 
end
  
  % Função que corresponde a d/dt[V]
  function eqLog = tTumor(v, u)
    a = 0.09; 
    b = 1;
    kt = 10;
    eqLog = a*v*(1-v/kt)-b*u*v;
  end
 
 
