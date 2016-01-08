function [ newPosition,move ] = search_move( oldPosition,newImage,ClearBoard)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
I3=newImage;
BT=25;
WT=9;
Col=true;
for ooy=0:7
   Col=~Col;
   for oox=0:7 
       Col=~Col;
      rect=[60+oox*100,60+ooy*100,80,80];
      A1=rgb2gray(imcrop(I3,rect));
      A2=rgb2gray(imcrop(ClearBoard,rect));
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
          c=std2(A1);
      else %BlackKolor
          tr=BT;
          c=std2(double(A1)-double(A2));
      end
      if(c>tr)
         %Figureadded(ooy,oox)=true; 
         F=true;
         if (oldPosition(ooy+1,oox+1)=='0')
             to=[ooy+1,oox+1];            
         end
         ColorChange=false;%%andere Farbe prüfen
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
      subplot(8,8,ooy*8+oox+1),imshowpair(A1,A2);
   end
end
oldPosition(to(1),to(2))=oldPosition(from(1),from(2));
oldPosition(from(1),from(2))='0';
newPosition=oldPosition;
move=[from;to];
end

