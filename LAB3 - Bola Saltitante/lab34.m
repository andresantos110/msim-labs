function lab34

    x1=30;
    
    sim ('bola_saltitonaP41');
    plot (y,z);
    hold on
    sim ('bola_saltitonaP4');
    plot (y,z);
    
    line([x1, x1], ylim);
    legend('atenuação=0.8','sem atenuação')
    xlabel('y[m]'); 
    ylabel('z[m]');
  
end 