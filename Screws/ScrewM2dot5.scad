//informations from: http://www.tme.eu/pl/details/b2.5x10_bn384/sruby/bossard/1154214/
module screw()
{
    head();
    //headFront();
    //headBottom();
    // body();
}
    h=2.12;



module head()
{
        difference()
    {
       translate([0,0,-h])linear_extrude(height=h) circle(r=2.5,$fn=20);
        resize(newsize=[4,4,1]) rotate([0,90,0])
        cross3d();
    }

}

module body()
{
    translate([0,0,0])color("Silver")linear_extrude(height=20) 
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

module cross3d()
{
    rotate([0,0,0])arm();
    rotate([90,0,0])arm();
    rotate([180,0,0])arm();
    rotate([270,0,0])arm();
}


color("DimGray")screw();






/*
module headFront()
{
    translate([0,0,-h*2])color("Silver")linear_extrude(height=h) 
    {
        difference()
        {
            circle(r=2.5,$fn=20);
            cross();
        }
    }
}

module headBottom()
{
        translate([0,0,-h])color("Silver")linear_extrude(height=h) 
    {
            circle(r=2.5,$fn=20);
    }
}




*/