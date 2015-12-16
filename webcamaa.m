
  clear cam;
   cam=webcam('M');
mypoins=[15 15; 15 25; 15 35; 15 45; 15 55; 15 65; 15 75;
         25 15; 25 25; 25 35; 25 45; 25 55; 25 65; 25 75; 
         35 15; 35 25; 35 35; 35 45; 35 55; 35 65; 35 75; 
         45 15; 45 25; 45 35; 45 45; 45 55; 45 65; 45 75; 
         55 15; 55 25; 55 35; 55 45; 55 55; 55 65; 55 75; 
         65 15; 65 25; 65 35; 65 45; 65 55; 65 65; 65 75; 
         75 15; 75 25; 75 35; 75 45; 75 55; 75 65; 75 75; 
         ]; 
     mypoins=10*mypoins;
%   img=imread(strcat('k',int2str(2025),'.jpg'));
%   img = snapshot(cam);
for i=5000:6000
    pause(1);
        img = snapshot(cam);
        %img=imread('SCH.jpg');
 %    imwrite(img,strcat('k',int2str(i),'.jpg'));
        
%         img=imread(strcat('k',int2str(i),'.jpg'));
%        img=imdilate(img,ones(10,10));
      
          % img=rgb2gray(img);
          % img=im2bw(img);
%           img=255-img;
%

%filter=[1 1 1 0 -1 -1 -1;1 1 1 0 -1 -1 -1;1 1 1 0 -1 -1 -1; 0 0 0 0 0 0 0; -1 -1 -1 0 1 1 1;-1 -1 -1 0 1 1 1;-1 -1 -1 0 1 1 1;];
%          img=imfilter(img,filter,'conv');
%         img=imadjust(img,[0.5 1], [0 1]);
%           img=imclose(img,ones(10,10));
%         [img,t]=edge(img,'canny');
%        se = strel('disk', 25);
%         img2 = imdilate(img, se);
%         % Shading Korrektur: Ergebnis ist ein gleichmaessig beleuchtetes Bild
%         img3 = double(img)./double(img2);
      [imagePoints,boardSize] = detectCheckerboardPoints(img);
     % imagePoints=sort(imagePoints,1);
     
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
        I2 = imcrop(warpedImage,rect) ;
        imshow(I2);  
     catch ME
         imshow(img);
     end
     
      


    
   
  
%     
     %plot(imagePointsw(:,1), imagePointsw(:,2), 'ro');
     
%      img=img2;
%      imshow(img);
%     hold on; 
%     
%     plot(imagePoints(:,1), imagePoints(:,2), 'ro');
%     title(strcat(int2str(i)));
%   
end