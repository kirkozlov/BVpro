function [ image,tforms,rect ] = initialBoard()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%  clear cam;
%  cam=webcam('M');
mypoins=[15 15; 15 25; 15 35; 15 45; 15 55; 15 65; 15 75;
         25 15; 25 25; 25 35; 25 45; 25 55; 25 65; 25 75; 
         35 15; 35 25; 35 35; 35 45; 35 55; 35 65; 35 75; 
         45 15; 45 25; 45 35; 45 45; 45 55; 45 65; 45 75; 
         55 15; 55 25; 55 35; 55 45; 55 55; 55 65; 55 75; 
         65 15; 65 25; 65 35; 65 45; 65 55; 65 65; 65 75; 
         75 15; 75 25; 75 35; 75 45; 75 55; 75 65; 75 75; 
         ]; 
     mypoins=10*mypoins;

    
        %img = snapshot(cam);
%imshow(img);
        img=imread('0.jpg');
      [imagePoints,boardSize] = detectCheckerboardPoints(img);

     imagePoints=sortrows(imagePoints);
     try
         
         for ip=0:7:42
         imagePoints([ip+1 ip+2 ip+3 ip+4 ip+5 ip+6 ip+7 ],:)=sortrows(imagePoints([ip+1 ip+2 ip+3 ip+4 ip+5 ip+6 ip+7 ],:),2);
         end
  
        tforms = estimateGeometricTransform(imagePoints, mypoins,'projective');
        warpedImage = imwarp(img, tforms);
        [imagePointsw,boardSizew] = detectCheckerboardPoints(warpedImage);
        minx=min(imagePointsw(:,1))-150;
        miny=min(imagePointsw(:,2))-150;
        wi=max(imagePointsw(:,1))-min(imagePointsw(:,1))+300;
        hi=max(imagePointsw(:,2))-min(imagePointsw(:,2))+300;
        rect=[ minx,miny,wi,hi ];
        ClearBoard = imcrop(warpedImage,rect) ;
        image=ClearBoard;  
        
        
        
 catch ME
         close all;
         image=img;
     end
   
    

end

