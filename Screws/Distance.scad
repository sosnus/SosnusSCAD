module distance()
{
    color("Silver")linear_extrude(height=10) 
    {
        difference()
        {
            circle(r=2.5,$fn=6);
            // echo("maybe other r?");
            circle(r=1.25,$fn=20);
        }
    }
}

//distance();