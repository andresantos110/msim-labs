function lab31

  sim ('bola_saltitonaP1');
  
  figure(1)
  plot (t,z);
  hold on
  
  sim ('bola_saltitonaP12');
  figure(1)
  plot (t,z);
  
  hold on
  
  sim ('bola_saltitonaP13');
  figure(1)
  plot (t,z);
  
  legend('v=0','v=15','v=-15')
  xlabel('tempo[s]'); 
  ylabel('z[m]');
  
end 