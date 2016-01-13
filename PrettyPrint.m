function [ output_list ] = PrettyPrint( old_output_list, move, Positions )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    if(~isnumeric(old_output_list))
        output_list = old_output_list;

        vart =size(output_list);
        tart = vart(:,1)+1;
    else
        tart = 1;
        
    end
    
    sizemove = size(move);
    
    larr = ['A' 'B' 'C' 'D' 'E' 'F' 'G' 'H'];
    
    for i=1:sizemove(:,1)
        
        if(mod(i,2)==0)
            
            x = move(i,1);
            y = move(i,2);
        
            name = 'Unknown: ';
            
            sw = Positions(x,y);
            
            switch(sw)
                
                case '1'
                    name = 'Koenig (Weiss): ';
       
                case '2'
                    name = 'Koenig (Schwarz): ';

                case '3'
                    name = 'Dame (Weiss): ';
       
                case '4'
                    name = 'Dame (Schwarz): ';

                case '5'
                    name = 'Turm (Weiss): ';
       
                case '6'
                    name = 'Turm (Schwarz): ';

                case '7'
                    name = 'Laeufer (Weiss): ';
       
                case '8'
                    name = 'Laeufer (Schwarz): ';

                case '9'
                    name = 'Springer (Weiss): ';
       
                case 'A'
                    name = 'Springer (Schwarz): ';

                case 'B'
                    name = 'Bauer (Weiss): ';
       
                case 'C'
                    name = 'Bauer (Schwarz): ';
            end
            
            xto = move(i,2);
            yto = move(i,1);
            
            fromtxt = strcat(larr(xfrom), num2str(9-yfrom));
            totxt = strcat(larr(xto), num2str(9-yto));
            
            output_list{tart,:} = strcat(strcat(strcat(name, fromtxt), '-'),totxt);
            tart = tart+1;
        else
        
            xfrom = move(i,2);
            yfrom = move(i,1);
            
        end
        
   end

end

