function sudokuplotA(A)
clf
xgr=fliplr(-0.7:0.2:0.9);
ygr=(-0.7:0.2:0.9);

for rad = 1:9
    for kol = 1:9
        if A(rad,kol) ~= 0
            text(ygr(kol),xgr(rad),num2str(A(rad,kol)))
        end
    end
end
axis([-0.8 1 -0.8 1])
line([-0.2 -0.2],[-0.8 1.0])
line([0.4 0.4],[-0.8 1.0])
line([-0.8 1.0],[-0.2 -0.2])
line([-0.8 1.0],[0.4 0.4])
axis off
h = gcf;
set(h,'Color',[0.8 0.9 1])
drawnow