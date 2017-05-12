// cylinder($fn = 0, $fa = 12, $fs = 2, h = 20, r1 = 10, r2 = 5, center = false);
// cube(size=[5, 2, 10], center=true);
// color("red")translate([0, 0, -1.27]) linear_extrude(1.27) polygon(points=points);
// color("red")translate([0, 0, -2.9]) linear_extrude(2.54) polygon(points=points);
// color("red") translate([0, 0, 2.54 * i]) translate([0, 0, -2.9]) linear_extrude(1.27) polygon(points=points);

//this is library for: http://www.tme.eu/pl/details/ns25-w5k/zlacza-sygnalowe-raster-254mm/ninigi/
//based on documentation: http://www.tme.eu/pl/Document/f4fbc03349849389d5a444932ab1e0cf/ns25-w2p.pdf 

/// i - number of pins
/// angle - version of pin:
///    " 0" - straight
///    "-1" - right angle
///    " 1" - reverse right angle
module Connector402(i, angle)
{
    _body(i);
    _pin(i, angle);
}

module _body(i)
{
    plastic_color = [245/255, 249/255, 201/255];
    points=[[2.9,0],[2.9,11.5],[1.54,11.5],[1.54,3.3],[-2.9,3.3],[-2.9,0]];
    _bottom=[[2.9,0],[2.9,11.5],[1.54,11.5],[1.54,3.3],[-2.9,3.3],[-2.9,0]];
    _top=[[2.9,0],[2.9,11.5],[1.54,11.5],[1.54,3.3],[-2.9,3.3],[-2.9,0]];


    color(plastic_color) {
        
            difference()
        {
            translate([0, 0,-1.27]) linear_extrude(2.54*i) polygon(points=points);
for (i=[0:i-1]) 
{
    translate([0, 0, 2.54 * i])
    {
        difference()
        {
            cube([6,2,1], center = true);
        }
    }
}
// wycięcia na końcach
         //   translate([1, 3.3, 2.54 * i - 2.54]) cube([6,10,2]);
         //    translate([1, 3.3, -2])cube([6,10,2.01]);
}
    }
// goldpin(i, angle);

}

module _pin(i, angle)
{
    for (i=[0:i-1]) 
    {

translate([0, 0, 2.54 * i])
{

        color("gray") translate([0, 4.7, 0]) cube([0.64,14.2,0.64], center = true);
        if(angle != 0)color("gray") rotate([0, 0, 90])
         translate([-2.54, -2.5*angle, 0]) cube([0.64,2.4+3.3,0.64], center = true);
}
    }

}

// pin(10,0);
Connector402(10,1);