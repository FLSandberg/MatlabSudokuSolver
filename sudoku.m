%
%            - - - - SUDOKU-SOLVER 3000 - - - - 
%
% Löser med ineffektiva men fungerande metoder en 9x9-sudoku. 
%
% Anropas med en 9x9-matris som argument, där de okända rutorna markeras
% med förslagsvis en nolla. Det andra argumentet sätts till true/false, och
% styr huruvida man vill plotta sudokun medan den löses eller ej. Att
% plotta lösningen i varje steg tar avsevärt mycket längre tid i anspråk än 
% att låta bli. En maxgräns på 60 sekunder är satt för hur länge den kommer att plottas.
% Efter 60 sekunder övergår funktionen till att endast utföra beräkningen.
%
% Efter 120 sekunder avbryts iterationen automatiskt, vare sig den har plottats eller ej. 
% 
% Beräkningstider kan för svåra sudokus uppgå till någon minut. 
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

B = A; %arbetar på B
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
        disp('Avbröt beräkningen efter 180 sekunder')
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
            if pos(rad,kol) == 0 % om vi får ändra 
                heltal = B(rad,kol);
                backa = false;
            end
        
    else
        if positionstest(heltal,rad,kol,B)
            %om heltal == 9
            %gå bakåt till ickeabsolut, läs av heltal = B(rad,kol) + 1,
            %fortsätt
            if heltal == 9
                backa = true; %flagga för att backa 
                B(rad,kol) = 0; %nollställ    
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
        
    