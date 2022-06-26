% Fun��o que realiza o m�dulo PD
% flag = 1 para imprimir a rela��o dose-efeito; flag = 0 para n�o imprimir
% Nota: Para a rela��o dose-efeito inicializar dose = 3
function u = p2(c2, flag)
  c50 = 7.1903;
  t=size(c2);
  t(2);
  u=zeros(1,t(2));
  
  for k=1:t(2);
    tempo(k)=k-1;
    u(k) = c2(k) / (c50 + c2(k));
  end
  
  % Impress�o do gr�fico efeito-concentra��o
  figure(2);
  plot(c2,u);
  xlabel('Concentra��o (mg/kg)','FontSize',12);
  ylabel('Efeito','FontSize',12);
  title('Efeito por Concentra��o','FontSize',12);
  hold off
  p2_graf_tempo(c2, flag);
end

% Fun��o que imprime o gr�fico efeito-tempo
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
  title('Evolu��o do Efeito','FontSize',12)
  % Caso se queira comparar a rela��o entre a concentra��o e diferentes valores de doses
  if(flag==1)
  legend('d=3','d=13','d=23','d=33','d=43','d=53','d=63','d=73','Location','Southeast');
  end
  % Caso se queira observar a rela��o entre a concentra��o e a dose original
  if(flag==0)
  legend('Efeito','Location','Southeast');
  end
  
  hold off
    
end
    