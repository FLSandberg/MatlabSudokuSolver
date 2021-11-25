%
%            - - - - SUDOKU-SOLVER 3000 - - - - 
%
% L�ser med ineffektiva men fungerande metoder en 9x9-sudoku. 
%
% Anropas med en 9x9-matris som argument, d�r de ok�nda rutorna markeras
% med f�rslagsvis en nolla. Det andra argumentet s�tts till true/false, och
% styr huruvida man vill plotta sudokun medan den l�ses eller ej. Att
% plotta l�sningen i varje steg tar avsev�rt mycket l�ngre tid i anspr�k �n 
% att l�ta bli. En maxgr�ns p� 60 sekunder �r satt f�r hur l�nge den kommer att plottas.
% Efter 60 sekunder �verg�r funktionen till att endast utf�ra ber�kningen.
%
% Efter 120 sekunder avbryts iterationen automatiskt, vare sig den har plottats eller ej. 
% 
% Ber�kningstider kan f�r sv�ra sudokus uppg� till n�gon minut. 
%
% (c) Andreas M Sandberg 21-22 Nov 2005 

function C = sudoku(A,rita);

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
backa = false;
t0 = clock;

hold on
while rad < 10 & kol < 10
    it = it + 1;
    if rita == true & etime(clock,t0) > 60
        disp('Slutade rita efter 60 sekunder')
        antal_iterationer_vid_ritstopp = it
        rita = false;
    elseif etime(clock,t0) > 180
        disp('Avbr�t ber�kningen efter 180 sekunder')
        break
    end
    
    if pos(rad,kol) == 1 & backa == false
        if rad == 9
            rad = 1;
            kol = kol + 1;
        else
            rad = rad + 1;
        end
    elseif backa == true
        if rad == 1
           rad = 9;
           kol = kol - 1;
        else
           rad = rad - 1;
        end
            if pos(rad,kol) == 0 % om vi f�r �ndra 
                heltal = B(rad,kol);
                backa = false;
            end
        
    else
        if positionstest(heltal,rad,kol,B)
            %om heltal == 9
            %g� bak�t till ickeabsolut, l�s av heltal = B(rad,kol) + 1,
            %forts�tt
            if heltal == 9
                backa = true; %flagga f�r att backa 
                B(rad,kol) = 0; %nollst�ll    
            else
                heltal = heltal + 1;
            end
        else
            B(rad,kol) = heltal;
            if rita == true
                sudokuplot(rad,kol,heltal,[0.5 0.5 0.9])
            end
            heltal = 1;
            if rad == 9
                rad = 1;
                kol = kol + 1;
            else
                rad = rad + 1;
            end
        end
    end
end
hold off
sudokuplotA(B)
antal_iterationer = it
berakningstid = etime(clock,t0)
C = B;
        
    