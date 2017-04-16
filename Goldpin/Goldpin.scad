module pinOld()
{
    color("Gold")linear_extrude(height = 2.5+3+6.10, center = true)offset(0.02)square(0.3,center=true);  
}

module pin()
{
    color("Gold")difference()
    {
        linear_extrude(height = 12, center = true)offset(0.02)square(0.3,center=true);  
        union()
        {
            if(0)
            {
                translate([0,0,5])tempere();
                translate([0,0,-5])mirror([0,0,1])tempere();
               echo("<h2>heavy rendering enabled</h2>");
                // echo("<h2><font color=red>heavy rendering enabled</font></h2>");
            }
            else
            {
                //  echo("<h2><font= \" red \" >heavy rendering enabled</h2></font>");
               echo("<h2>heavy rendering disabled</h2>");

            }
        }
    }
}

module tempere()
{
    difference()
    {
        translate([-0.75,-0.75,0.1]) cube(2.5);
        difference()
        {
            rotate([0,0,45]) cylinder(r1=(0.32*sqrt(2)), r2=0, h=1, center=false, $fn=4);
            translate([0,0,1.8]) cube(2,center=true);
        }
    }
}

module goldPinCover()
{
    color("Black")translate([0,0,1.25])linear_extrude(height = 2.5, center = true)offset(0.27)square(2,center=true);
}

module goldPin()
{
    translate([0,0,(1.25+6.10)/2])pin();
    // translate([0,0,(1.25+6.10)/2])
    goldPinCover();
}

module goldPinMulti(column,row)
{
    for (j=[0:row-1])
    {
        for (i=[0:column-1])
        {
            translate
            ([i*2.54,j*2.54,0])
            goldPin();
        }
    }
}

// goldPinMulti(2,20);