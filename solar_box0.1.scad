box_width = 60;
box_height = 40;
box_depth = 40;
box_side_width = 3;
box_extra = box_width / 2;


difference(){
    
    //outside
    cube([box_height,box_width,box_depth], true);
    //inside
    translate([0,0,3]) cube([box_height - box_side_width ,box_width - box_side_width,box_depth - box_side_width + 3], true);

}
