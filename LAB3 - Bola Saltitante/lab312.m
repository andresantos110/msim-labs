function lab312

  sim ('bola_saltitonaP1');
    
    figure(1)
    plot (t,z);
    hold on
  
    sim ('bola_saltitonaP14');
  
    figure(1)
    plot (t,z);
    
    legend('atenuação=0.8','atenuação=0.5')
    
    xlabel('t [s]');
    ylabel('z [m]'); 
    
end