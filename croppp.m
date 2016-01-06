I3=Board;
BT=10;
WT=20;
Col=true;
for ooy=0:7
   Col=~Col;
   for oox=0:7 
       Col=~Col;
      rect=[50+oox*100,50+ooy*100,100,100];
      A1=rgb2gray(imcrop(I3,rect));
      A2=rgb2gray(imcrop(ClearBoard,rect));
       Filter = fspecial('disk', 25);
       A1 = imfilter(A1,Filter,'corr');
       A2 = imfilter(A2,Filter,'corr');
   
      
%       H1=imhist(A1);
%        H2=imhist(A2);
%       R1=imhist(A1(:,:,1));
%       R2=imhist(A2(:,:,1));
%       G1=imhist(A1(:,:,2));
%       G2=imhist(A2(:,:,2));
%       B1=imhist(A1(:,:,3));
%       B2=imhist(A2(:,:,3));
%       
      c=mean(mean(abs(A2-A1)));
      if Col
          tr=WT;
      else
          tr=BT;
      end
      if(c>tr)
         Figureadded=true; 
      else
         Figureadded=false; 
      end
      %c = min([corr2(R1,R2);corr2(G1,G2);corr2(B1,B2)]); 
      subplot(8,8,ooy*8+oox+1),imshowpair(A1,A2);
   end
end