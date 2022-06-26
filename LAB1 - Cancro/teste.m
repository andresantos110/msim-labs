function d2 = (espacamento, ndoses, dose)
  
  size = ndoses*espacamento;
  d2(1)=dose;
  intervalo1 = 6;
  intervalo2 = 14;
  nrep = 3;
  
  for k=1:size;
    for(l=1:intervalo1 *nrep )
      if((mod(l,intervalo1))==0) d2(l+1) = dose;
      else d2(l+1) = 0;
      end
    end
   if((mod((k-intervalo1*nrep),intervalo2))==0) d2(k+1) = dose;
      else d2(k+1) = 0;
      end
   end
  
  end
 
 