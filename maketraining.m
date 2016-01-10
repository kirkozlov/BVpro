WB=dir('WB');
WW=dir('WW');
W=dir('W');
WBSIZE=size(WB); 
for i=3:WBSIZE(1)
   pos(i-2)=struct('imageFilename',strcat('C:\Users\kiril\BVpro\WB\',WB(i).name),'objectBoundingBoxes',[5 5 80 80]); 
end
 
neg= fullfile('C:','Users','kiril','BVpro','W');

trainCascadeObjectDetector('WHITE.xml',pos,neg);

