function [ newPosition,move ] = search_move( oldPosition,newImage,ClearBoard)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
I3=newImage;
BT=8.6;
WT=15;
Col=true;
for ooy=0:7
   Col=~Col;
   for oox=0:7 
       Col=~Col;
      rect=[55+oox*100,55+ooy*100,90,90];
      A1=rgb2gray(imcrop(I3,rect));
      A2=rgb2gray(imcrop(ClearBoard,rect));
        Filter = fspecial('disk', 5);
         A1 = imfilter(A1,Filter,'corr');
%         A2 = imfilter(A2,Filter,'corr');
se = strel('disk',10);
   A1 = imdilate(A1,se);
      
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
      c=std2(A1);
      if Col
          tr=WT;
      else
          tr=BT;
      end
      if(c>tr)
         %Figureadded(ooy,oox)=true; 
         if (oldPosition(ooy+1,oox+1)=='0')
             to=[ooy+1,oox+1];            
         end
         ColorChange=false;%%andere Farbe prüfen
         if (oldPosition(ooy+1,oox+1)~='0' && ColorChange)%%andere Farbe
             to=[ooy+1,oox+1];            
         end
      else
         %Figureadded(ooy,oox)=false; 
         if (oldPosition(ooy+1,oox+1)~='0')
             from=[ooy+1,oox+1];            
         end
      end
      %c = min([corr2(R1,R2);corr2(G1,G2);corr2(B1,B2)]); 
      subplot(8,8,ooy*8+oox+1),imshowpair(A1,A2);
   end
end
oldPosition(to(1),to(2))=oldPosition(from(1),from(2));
oldPosition(from(1),from(2))='0';
newPosition=oldPosition;
move=[from;to];
end

