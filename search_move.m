function [ newPosition,move ] = search_move( oldPosition,newImage,ClearBoard)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
I3=newImage;

trW=180;
trWonW=50;
trBonW=95;
trWonB=170;
trBonB=25;
Col=true;
for ooy=0:7
   Col=~Col;
   for oox=0:7 
       Col=~Col;
      rect=[55+oox*100,55+ooy*100,90,90];
      A1=(imcrop(I3,rect));
      A2=(imcrop(ClearBoard,rect));
      

      
      ColorChange=false;
      figur=oldPosition(ooy+1,oox+1);
      tempIM=A1;
      tempmean=mean(mean(mean(tempIM)));
      tempS=std2(tempIM);
      if Col
          
          A1=imadjust(A1,[0.95 1],[0 1]);
          Bm=mean(mean(mean(A1)));
          Bs=std2(A1);
          if (Bm<trBonW && tempmean<200)
              %its black
                 if(figur=='0' ||figur=='1' || figur=='3' || figur=='5' || figur=='7' || figur=='9' || figur=='B')
                  to=[ooy+1,oox+1];
                 end
                 
          elseif(Bs>trWonW && Bm<200 && tempS>9)
                 %its white 
                 if(figur=='0' || figur=='2' || figur=='4' || figur=='6' || figur=='8' || figur=='A' || figur=='C')
                     to=[ooy+1,oox+1];
                 end
          else
             if (figur~='0')
                  from=[ooy+1,oox+1];            
              end 
          end
      else 
          Bm=mean(mean(mean(A1)));
          Bs=std2(A1);
          if (Bs>trBonB&& tempS<50 && Bm<140)
              %its Black
              if(figur=='0' ||figur=='1' || figur=='3' || figur=='5' || figur=='7' || figur=='9' || figur=='B')
                  to=[ooy+1,oox+1];
              end
          elseif (Bm>trWonB)
              %its White
              if(figur=='0' || figur=='2' || figur=='4' || figur=='6' || figur=='8' || figur=='A' || figur=='C')
                 to=[ooy+1,oox+1];
              end
          else
              if (figur~='0')
                  from=[ooy+1,oox+1];            
              end
          end 
      end
%       if(c>tr)
%          %Figureadded(ooy,oox)=true; 
%          F=true;
%          if (oldPosition(ooy+1,oox+1)=='0')
%              to=[ooy+1,oox+1];            
%          end
%          ColorChange=false;%%andere Farbe prüfen
%          figur=oldPosition(ooy+1,oox+1);
%          if(figur=='1' || figur=='3' || figur=='5' || figur=='7' || figur=='9' || figur=='B')
%              if Col
%                  if (c>35)
%                     ColorChange=true;
%                  end
%              else
%                  if (c<30)
%                     ColorChange=true;
%                  end
%              end
%          end
%          if(figur=='2' || figur=='4' || figur=='6' || figur=='8' || figur=='A' || figur=='C')
%              if Col
%                  if (c<35)
%                     ColorChange=true;
%                  end
%              else
%                  if (c>35)
%                     ColorChange=true;
%                  end
%              end
%          end
%          if (oldPosition(ooy+1,oox+1)~='0' && ColorChange)%%andere Farbe
%              to=[ooy+1,oox+1];            
%          end
%       else
%           F=false;
%          %Figureadded(ooy,oox)=false; 
%          if (oldPosition(ooy+1,oox+1)~='0')
%              from=[ooy+1,oox+1];            
%          end
%       end
      subplot(8,8,ooy*8+oox+1),imshow(A1);
   end
end
oldPosition(to(1),to(2))=oldPosition(from(1),from(2));
oldPosition(from(1),from(2))='0';
newPosition=oldPosition;
move=[from;to];
end

