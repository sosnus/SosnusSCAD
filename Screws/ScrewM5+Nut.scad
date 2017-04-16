//informations from: http://www.tme.eu/pl/details/b2.5x10_bn384/sruby/bossard/1154214/
module screwM5()
{
    color("DimGray")
    {
        head();
        body();
    }
}

module head()
{
    h=4;
    translate([0,0,h])
    difference()
    {
       translate([0,0,-h])linear_extrude(height=h) circle(r=5,$fn=20);
        cross3d();
    }
}

module body()
{
    rotate([180,0,0])
    linear_extrude(height=20) 
    {
        circle(r=2.5,$fn=20);
    }
}

module arm()
{
    rotate_extrude($fn=8) 
    rotate([0,0,90])
    polygon( points=[[3,0],[2,-1],[0,-1],[0,0]] );
}

module cross3d()
{
    resize(newsize=[6,6,4]) rotate([0,90,0])
    {
        rotate([0,0,0])arm();
        rotate([90,0,0])arm();
        rotate([180,0,0])arm();
        rotate([270,0,0])arm();
    }
}


module nutM5()
{
    color("DimGray")
    difference()
    {
       translate([0,0,-4])linear_extrude(height=4) circle(r=5,$fn=6);
       translate([0,0,-5])linear_extrude(height=40) circle(r=2.5,$fn=20);
    }

}


//  color("DimGray")translate([0,0,0]) nutM5();
//  color("DimGray")screwM5();
