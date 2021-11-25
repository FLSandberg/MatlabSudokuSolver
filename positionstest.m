function svar = positionstest(tal,rad,kol,B)
    testkol = B(:,kol);
    testrad = B(rad,:);
    
    ruta = valjruta(rad,kol,B);
    
    if find(testkol == tal) ~= 0
        svar = true;
        return
    end

    if find(testrad == tal) ~= 0
        svar = true;
        return
    end
    
   if find (ruta == tal) ~= 0
       svar = true;
       return
   end
    
   svar = false;