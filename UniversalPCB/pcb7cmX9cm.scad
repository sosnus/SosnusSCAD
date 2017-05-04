
module pcb()
{
    firstHole=[5,6];
    // pcbDrillOffsetX=5;
    // pcbDrillOffsetY=6;
    pcbMountHoles=[[5,3],[5,90-3+0.5],[70-5,90-3+0.5],[70-5,3]];
difference()
{
    square([70,90],0,0);

    for (j = [0:31]) for (i = [0:24]) translate([firstHole[0]+i*2.54,firstHole[1]+j*2.54])circle(0.5, $fn=20);
    
    for (k = pcbMountHoles)translate([k[0],k[1]])circle(1.5, $fn=20);
}
}




   pcb();