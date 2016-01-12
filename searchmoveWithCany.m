function [ newP,move,Anzahl,treshold ] = searchmoveWithCany( Board, oldPosition,oldAnzahl,oldtreshold,ColorMove )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[FigurMatrix,Anzahl,treshold]=cannyForFigurDetection(Board,oldAnzahl,oldtreshold);
trW=130;
trB=85;
if(oldAnzahl==Anzahl)
    flagfrom=0;
    flagto=0;
    for ooy=0:7
        for oox=0:7
            if(FigurMatrix(ooy+1,oox+1)==0 && oldPosition(ooy+1,oox+1)~='0')
                if(flagfrom==1)
                    from2=[ooy+1,oox+1];
                    flagfrom=2;
                elseif(flagfrom==0)
                    from=[ooy+1,oox+1];
                    flagfrom=1;
                else
                    %fehler
                end
            end
            if(FigurMatrix(ooy+1,oox+1)==1 && oldPosition(ooy+1,oox+1)=='0')
                if(flagto==1)
                    to2=[ooy+1,oox+1];
                    flagto=2;
                elseif(flagto==0)
                    to=[ooy+1,oox+1];
                    flagto=1;
                else
                    %fehler
                end
            end
        end
    end
    if(flagfrom==2 && flagto==2)
        move=[from;to2;from2;to];
        oldPosition(to2(1),to2(2))=oldPosition(from(1),from(2));
        oldPosition(from(1),from(2))='0';
        oldPosition(to(1),to(2))=oldPosition(from2(1),from2(2));
        oldPosition(from2(1),from2(2))='0';
        newP=oldPosition;
    elseif(flagfrom==1 && flagto==1)
        move=[from;to];
        oldPosition(to(1),to(2))=oldPosition(from(1),from(2));
        oldPosition(from(1),from(2))='0';
        newP=oldPosition;
    else
        %fehler
    end
elseif(Anzahl+1==oldAnzahl)
    flagfrom=0;
    flagto=0;
    Col=true;
        for ooy=0:7
            Col=~Col;
            for oox=0:7
                Col=~Col;
                oldFigure=oldPosition(ooy+1,oox+1);
                if(FigurMatrix(ooy+1,oox+1)==0 && oldPosition(ooy+1,oox+1)~='0')
                    from=[ooy+1,oox+1];
                    flagfrom=flagfrom+1;
                elseif(FigurMatrix(ooy+1,oox+1)==1)
                    if(ColorMove==1 && (oldFigure=='2' || oldFigure=='4' || oldFigure=='6' || oldFigure=='8' || oldFigure=='A' || oldFigure=='C' ))
                        rect=[65+oox*100,65+ooy*100,70,70];
                        A1=rgb2gray(imcrop(Board,rect));
                        s=std2(A1);
                        m=mean(mean(A1));
                        if(Col)
                           if(m>trW)
                               to=[ooy+1,oox+1];
                               flagto=flagto+1;
                           end
                        else
                           if(m>trB)
                               to=[ooy+1,oox+1];
                               flagto=flagto+1;
                           end
                        end
                    elseif(ColorMove==0&& (oldFigure=='1' || oldFigure=='3' || oldFigure=='5' || oldFigure=='7' || oldFigure=='9' || oldFigure=='B' ))
                        rect=[65+oox*100,65+ooy*100,70,70];
                        
                        A1=rgb2gray(imcrop(Board,rect));
                        s=std2(A1);
                        m=mean(mean(A1));
                        if(Col)
                           if(m<trW)
                               to=[ooy+1,oox+1];
                               flagto=flagto+1;
                           end
                        else
                           if(m<trB)
                               to=[ooy+1,oox+1];
                               flagto=flagto+1;
                           end
                        end
                    end
                end
        
            end
        end
    if(flagfrom==1 && flagto==1)
        move=[from;to];
        oldPosition(to(1),to(2))=oldPosition(from(1),from(2));
        oldPosition(from(1),from(2))='0';
        newP=oldPosition;
    else
        %fehler
    end
else
    %fehler
end
end

