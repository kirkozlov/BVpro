function [ newPosition,move ] = search_move( oldPosition,newImage,ClearBoard)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
I3=newImage;
BT=15;
WT=6;
Col=true;
for ooy=0:7
   Col=~Col;
   for oox=0:7 
       Col=~Col;
      rect=[70+oox*100,70+ooy*100,60,60];
      A1=(imcrop(I3,rect));
      A2=(imcrop(ClearBoard,rect));
        Filter = fspecial('disk', 5);
%         A1 = imfilter(A1,Filter,'corr');
%         A2 = imfilter(A2,Filter,'corr');
%se = strel('disk',10);
 %  A1 = imdilate(A1,se);
      
%       H1=imhist(A1);
%        H2=imhist(A2);
%       R1=imhist(A1(:,:,1));
%       R2=imhist(A2(:,:,1));
%       G1=imhist(A1(:,:,2));
%       G2=imhist(A2(:,:,2));
%       B1=imhist(A1(:,:,3));
%       B2=imhist(A2(:,:,3));
%       
      
%       Diff=A1-A2;
%       Diff=abs(Diff(:));
      
      if Col
          tr=WT;
          JJ=(double(A2)-double(A1));
          c=mean(mean(mean(mean(JJ))));
      else %BlackKolor
          tr=BT;
          
          JJ=(double(A1)-double(A2));
          c=mean(mean(mean(mean(JJ))));
      end
      if(c>tr)
         %Figureadded(ooy,oox)=true; 
         F=true;
         if (oldPosition(ooy+1,oox+1)=='0')
             to=[ooy+1,oox+1];            
         end
         ColorChange=false;%%andere Farbe prüfen
         figur=oldPosition(ooy+1,oox+1);
         if(figur=='1' || figur=='3' || figur=='5' || figur=='7' || figur=='9' || figur=='B')
             if Col
                 if (c>35)
                    ColorChange=true;
                 end
             else
                 if (c<30)
                    ColorChange=true;
                 end
             end
         end
         if(figur=='2' || figur=='4' || figur=='6' || figur=='8' || figur=='A' || figur=='C')
             if Col
                 if (c<35)
                    ColorChange=true;
                 end
             else
                 if (c>35)
                    ColorChange=true;
                 end
             end
         end
         if (oldPosition(ooy+1,oox+1)~='0' && ColorChange)%%andere Farbe
             to=[ooy+1,oox+1];            
         end
      else
          F=false;
         %Figureadded(ooy,oox)=false; 
         if (oldPosition(ooy+1,oox+1)~='0')
             from=[ooy+1,oox+1];            
         end
      end
      subplot(8,8,ooy*8+oox+1),imshow(uint8(JJ));
   end
end
oldPosition(to(1),to(2))=oldPosition(from(1),from(2));
oldPosition(from(1),from(2))='0';
newPosition=oldPosition;
move=[from;to];
end

