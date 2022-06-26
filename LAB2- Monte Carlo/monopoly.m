function monopoly(NMC, Njogadas, Ndiscard)

%Inicialização de variáveis
 Ncasas=7;
 z=zeros(1,Ncasas);
 aluguer = [10 10 0 15 20 25 35];
 x=0;
 avanca=0;
 zfreq=zeros(1,Ncasas);
 lucro_medio=zeros(1,Ncasas);
 jogadas_uteis=Njogadas-Ndiscard;
 cara_ou_coroa=zeros(1,jogadas_uteis);
 v4=zeros(1,Njogadas);
 
 %prob_inst = zeros(max(size(Ndiscard+1:Njogadas)),NMC);
 
rand('state',0);

 for k=1:NMC
    y=zeros(1,jogadas_uteis);
    x=0;
    
    for j=1:Ndiscard
        avanca=round(rand)+1;
        if(x == 4)
          v4(j) = v4(j)+1;
        end
        x=move(x,avanca);
    end
    
    for t=1:(jogadas_uteis)
        avanca=round(rand)+1;
        cara_ou_coroa(t)=avanca;
        if(x == 4)
          v4(t+Ndiscard) = v4(t+Ndiscard)+1;
        end
        x=move(x,avanca);   
        y(t)=x;
        z(x)=z(x)+1;
   
    end
      
 end
 
 for m=1:Ncasas
     zfreq(m)=z(m)/(jogadas_uteis*NMC);
     lucro_medio(m)=zfreq(m)*aluguer(m);
 end
 
 % Problema 1a)
 
 figure(1);
 graf1=bar(y);
 xlabel('Jogadas','FontSize',12);
 ylabel('Estado','FontSize',12);
 figure(2);
 graf2=bar(cara_ou_coroa);
 xlabel('Jogadas','FontSize',12);
 ylabel('Face da moeda','FontSize',12);
 
 % Problema 1b)
 figure(3);
 graf3=bar(zfreq);
 xlabel('Estado','FontSize',12);
 ylabel('Frequência','FontSize',12);
 
 % Problema 1c)
 figure(4);
 graf4=bar(lucro_medio);
 xlabel('Estado','FontSize',12);
 ylabel('Lucro','FontSize',12);
 
 % Problema 3
 figure(5);
 for k=1:Njogadas
   v4(k) = v4(k)/NMC;
 end
 graf5 = bar(v4);
 xlabel('Jogada','FontSize',12);
 ylabel('Probabilidade','FontSize',12);
 
end
 
 % Função que simula a mudança de estado
 function x = move(x,avanca)
     
      switch(x)
        case {0,1,2,3,4}
            if(avanca==1)
                x=x+1;
            else
                x=x+2;
            end
                
        case 5
            if(avanca==1)
                x=x+1;
            else
                x=3;
            end
        
        case 6
            if(avanca==1)
                x=3;
            else
                x=x+1;
            end
        
        case 7
            if(avanca==1)
                x=1;
            else
                x=2;
            end
            
          otherwise
              ('You left the board.');
      end

 end