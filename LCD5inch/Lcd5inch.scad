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
// lcdWholes();
lcd5inch();