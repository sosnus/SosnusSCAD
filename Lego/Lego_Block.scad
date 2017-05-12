// type = 1 - high
// type = 0 - low
// type = undef - high
module Lego_block(x, y, type)
{
    //delkarujemy wysokosc klocka
    height=9.2;

// jezeli chcemy wygenerowac klocek niski
    if(type==1)
        translate([-3.9, -3.9, -height/3])
        // generujemy prostopadłościan o wymiarach zależnych od wielkości klocka
            cube(size=[x*8-0.2, y*8-0.2, height/3]);
//jeżeli chcemy wygenerować klocek wysoki
    else 
        translate([-3.9, -3.9, -height])
            cube(size=[x*8-0.2, y*8-0.2, height]);

// generujemy zaczepy (w pętli for)
    for (x=[0:x-1])for (y=[0:y-1])
    //narysuj jeden cylinder, przesunięty o ilośc wygenerowanych już cylindrów na osi X i Y
        translate([x*8,y*8, 0])cylinder(d=4.8, h=1.7);
}

// wygeneruj, pokoloruj i przesuń stworzony moduł
translate([0, 20, 0])color("green")Lego_block(6,2);
translate([0, -20, 0])Lego_block(6,2,1);
color("red")Lego_block(6,2,0);
