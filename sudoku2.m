%
%           - - - FAST SUDOKU-SOLVER - - - 
% L�ser enkla till medelsv�ra sudokus med en snabb algoritm. 
%
% OBS! Sv�rare sudokus kan ibland ej l�sas. I detta fall 
% f�rflyttas ber�kningen till funktionen "sudoku".
%
% (c) Andreas Sandberg 25-26 Nov 2005

function C = sudoku2(A,rita);

close all

for rad = 1:9
    for kol = 1:9
        if A(rad,kol) == 0
            pos(rad,kol) = 0;
        else
            pos(rad,kol) = 1;
        end
    end
end

rad = 1; kol = 1; heltal = 1;
it = 1;

B = A; %arbetar p� B
if rita == true
    sudokuplotA(B)
    hold on
end

t0 = clock;
flag2 = 0;
while it < 400
    it = it + 1;
    if rita == true & etime(clock,t0) > 60
        disp('Slutade rita efter 60 sekunder')
        antal_iterationer_vid_ritstopp = it
        rita = false;
    end
    
    testkol = B(:,kol);
    testrad = B(rad,:);
    rutaB = valjruta(rad,kol,B);
    rutapos = valjruta(rad,kol,pos);
    
    % skapa en funktion som returnerar de element som INTE finns i en ruta
    % testa dessa element ett i g�ngen, se p� hur m�nga st�llen det f�r
    % plats. F�r det plats endast en g�ng, s�tt B och pos r�tt. Forts�tt
    % tills elementen g�tts igenom, flytta sedan till n�sta ruta.
    testelement = rutkomplement(rutaB);
    flag = 0;
    for heltal = testelement
        for rutrad = 1:3
            trad = rad + rutrad - 1;
            for rutkol = 1:3
                tkol = kol + rutkol - 1;
                if pos(trad,tkol) == 0
                    if positionstest(heltal,trad,tkol,B) == false
                        flag = flag + 1;
                        brad = trad; bkol = tkol;
                    end
                end
            end
        end
        if flag == 1
            B(brad,bkol) = heltal;
            pos(brad,bkol) = 1;
            if rita == true
                sudokuplot(brad,bkol,heltal,[0.9 0.5 0.5]);
            end
            flag2 = 0;
        end
        flag = 0;
    end
    
    %flytta till n�sta ruta
    if kol == 7 & rad == 7
        if find(B==0) ~= 0
            kol = 1; rad = 1;
        else
            C = B;
            sudokuplotA(B)
            antal_iterationer = it
            return
        end
    elseif rad == 7
        flag2 = flag2 + 1;
        rad = 1;
        kol = kol + 3;
    else
        flag2 = flag2 + 1;
        rad = rad + 3;
    end
    if flag2 > 10
        antal_iterationer_med_sudoku2 = it
        break
    end
end
disp('Sudokun kunde inte l�sas med "sudoku2". Funktionen "sudoku" anv�nds f�r att slutf�ra ber�kningen.')
   
C = sudoku(B,rita);
            
        
    