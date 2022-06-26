% Função que realiza o módulo PK
% flag = 1 para imprimir gráfico; flag = 0 para não imprimir
% espacamento = intervalo entre doses
% ndoses = numero de doses
% d = vetor de toma das doses
function c2 = p1(flag, espacamento, ndoses, dose, d)
  
  % condicao necessario para o P5
  % caso o vetor d venha vazio é criado um novo com espacamento constante
  if(d(1)==0)
  d = zeros(1,ndoses*espacamento);
    for k=1:espacamento:ndoses*espacamento    
        d(k) = dose;
    end
  end
  c1 = zeros(1, ndoses*espacamento);
  c2 = zeros(1, ndoses*espacamento);
  t = zeros(1, ndoses*espacamento);
  h=1;
  lim=ndoses*espacamento;
  d(end+1) = 0;
 
  % Realização do módulo PK para o dia k
  for k=1:lim
    t(k+1)= k*h;
    c1(k+1) = c1(k) + f1(c1(k),c2(k),d(k)) * h;
    c2(k+1) = c2(k) + f2(c1(k),c2(k)) * h;
  end
  
  if(flag==1)
  figure(1);
  hold on
  g1=plot(t,c1);
  g2=plot(t,c2);
  gd=plot(t,d);
  set(g1,'LineWidth',1.5);
  set(g2,'LineWidth',1.5);
  set(gd,'LineWidth',1.5);
  xlabel('Dias','FontSize',12);
  ylabel('Concentração (mg/kg)','FontSize',12);
  title('Concentração por Tempo','FontSize',12);
  legend('c1(t)','c2(t)','d(t)','Location','Southeast');
  hold off
  end
  
end
 
% Função que corresponde à primeira equação da matriz (igual a d/dt[c1] )
  function out = f1(c1,c2,d)
    K12 = 0.3*3600;
    K21 = 0.2455*3600;
    K10 = 0.0643*3600;
    V1 = 3110;
    delta = 1000;
    
    % f1 - Retorno da primeira equação da matriz (igual a d/dt[c1])
    out = 1/V1 * (-K12-K10) * c1 + 1/V1 * K21 * c2 + 1/V1 * delta * d;
    
  end
  
% Função que corresponde à segunda equação da matriz (igual a d/dt[c2])
  function out = f2(c1,c2)
    K12 = 0.3*3600;
    K21 = 0.2455*3600;
    K10 = 0.0643*3600;
    V2 = 3110;
    delta = 1000;
    
    % f2 - Retorno da primeira equação da matriz (igual a d/dt[c2])
    out = 1/V2 * K12 * c1 - 1/V2 * K21 * c2;
    
  end
