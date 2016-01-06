[ClearBoard,tforms,croprect]=initialBoard();


  
Posittions=initialFirstBoard();
Board=readBoard(tforms,croprect);


[newP,move]=search_move(Posittions,Board,ClearBoard)

