% Função que realiza o módulo PD
% flag = 1 para imprimir a relação dose-efeito; flag = 0 para não imprimir
% Nota: Para a relação dose-efeito inicializar dose = 3
function u = p2(c2, flag)
  c50 = 7.1903;
  t=size(c2);
  t(2);
  u=zeros(1,t(2));
  
  for k=1:t(2);
    tempo(k)=k-1;
    u(k) = c2(k) / (c50 + c2(k));
  end
  
  % Impressão do gráfico efeito-concentração
  figure(2);
  plot(c2,u);
  xlabel('Concentração (mg/kg)','FontSize',12);
  ylabel('Efeito','FontSize',12);
  title('Efeito por Concentração','FontSize',12);
  hold off
  p2_graf_tempo(c2, flag);
end

% Função que imprime o gráfico efeito-tempo
function p2_graf_tempo(conc, flag)
  c50 = 7.1903;
  t=size(conc);
  t(2);
  u=zeros(1,t(2));
  tempo=zeros(1, t(2));
  z=3;
  conta=1;
  
  for conta=1:8;
  
  for k=1:t(2);
    tempo(k)=k-1;
    u(k) = conc(k) / (c50 + conc(k));
  end
  
    figure(3);
    plot(tempo,u);
    z=z+10;
    conc = p1(0,6,10,z,[0]);
    hold on
  if(flag==0)
      break;
  end
  end
  
  xlabel('Dias','FontSize',12)
  ylabel('Efeito','FontSize',12)
  title('Evolução do Efeito','FontSize',12)
  % Caso se queira comparar a relação entre a concentração e diferentes valores de doses
  if(flag==1)
  legend('d=3','d=13','d=23','d=33','d=43','d=53','d=63','d=73','Location','Southeast');
  end
  % Caso se queira observar a relação entre a concentração e a dose original
  if(flag==0)
  legend('Efeito','Location','Southeast');
  end
  
  hold off
    
end
    