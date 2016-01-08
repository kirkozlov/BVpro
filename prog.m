[ClearBoard,tforms,croprect]=initialBoard();


  
Posittions=initialFirstBoard();
Board=readBoard(tforms,croprect);


[newP,move]=search_move(Posittions,Board,ClearBoard);
Posittions(move(2,1),move(2,2))=Posittions(move(1,1),move(1,2));
Posittions(move(1,1),move(1,2))='0';