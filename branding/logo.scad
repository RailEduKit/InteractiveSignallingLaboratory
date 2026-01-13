// Parameters
// include configuration file
include <../3d-models/scad/config/global_variables.scad>
$fn            = 200;
diameter       = 110;  // Outer diameter (point to point)
wall_thickness = 2;    // Wall thickness
height         = 20;   // Height of hexagon
corner_radius  = 20;   // Radius of rounded corners
scale_x        = 1.0;  // Horizontal scaling (1 = no distortion)
scale_y        = 1.15; // Vertical scaling (1 = no distortion)
rail_width     = 2;

// use external libraries
use <../3d-models/scad/jigs/track_straight.scad>;
use <../3d-models/scad/parts/signal_box.scad>;
use <../3d-models/scad/parts/signal_symbols.scad>;


// Module for hexagon with rounded corners
module rounded_hexagon(d, r, h, scale_x = 1, scale_y = 1) {
    // d = diameter, r = corner radius, h = height
    // scale_x, scale_y = scaling factors for elliptical distortion
    linear_extrude(height = h)
    scale([scale_x, scale_y, 1]) // Apply elliptical scaling
    offset(r = r) // Round the corners
    offset(r = -r)
    circle(d = d, $fn = 6); // Hexagon as circle with 6 segments
}

// Main object: difference between outer and inner hexagon
module logo_hexagon(
    diameter       = 50,
    wall_thickness = 2,
    height         = 10,
    radius         = 3,
    inner_empty    = true,
    scale_x        = 1,
    scale_y        = 1,
){
    difference() {
        // Outer hexagon
        rounded_hexagon(diameter, radius, height, scale_x, scale_y);
        
        // Inner hexagon (for hollow interior)
        if (inner_empty) {
            translate([0, 0, -0.5]) // Slightly lower for clean difference
            rounded_hexagon(diameter - 2 * wall_thickness, radius - wall_thickness/2, height + 1, scale_x, scale_y);
        }
    }
}

module track(with_rails=false){
    module rail(){// fake rails for the graphics
        cube([rail_width,146,6],center = true);
    }
    difference(){
        translate([0,-144.25,0]) render_track("female", "none", "male", "none", false);
        if (with_rails) {
            color("black") translate([7,-73,0]) rail();
            color("brown") translate([33,-73,0]) rail();
        }
    }
    difference(){
        translate([0,   0.25,0]) render_track("female", "none", "male", "none", false);
        if (with_rails) {
            color("black") translate([7,73,0]) rail();
            color("brown") translate([33,73,0]) rail();
        }
    }
}

module signal(){
    difference(){
        translate([-31,-25,-1]) signal_box();
        translate([-22, 10,-1]) symbol_block();
        translate([-10, -6,-1]) rotate([0,0,90]) symbol_distant();
        translate([-22,-21,-1]) symbol_route();
    }
}

module logo(){
    signal();
    intersection(){
        track(with_rails=true);
        logo_hexagon(radius=corner_radius,diameter=diameter,scale_x=scale_x,scale_y=scale_y,inner_empty = false);
    }
    difference(){
        logo_hexagon(radius=corner_radius,scale_x=scale_x,scale_y=scale_y,diameter=diameter);
        track(with_rails=false);
    }
    
}

projection(cut = true)
rotate([0,0,-90])
logo();