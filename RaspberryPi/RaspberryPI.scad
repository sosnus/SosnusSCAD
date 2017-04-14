module rpiWholes()
{
    rpiWholesDrill = 1.4;
        translate([3.5,3.5])circle(rpiWholesDrill,$fn=20);
        translate([3.5,3.5+58])circle(rpiWholesDrill,$fn=20);
        translate([3.5+49,3.5])circle(rpiWholesDrill,$fn=20);
        translate([3.5+49,58+3.5])circle(rpiWholesDrill,$fn=20);
    
    
    
}


module raspberry()
{
    
        rpiMainPolygon =[[3,3],
    [53,3],
    [53,82],[3,82]
    ];
    
    /*
    rpiMainPolygon =[[0,3],[3,0],
    [53,0],[56,3],
    [56,82],[54,85],
    [3,85],[0,82]
    ];
        translate([3,3])circle(3,$fn=20);
        translate([53,3])circle(3,$fn=20);
        translate([53,82])circle(3,$fn=20);
        translate([3,82])circle(3,$fn=20);
    */
offset(3,$fn=20)polygon(rpiMainPolygon);
}

//color("DarkGreen")
difference()
{

raspberry();
rpiWholes();   
    
}
