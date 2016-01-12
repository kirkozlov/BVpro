function [ FigurMatrix,Anzahl,tresholdb ] = cannyForFigurDetection( Board, oldFigurAnzal,oldtreshold)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


    tresholda=0.10;
    tresholdb=0.20;
    tresholdc=0.15;
    EdgeA=edge(rgb2gray(Board),'Canny',tresholdc);
    for ooy=0:7
        for oox=0:7 
            rect=[65+oox*100,65+ooy*100,70,70];
            A1=imcrop(EdgeA,rect);
            %m=sum(sum(sum(A1)));
            %imshow(A1);
            if(sum(sum(A1))>0)
                tempFM(ooy+1,oox+1)=true;
            else
                tempFM(ooy+1,oox+1)=false;
            end
        end
    end
    Anzahl=sum(sum(tempFM));
    FigurMatrix=tempFM;
end

