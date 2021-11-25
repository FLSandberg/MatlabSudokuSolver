function ruta = valjruta(rad,kol,B)


    if rad >= 1 & rad <= 3
        if kol >= 1 & kol <= 3
            ruta = B(1:3,1:3);
        elseif kol >= 4 & kol <= 6
            ruta = B(1:3,4:6);
        else
            ruta = B(1:3,7:9);
        end
    elseif rad >= 4 & rad <= 6
        if kol >= 1 & kol <= 3
            ruta = B(4:6,1:3);
        elseif kol >= 4 & kol <= 6
            ruta = B(4:6,4:6);
        else
            ruta = B(4:6,7:9);
        end
    else
        if kol >= 1 & kol <= 3
            ruta = B(7:9,1:3);
        elseif kol >= 4 & kol <= 6
            ruta = B(7:9,4:6);
        else
            ruta = B(7:9,7:9);
        end
    end