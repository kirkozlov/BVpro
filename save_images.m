function [ flag ] = save_images( oldPosition,Board )
I3=Board;
Col=true;
index=300;
for ooy=0:7
   Col=~Col;
   for oox=0:7 1
       Col=~Col;
      rect=[55+oox*100,55+ooy*100,90,90];
      A1=(imcrop(I3,rect));

      figur=oldPosition(ooy+1,oox+1);
       
         if(figur=='0')
             
                 imwrite(A1,strcat(strcat('C:\Users\kiril\BVpro\W\',int2str(index)),'.jpg'));
             else
                 imwrite(A1,strcat(strcat('C:\Users\kiril\BVpro\WB\',int2str(index)),'.jpg'));
             
         end
      index=index+1;
   end
end

flag=true;

end

