function sudokuplot(rad,kol,heltal,farg)
xgr=fliplr(-0.7:0.2:0.9);
ygr=(-0.7:0.2:0.9);

h = fill([ygr(kol)+0.05 ygr(kol)-0.05 ygr(kol)-0.05 ygr(kol)+0.05],[xgr(rad)-0.05 xgr(rad)-0.05 xgr(rad)+0.05 xgr(rad)+0.05],[0.8 0.9 1]);
set(h,'EdgeColor',[0.8 0.9 1]);
h = text(ygr(kol),xgr(rad),num2str(heltal));
set(h,'Color',farg);
drawnow