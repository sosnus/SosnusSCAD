//based on: https://botland.com.pl/img/art/inne/04466_9.jpg
// https://botland.com.pl/wyswietlacze-raspberry-pi-32/7906-ekran-dotykowy-rezystancyjny-lcd-tft-5-800x480px-hdmi-usb-rev-21-dla-raspberry-pi-32b.html
module lcd5inch()
{
    rpiMainPolygon =
    [
        [0,0],     [6,0],     [6,6.75],   [115,6.75],[115,0], [121,0],
        [121,89.5],[115,89.5],[115,82.75],[6,82.75], [6,89.5],[0,89.5],
    
    
    
    ];
difference()
{
polygon(rpiMainPolygon);
lcdWholes();
}
}

module lcdWholes()
{
    rpiWholesDrill = 1.4;
        translate([3,2.75])circle(rpiWholesDrill,$fn=20);
        translate([3,86.75])circle(rpiWholesDrill,$fn=20);
        translate([118,86.75])circle(rpiWholesDrill,$fn=20);
        translate([118,2.75])circle(rpiWholesDrill,$fn=20);
}

lcd5inch();