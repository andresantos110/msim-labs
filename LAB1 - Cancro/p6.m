
function p6maybe(c2)
  c50 = 7.1903;
  t=size(c2);
  u=zeros(1,t(2));
  v=zeros(1,t(2));
  r=zeros(1,t(2));
  limiar = 1;
  h=1;
  v(1)=1;
  
  % Determinação do vetor resistência
  % a partir da concentração de efeito
  for k=1:t(2)
    if(c2(k) < limiar && c2(k) ~= 0)
    r(k) = c2(k);
    else
    r(k) = 0;
    end
  end

  for k=1:t(2)
    u(k) = (c2(k) / (c50 + c2(k))) * (1-r(k));
  end
   
  for k=1:t(2)-1
    t(k+1)=k*h;
    v(k+1) = v(k) + h * tTumor(v(k), u(k));
  end
  
  figure(4);
  hold on
  plot(t,v);
  xlabel('Dias','FontSize',12);
  ylabel('Volume do Tumor (mm^3)','FontSize',12);
  title('Evolução do volume do tumor','FontSize',12);
  legend('v(t)','Location','Southeast');
  hold off
 
    figure(5)
    hold on
    plot(t,u);
    xlabel('Tempo [Dias]', 'FontSize', 12)
    ylabel('Efeito', 'FontSize', 12)
    title('Efeito por Tempo', 'FontSize', 12)
    hold off
    
    figure(6)
    hold on
    plot(t,r);
    xlabel('Tempo [Dias]', 'FontSize', 12)
    ylabel('Resistência', 'FontSize', 12)
    title('Resistência por Tempo', 'FontSize', 12)
    hold off
 
 
 end
   
  
  
  function eqLog = tTumor(v, u)
    a = 0.09; 
    b = 1;
    kt = 10;
    eqLog = a*v*(1-v/kt)-b*u*v;
  end