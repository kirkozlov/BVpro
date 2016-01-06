function [ Positions ] = initialFirstBoard( )
%W white B lack

    %Ki King 1W 2B
    %Qe Queen 3 4
    %Ro Rook  5 6
    %Bi Bishop 7 8
    %Kn Knight 9 A
    %Pa Pawn B C
    %Cle
    Positions=[ '6' 'A' '8' '4' '2' '8' 'A' '6';
                'C' 'C' 'C' 'C' 'C' 'C' 'C' 'C';
                '0' '0' '0' '0' '0' '0' '0' '0';
                '0' '0' '0' '0' '0' '0' '0' '0';
                '0' '0' '0' '0' '0' '0' '0' '0';
                '0' '0' '0' '0' '0' '0' '0' '0';
                'B' 'B' 'B' 'B' 'B' 'B' 'B' 'B';
                '5' '9' '7' '3' '1' '7' '9' '5'];

end

