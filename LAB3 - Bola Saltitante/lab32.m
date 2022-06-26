function lab32

  sim ('bola_saltitonaP2');
  
  figure (1)
  Tfinal=5;
  axis([0 Tfinal 0 10])
  hold on
  curve=animatedline;
  set(gca,'Xlim',[0 Tfinal])
  for ii=1:length(t)
   addpoints(curve,t(ii),z(ii));
   drawnow
   pause(0.01)
  end
  hold off
    
end 