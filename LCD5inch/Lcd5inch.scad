//based on: https://botland.com.pl/img/art/inne/04466_9.jpg
// https://botland.com.pl/wyswietlacze-raspberry-pi-32/7906-ekran-dotykowy-rezystancyjny-lcd-tft-5-800x480px-hdmi-usb-rev-21-dla-raspberry-pi-32b.html

module lcd5inch()
{
    dt=0.01;
    color("Navy")   linear_extrude(height = 2)    _pcb();
    color("Silver") translate([0,0,2]) linear_extrude(height = 4-dt) screen();
    color("Navy")   linear_extrude(height = 6)    ekran();
    color("green") linear_extrude(height = 6+dt)  textScreen();
}

module textScreen()
{
    //[x,y,size,text]
    textArray=[
        [74,74,4,"15:00 13.04.2017"],
        [10,74,4,"Stacja: Biurowiec ''nazwa''"],
        [10,60,10,"Bike2Box"],
        [10,30,5,"Rowerów zaparkowanych: 6"],
        [10,20,5,"Wolnych stanowisk: 4"],
    ];
  //  surface(file="screen.png",convexity = 1,invert = true);
     for (a=textArray) {
         translate([(a[0]),a[1]])
         text(text = a[3],  size = a[2]);
         echo(a[3]);
     }
}

module screen()
{
    screenPolygon=[ [0,6],[121,6],[121,82.75],[0,82.75] ];
    polygon(screenPolygon);
}

module ekran()
{
    frame=3;
    ekranPolygon=[
        [0+frame,6+frame],[121-frame,6+frame],[121-frame,82.75-frame],[0+frame,82.75-frame]];
    polygon(ekranPolygon);
}

module _pcb()
{
        rpiMainPolygon =
    [
        [0,0],     [6,0],     [6,6.75],   [115,6.75],[115,0], [121,0],
        [121,89.5],[115,89.5],[115,82.75],[6,82.75], [6,89.5],[0,89.5],
    ];

    difference()
    {
        polygon(rpiMainPolygon);
        lcdHoles();
    }
}

module lcdHoles()
{
    dimLcdHoles=[[3,2.75],[3,86.75],[118,86.75],[118,2.75]];
        for (i=dimLcdHoles) 
            translate([i[0],i[1]])circle(r=1.4,$fn=20);
}

// lcd5inch();