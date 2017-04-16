//informations from: http://www.tme.eu/pl/details/b2.5x10_bn384/sruby/bossard/1154214/
module screwM2dot5()
{
    color("DimGray")
    {
        headM2dot5();
        bodyM2dot5();
    }
}

module headM2dot5()
{
    h=2.12;
    translate([0,0,h])
    difference()
    {
       translate([0,0,-h])linear_extrude(height=h) circle(r=2.5,$fn=20);
        cross3dM2dot5();
    }
}

module bodyM2dot5()
{
    rotate([180,0,0])
    linear_extrude(height=5) 
    {
        circle(r=1.25,$fn=20);
    }
}

module arm()
{
    rotate_extrude($fn=8) 
    rotate([0,0,90])
    polygon( points=[[3,0],[2,-1],[0,-1],[0,0]] );
}

module cross3dM2dot5()
{
    resize(newsize=[4,4,2]) rotate([0,90,0])
    {
        rotate([0,0,0])arm();
        rotate([90,0,0])arm();
        rotate([180,0,0])arm();
        rotate([270,0,0])arm();
    }
}

// color("DimGray")screw();
