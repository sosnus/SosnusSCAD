//this is library for: http://www.tme.eu/pl/details/ns25-w5k/zlacza-sygnalowe-raster-254mm/ninigi/
//based on documentation: http://www.tme.eu/pl/Document/f4fbc03349849389d5a444932ab1e0cf/ns25-w2p.pdf 

/// i - number of pins
/// angle - version of pin:
///    " 0" - straight
///    "-1" - right angle
///    " 1" - reverse right angle
module Connector402(i, angle)
{
    color(plastic_color)_body(i);
    color("gray")_pin(i, angle);
}

plastic_color = [245/255/1.5, 249/255/1.5, 201/255/1.5];

module _body(i)
{
    _bottom=[[2.9,0],[2.9,3.3],[-2.9,3.3],[-2.9,0]];
    _top=[[2.9,3.3],[2.9,11.5],[1.54,11.5],[1.54,3.3]];

     linear_extrude(2.54*i) polygon(points=_top);
     difference()
     {
        translate([0, 0,-1.27]) linear_extrude(2.54*(i+1)) polygon(points=_bottom);
        for (i=[0:i]) translate([0, 0, 2.54 * i])cube([6,2,1], center = true);
     }
}

module _pin(i, angle)
{
    for (i=[0:i]) 
    {
        translate([0, 4.7, 2.54 * i])
        {
            cube([0.64,14.2,0.64], center = true);
            if(angle != 0)
                translate([2.5*angle,-7.1,0])rotate([0,  0,90])
                    cube([0.64,2.4+3.3,0.64], center = true);
        }
    }
}

Connector402(5,-1);
// Connector402(5,1);