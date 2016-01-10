function [ image ] = readBoard( tforms,rect ,file)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

 % clear cam;
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

    
        img = imread(file);


     try
         
         
  
        
        warpedImage = imwarp(img, tforms);
        Board = imcrop(warpedImage,rect) ;
        image=Board;  
 catch ME
         close all;
         image=img;
     end
   


end




