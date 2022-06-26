function lab33

   x1=35;

  sim ('bola_saltitonaP3');
  
  figure(1)
  plot (y,v);
  hold on
  
  figure(2)
  plot (y,z);
  hold on
  
  sim ('bola_saltitonaP31');
  
  figure(1)
  plot (y,v,'--');
  line([x1, x1], ylim);
  legend('atenuação=0.4','atenuação=0.8');
  xlabel('y[m]'); 
  ylabel('v[m\s]');
  hold on
  
  figure(2)
  plot (y,z,'--');
    
  line([x1, x1], ylim); 
  legend('atenuação=0.4','atenuação=0.8');
  xlabel('y[m]'); 
  ylabel('z[m]');
  
end
 