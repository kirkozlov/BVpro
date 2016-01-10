function [ Treshold ] = makeClearTreshold( ClearBoard )

for ooy=0:7
   for oox=0:7
       rect=[60+oox*100,60+ooy*100,80,80];
       A1=rgb2gray(imcrop(ClearBoard,rect));

end

