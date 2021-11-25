function element = rutkomplement(ruta)
rutvektor = [ruta(1,:) ruta(2,:) ruta(3,:)];
rutvektor = sort(rutvektor);
langd = length(nonzeros(rutvektor));
rutvektor = rutvektor(10-langd:end);
temp = 1:9;
for index = rutvektor
    pos = find(temp == index);
    temp = [temp(1:pos-1) temp(pos+1:end)];
end

element = temp;
            

