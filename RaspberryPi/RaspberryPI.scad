// http://www.raspiworld.com/images/other/drawings/Raspberry-Pi-1-2-3-Model-B.jpg

//before
module rpdiWholes()
{
    rpiWholesDrill = 1.4;
        translate([3.5,3.5])circle(rpiWholesDrill,$fn=20);
        translate([3.5,3.5+58])circle(rpiWholesDrill,$fn=20);
        translate([3.5+49,3.5])circle(rpiWholesDrill,$fn=20);
        translate([3.5+49,58+3.5])circle(rpiWholesDrill,$fn=20);
}
//after
module rpiHoles()
{
    dimRpiHoles=[[3.5,3.5],[3.5,61.5],[52.5,3.5],[52.5,62.5]];
        for (i=dimRpiHoles) 
            translate([i[0],i[1]])circle(r=1.4,$fn=20);
}

module raspberryPcb()
{
    rpiMainPolygon = [[3,3],[53,3],[53,82],[3,82]];
    color("DarkGreen")linear_extrude(height=2)
    {
        difference()
        {
            offset(3,$fn=20)polygon(rpiMainPolygon);
            rpiHoles();
        }
    }
}

module rpi()
{
    raspberryPcb();
    uc();
    sd();
}

module uc()
{
     color("Black")translate([18,20,2])linear_extrude(height=2)square(size=14, center=false);
}

module sd()
{
     color("Gray")translate([21,0,-1.7])linear_extrude(height=1.7)square(size=14.6, center=false);
     color("Maroon")translate([21,-2.5,-1.7])linear_extrude(height=1.7)square(size=[14.6,2.5], center=false);
}

// rpi();