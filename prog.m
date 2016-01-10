[ClearBoard,tf,ccr]=initialBoard();


  
Posittions=initialFirstBoard();


Board=readBoard('2.jpg');
[newP,move]=search_move(Posittions,Board,ClearBoard);
Posittions(move(2,1),move(2,2))=Posittions(move(1,1),move(1,2));
Posittions(move(1,1),move(1,2))='0';

Posittions=newP;
Board=readBoard('3.jpg');

[newP,move]=search_move(Posittions,Board,ClearBoard);
Posittions(move(2,1),move(2,2))=Posittions(move(1,1),move(1,2));
Posittions(move(1,1),move(1,2))='0';

Board=readBoard(tforms,croprect,'4.jpg');
[newP,move]=search_move(Posittions,Board,ClearBoard);
Posittions(move(2,1),move(2,2))=Posittions(move(1,1),move(1,2));
Posittions(move(1,1),move(1,2))='0';

Board=readBoard(tforms,croprect,'5.jpg');
[newP,move]=search_move(Posittions,Board,ClearBoard);
Posittions(move(2,1),move(2,2))=Posittions(move(1,1),move(1,2));
Posittions(move(1,1),move(1,2))='0';

Board=readBoard(tforms,croprect,'6.jpg');
[newP,move]=search_move(Posittions,Board,ClearBoard);
Posittions(move(2,1),move(2,2))=Posittions(move(1,1),move(1,2));
Posittions(move(1,1),move(1,2))='0';

Board=readBoard(tforms,croprect,'7.jpg');
[newP,move]=search_move(Posittions,Board,ClearBoard);
Posittions(move(2,1),move(2,2))=Posittions(move(1,1),move(1,2));
Posittions(move(1,1),move(1,2))='0';

Board=readBoard(tforms,croprect,'8.jpg');
[newP,move]=search_move(Posittions,Board,ClearBoard);
Posittions(move(2,1),move(2,2))=Posittions(move(1,1),move(1,2));
Posittions(move(1,1),move(1,2))='0';

Board=readBoard(tforms,croprect,'9.jpg');
[newP,move]=search_move(Posittions,Board,ClearBoard);
Posittions(move(2,1),move(2,2))=Posittions(move(1,1),move(1,2));
Posittions(move(1,1),move(1,2))='0';