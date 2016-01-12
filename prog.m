%[ClearBoard,tf,ccr]=initialBoard();
 
Posittions=initialFirstBoard();

Board=readBoard('2.jpg');
[ newP,move,Anzahl,treshold ] = searchmoveWithCany( Board, Posittions,32,0.15,1 );
Posittions=newP;

Board=readBoard('3.jpg');
[ newP,move,Anzahl,treshold ] = searchmoveWithCany( Board, Posittions,32,0.15,0 );
Posittions=newP;

Board=readBoard('4.jpg');
[ newP,move,Anzahl,treshold ] = searchmoveWithCany( Board, Posittions,32,0.15,1 );
Posittions=newP;
Board=readBoard('5.jpg');
[ newP,move,Anzahl,treshold ] = searchmoveWithCany( Board, Posittions,Anzahl,0.15,0 );
Posittions=newP;

Board=readBoard('6.jpg');
[ newP,move,Anzahl,treshold ] = searchmoveWithCany( Board, Posittions,Anzahl,0.15,1 );
Posittions=newP;

Board=readBoard('7.jpg');
[ newP,move,Anzahl,treshold ] = searchmoveWithCany( Board, Posittions,Anzahl,0.15,0 );
Posittions=newP;
Board=readBoard('8.jpg');
[ newP,move,Anzahl,treshold ] = searchmoveWithCany( Board, Posittions,Anzahl,0.15,1 );
Posittions=newP;

Board=readBoard('9.jpg');
[ newP,move,Anzahl,treshold ] = searchmoveWithCany( Board, Posittions,Anzahl,0.15,0 );
Posittions=newP;

Board=readBoard('10.jpg');
[ newP,move,Anzahl,treshold ] = searchmoveWithCany( Board, Posittions,Anzahl,0.15,1 );
Posittions=newP;