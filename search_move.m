function [ newPosition,move ] = search_move( oldPosition,newImage)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
I3=newImage;
trBonW=200;


trWonWs=50;
trWonWm=200;
trWonWts=9;


trWonB=170;


trBonBsmax=25;
trBonBsmin=50;
trBonBm=140;

Col=true;
for ooy=0:7
   Col=~Col;
   for oox=0:7 
       Col=~Col;
       rect=[30+oox*50,30+ooy*50,45,45];
      A1=(imcrop(I3,rect));
      A1=imadjust(A1,[],[0 1]);
      sumR=sum(sum(A1(:,:,1)));
      sumG=sum(sum(A1(:,:,2)));
      sumB=sum(sum(A1(:,:,3)));
      
      ColorChange=false;
      figur=oldPosition(ooy+1,oox+1);
      tempIM=A1;
      tempmean=mean(mean(mean(tempIM)));
      tempS=std2(tempIM);
      if Col
          Bm=mean(mean(rgb2gray(A1)));
          Bs=std2(rgb2gray(A1));
          if (Bs>30 && Bm <115 )
              FFF='B';
              %its black
                 if(figur=='0' ||figur=='1' || figur=='3' || figur=='5' || figur=='7' || figur=='9' || figur=='B')
                  to=[ooy+1,oox+1];
                 end
                 
          elseif(Bs>10 && Bm < 100)
              FFF='W';
                 %its white 
                 if(figur=='0' || figur=='2' || figur=='4' || figur=='6' || figur=='8' || figur=='A' || figur=='C')
                     to=[ooy+1,oox+1];
                 end
          else
              FFF='0';
             if (figur~='0')
                  from=[ooy+1,oox+1];            
              end 
          end
      else 
          
          Bm=mean(mean(rgb2gray(A1)));
          Bs=std2(rgb2gray(A1));
          if ((Bs<35 || Bm<70) && Bs>15 && sumR <700000)
              %its Black
              FFF='B';
              if(figur=='0' ||figur=='1' || figur=='3' || figur=='5' || figur=='7' || figur=='9' || figur=='B')
                  to=[ooy+1,oox+1];
              end
          elseif (Bs>12)
              %its White
              FFF='W';
              if(figur=='0' || figur=='2' || figur=='4' || figur=='6' || figur=='8' || figur=='A' || figur=='C')
                 to=[ooy+1,oox+1];
              end
          else
              FFF='0';
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

