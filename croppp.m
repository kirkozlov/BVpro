I3=Board;
for ooy=0:7
   for oox=0:7 
      rect=[50+oox*100,50+ooy*100,100,100];
      A1=(imcrop(I3,rect));
      A2=(imcrop(ClearBoard,rect));
%       H1=imhist(A1);
%       H2=imhist(A2);
      R1=imhist(A1(:,:,1));
      R2=imhist(A2(:,:,1));
      G1=imhist(A1(:,:,2));
      G2=imhist(A2(:,:,2));
      B1=imhist(A1(:,:,3));
      B2=imhist(A2(:,:,3));
      
      %c=corr2(H1,H2);
      c = min([corr2(R1,R2);corr2(G1,G2);corr2(B1,B2)]); 
      subplot(8,8,ooy*8+oox+1),imshowpair(A1,A2);
   end
end