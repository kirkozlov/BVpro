
  clear cam;
   cam=webcam('M');
mypoins=
%   img=imread(strcat('k',int2str(2025),'.jpg'));
%   img = snapshot(cam);
for i=5000:6000
    pause(1);
        img = snapshot(cam);
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
      
     imshow(img);
     
%      img=img2;
%      imshow(img);
    hold on; 
    
    plot(imagePoints(:,1), imagePoints(:,2), 'ro');
    title(strcat(int2str(i)));
  
end