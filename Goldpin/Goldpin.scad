module pin()
{
    color("Gold")linear_extrude(height = 2.5+3+6.10, center = true)offset(0.02)square(0.3,center=true);  
        
}

module cover()
{
    color("Black")linear_extrude(height = 2.5, center = true)offset(0.27)square(2,center=true);
    
}

module goldPin()
{
    translate([0,0,(1.25+6.10)/2])
    pin();
    cover();
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

goldPinMulti(2,1);