/* RailEduKit/InteractiveSignallingLaboratory © 2026 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: logo
 */
 
 // Parameters
include <../3d-models/scad/config/global_variables.scad> // include configuration file
$fn            = 200;
diameter       = 110;  // Outer diameter (point to point)
line_width     = 2;    // 
height         = 1;    // Height of hexagon
corner_radius  = 20;   // Radius of rounded corners
scale_x        = 1.0;  // hexagon Horizontal scaling (1 = no distortion)
scale_y        = 1.15; // hexagon Vertical scaling (1 = no distortion)
model3D        = true; // variable for external script call to export STL or SVG

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
    line_width     = 2,
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
            rounded_hexagon(diameter - 2 * line_width, radius - line_width/2, height + 1, scale_x, scale_y);
        }
    }
}

module track(with_rails=false){
    module rail(){// fake rails for the graphics
        cube([line_width,146,6],center = true);
    }
    module rails(){
        color("black") translate([   line_width*4,0,0]) rail();
        color("brown") translate([40-line_width*4,0,0]) rail();
    }
    difference(){
        translate([0,-144.25,0]) render_track("female", "none", "male", "none", false);
        if (with_rails) {
            translate([0,-73,0]) rails();
        }
    }
    difference(){
        translate([0,   0.25,0]) render_track("female", "none", "male", "none", false);
        if (with_rails) {
            translate([0,73,0]) rails();
        }
    }
}

module signal(){
    difference(){
        translate([-31,-25,-1]) signal_box();
        translate([-22, 10,-1]) symbol_block(engraving_thickness=line_width);
        translate([-10, -6,-1]) rotate([0,0,90]) symbol_distant(engraving_thickness=line_width);
        translate([-22,-21,-1]) symbol_route(engraving_thickness=line_width);
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

if (model3D) {
    linear_extrude(height = height)
    projection(cut = true)
    rotate([0, 0, -90])
    logo();
} else {
    projection(cut = true)
    rotate([0, 0, -90])
    logo();
}