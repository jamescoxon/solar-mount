//Solar panel mounting and box
// v0.3
// jacoxon@googlemail.com

//Two large for my 3d printer so have add method of spliting design into two
// interlocking panels - just need to uncomment section at bottom in turn to
// show panels. Aiming to glue panels though could do PLA friction welding if
// you had a dremel.

//Size of panel
panel_width = 69;
panel_height = 110;
panel_depth = 2;

gap_between_panels = 10;
support_width = 3;

tolerance = 0.5;

m3_r = 3.8;
antenna_r = 1.5;

//Box inset to make it easier to add a box to the bottom
box_width = 60;
box_height = 40;
box_side_width = 3;
box_extra = box_width / 2;

difference(){
union() {
    //Create base
    difference(){
        cube([panel_height / 2, panel_width * 2 + gap_between_panels + (    support_width * 2), support_width], true);
        
        translate([0,(panel_width + gap_between_panels + box_extra) / 2,0]) cube([(     panel_height / 2 - (support_width * 2)), panel_width - (support_width +box_extra),support_width + 2], true);
        
        translate([0,-(panel_width + gap_between_panels + box_extra) / 2,0]) cube([(     panel_height / 2 - (support_width * 2)), panel_width - (support_width +box_extra),support_width + 2], true);
        
    }
    
    //Move up from base
    translate([0,0,panel_depth]) 
    //Generate edges to keep panels in place
    difference() {
        cube([panel_height / 2, panel_width * 2 + gap_between_panels + (    support_width * 2), support_width], true); 
    
        translate([0,(panel_width + gap_between_panels) / 2,0]) cube([(     panel_height / 2 + support_width), panel_width + (tolerance *2), support_width+2     ], true);
    
        translate([0,-(panel_width + gap_between_panels) / 2,0]) cube([(    panel_height / 2 + support_width), panel_width + (tolerance *2), support_width+2],
        true);
}
}

//Antenna hole
translate([0,0,-10]) cylinder(20, antenna_r, true);

//Bolt holes for support
translate([23,0,-10]) cylinder(20, m3_r, true);
translate([-23,0,-10]) cylinder(20, m3_r, true);

//Box ridge (to make a nice fit)
difference(){
    //outside
    translate([0,0,-2]) cube([box_height,box_width,3], true);
    //inside
    translate([0,0,-2]) cube([box_height - box_side_width ,box_width - box_side_width,3], true);
}

//Big box to remove one whole section
//To make panel One
//translate([0,panel_width / 2 + (gap_between_panels / 2) + support_width,0]) cube([panel_height,panel_width + support_width + 5,10], true);
//translate([0,0,0]) cube([(panel_height / 2) / 3 + tolerance, gap_between_panels + tolerance,10], true);

//To make panel Two
//translate([0,- (panel_width / 2 + (gap_between_panels / 2) + support_width),0]) cube([panel_height,panel_width + support_width + 5,10], true);
//translate([(panel_height / 2) / 3,0,0]) cube([(panel_height / 2) / 3 + tolerance, gap_between_panels + tolerance,10], true);
//translate([-((panel_height / 2) / 3),0,0]) cube([(panel_height / 2) / 3 + tolerance, gap_between_panels + tolerance,10], true);
}