// all measurements in mm
PanelThickness = 5;
WallThickness = 2;
MountScrewDiameter = 4.8;
MountScrewHeadSize = 8.5;
Adjustment = 0.1;
OutsideSize = [120, 160, 210];
FrontPanelLip = PanelThickness*2;
OutsideChamfer = 2.5;
InternalChamfer = 1;

proto=false;
target = "panel";   // One of "panel", "text", "box"

$fn=50;

// A module to make cubes with rounded corners
// size and center are the same as cube()
// chamfer is the radius of the rounded chamfer, this produces strange effects if greater than half a size
// mode tells the module which sides to round
//   "around" - The outside corners "around" the cube
//   "corner" - All edges extending from one rounded corner are rounded
//   "side" - All edges extending from two adjacent rounded corners are rounded
//   "top" - All corners around the top are rounded, as well as all edges between and all vertical edges
module chamcube(size, chamfer, center=false, mode) { // Valid Modes: "around", "top", "side" or "corner"
    if (!is_list(size)) { size = [size, size, size]; }
    function top_corners_centered(size) = [  [-size[0]/2, -size[1]/2, size[2]/2],
                                    [-size[0]/2, size[1]/2, size[2]/2], 
                                    [size[0]/2, size[1]/2, size[2]/2],
                                    [size[0]/2, -size[1]/2, size[2]/2], 
                                    ];
    module top_1(mode, r) {
        if (mode == "around") cylinder(h=r*2, r=r, center=true);
        else sphere(r=r);
    }
    module top_2(mode, r) {
        if (mode == "around") cylinder(h=r*2, r=r, center=true);
        else if (mode == "corner") rotate([90,0,0]) cylinder(h=r*2, r=r, center=true);
        else sphere(r=r);
    }
    module top_3(mode, r) {
        if (mode == "around") cylinder(h=r*2, r=r, center=true);
        else if (mode == "corner") cube(r*2, center=true);
        else if (mode == "side") rotate([0,90,0]) cylinder(h=r*2, r=r, center=true);
        else sphere(r=r);
    }
    module top_4(mode, r) {
        if (mode == "around") cylinder(h=r*2, r=r, center=true);
        else if (mode == "corner" || mode == "side") rotate([0,-90,0]) cylinder(h=r*2, r=r, center=true);
        else sphere(r=r);
    }
    module bot_1(mode, r) {
        cylinder(h=r*2, r=r, center=true);
    }
    module bot_2(mode, r) {
        if (mode == "corner") cube(r*2, center=true);
        else cylinder(h=r*2, r=r, center=true);
    }
    module bot_3(mode, r) {
        if (mode == "corner" || mode == "side") cube(r*2, center=true);
        else cylinder(h=r*2, r=r, center=true);
    }
    module bot_4(mode, r) {
        if (mode == "corner" || mode == "side") cube(r*2, center=true);
        else cylinder(h=r*2, r=r, center=true);
    }
    function adjust(v1, v2) = [v1.x*v2.x, v1.y*v2.y, v1.z*v2.z];
    translate(center?[0,0,0]:size/2) {
        hull() {
            corner_move = size/2 - [chamfer, chamfer, chamfer];
            translate(adjust(corner_move, [+1,+1,+1])) top_1(mode, chamfer);
            translate(adjust(corner_move, [+1,-1,+1])) top_2(mode, chamfer);
            translate(adjust(corner_move, [-1,-1,+1])) top_3(mode, chamfer);
            translate(adjust(corner_move, [-1,+1,+1])) top_4(mode, chamfer);
            
            translate(adjust(corner_move, [+1,+1,-1])) bot_1(mode, chamfer);
            translate(adjust(corner_move, [+1,-1,-1])) bot_2(mode, chamfer);
            translate(adjust(corner_move, [-1,-1,-1])) bot_3(mode, chamfer);
            translate(adjust(corner_move, [-1,+1,-1])) bot_4(mode, chamfer);
        }
    }
}


module abox(size, chamfer, mode, center=false) {
    if (proto) cube(size, center=center);
    else chamcube(size, chamfer, mode=mode, center=center);
}

module KnobIndicator() {
    total_height = 30;
    top_radius = 7;
    center_open = 1;
    outer_chamfer = 1;
    indicator_length = top_radius - center_open - outer_chamfer;
    indicator_depth = 0.5;
    translate([0,0,-total_height]) intersection() {
        translate([0,-indicator_length/2-center_open,30]) cube([0.5, indicator_length, indicator_depth*2], center=true);
        cube([top_radius*2, top_radius*2, total_height*2+0.001],center=true);
    }
}

module Knob() {
    base_radius = 12;
    base_height = 2;
    contour_height = 24;
    total_height = 30;
    top_radius = 7;
    hole_depth = 12;
    hole_radius = 3.4+Adjustment;
    key_offset = 0.6;
    key_depth = 10;
    indicator_to_key_angle = 90-64;
    module MainKnobBody() {
        difference() {
            square(size=[base_radius, total_height]);
            union() {
                translate([base_radius, contour_height])
                    resize([2*(base_radius-top_radius),2*(contour_height-base_height)]) circle(r=1);
                
                translate([top_radius, contour_height]) square(size=[base_radius, total_height]);
                translate([top_radius-1, total_height-1]) difference() { square([1,1]);  circle(r=1); }
            }
        }
    }
    difference() {
        translate([0,0,-total_height]) {
            difference() {
                rotate_extrude($fn=16) MainKnobBody();
                cylinder(r=hole_radius, h=hole_depth);
            }
            rotate(indicator_to_key_angle)
                translate([key_offset,-hole_radius,hole_depth-key_depth])
                    cube([hole_radius, hole_radius*2, key_depth]);
        }
        
        KnobIndicator();
    }
}

MountHoleWidth = 10;
function MountHoleLeft(width=OutsideSize.x) = width - WallThickness - MountHoleWidth/2;
function MountHoleRight(width=OutsideSize.x) = WallThickness + MountHoleWidth/2;
function MountHoleTop(height=OutsideSize.y) = MountHoleLeft(height);
function MountHoleMid(height=OutsideSize.y) = height/2;
function MountHoleBot(height=OutsideSize.y) = WallThickness + MountHoleWidth/2;

module MountScrewHole(head_depth=2, thickness=10) {
    translate([0,0,-thickness]) cylinder(r=MountScrewDiameter/2+Adjustment, h=thickness+0.001);
    translate([0,0,-head_depth]) cylinder(r=MountScrewHeadSize/2+Adjustment, h=head_depth+0.001);
}


module ScrewMount(depth, type="") {  // Type is "flip", "side" or "standard"
    support_thickness = 1;
    half=MountHoleWidth/2;
    rotation = (type=="flip" || type=="side")?0:-90;
    translate([0,0,-depth/2]) {
        difference() {
            rotate([0,0,rotation])
                chamcube([MountHoleWidth,MountHoleWidth,depth],1, center=true, mode=(type=="side")?"side":"corner");
            cylinder(r=MountScrewDiameter/2+Adjustment, h=depth+0.001, center=true);
        }
        intersection() {
            translate([0,0,-depth/2]) rotate([0,0,rotation])
                chamcube([MountHoleWidth,MountHoleWidth,depth*2],1, center=true, mode=type=="side"?"side":"corner");
            union() {
                if(type == "side" || type != "flip") {
                    translate([-half,-half+support_thickness/2,-half-depth]) rotate([90,0,0])
                        linear_extrude(height=support_thickness, center=true) {
                            polygon([[MountHoleWidth,MountHoleWidth],[0,MountHoleWidth],[0,0]]);
                    }
                }
                if (type == "side" || type == "flip") {
                    translate([-half,half-support_thickness/2,-half-depth]) rotate([90,0,0])
                        linear_extrude(height =support_thickness, center=true) {
                            polygon([[MountHoleWidth,MountHoleWidth],[0,MountHoleWidth],[0,0]]);
                    }
                }
            }
        }
    }
}

module LedSocket() {
    // Center is aligned with panel front-face (clearance 20mm back, 1mm forward)
    translate([0,0,-4.5]) cylinder(r=(3/2)+Adjustment, h=5.5);
    translate([0,0,-18.5]) cylinder(r=(3.8/2)+Adjustment, h=15);
}
module LedSocket5() {
    // Center is aligned with panel front-face (clearance 20mm back, 1mm forward)
    translate([0,0,-7.5]) cylinder(r=(5.1/2)+Adjustment, h=8.5);
    translate([0,0,-21.5]) cylinder(r=(5.6/2)+Adjustment, h=15);
}
module PortHole() {
    // Center aligned with panel front-face (clearance 20mm back, 1mm forward)
    translate([0,0,-10]) cylinder(r=2+Adjustment, h=20, center=true);
    translate([0,0,-2.5]) cylinder(r=4+Adjustment, h=3.5);
}

module PortSupport(thickness) {
    // holder for 7mm diameter hex nut
    depth = 2;
    // hex, 7mm across narrow, 3mm deep
    translate([0,0,-thickness-depth])

    difference() {
        cylinder(r=6, h=depth);
        rotate_extrude($fn=6) {square(4);}
    }
}
module FuseSocket(panelThickness=PanelThickness) {
    // Center is aligned with panel front face (clearnce back 25mm)
    translate([0,0,-1]) cylinder(r=8.1+Adjustment, h=2);
    if (!proto) {
        intersection() {
            cylinder(r=5.8+Adjustment, h=10, center=true);
            cube([11+Adjustment,12,10], center=true);
        }
    }
    translate([0,0,-(panelThickness+9)]) cylinder(r=8.1+Adjustment, h=10);
}



module VoltmeterAmmeterSocket() {
    translate([0,0,-10]) cube([45+(2*Adjustment), 26, 21], center=true);
    translate([0,0,-3-1.8]) cube([24, 28, 6], center=true);
}

module GroundBank(count) {
    for (x = [-count/2 : 1 : count/2]) {
        translate([x*15,0,0]) PortHole();
    }
}

module SelectorKnobHole(panelThickness) {
    translate([0,0,-20]) cylinder(r=3.25+Adjustment, h=21);
    
    backWasher = min(panelThickness, 6)-1;
    translate([0,0,-(backWasher+8)]) cylinder(r=23.8/2, h=8);
}

module SelectorKnobSupport(panelThickness) {
    backWasher = min(panelThickness, 6)-1;
    support_wall_thickness = 2;
    support_wall_height = 6;
    translate([0,0,-support_wall_height-backWasher-1]) difference() {
        cylinder(r=23.8/2+support_wall_thickness, h=support_wall_height);
        translate([0,0,-0.005]) cylinder(r=23.8/2, h=support_wall_height+0.01);
    }
    rotate([0,0,18]) translate([0,support_wall_thickness+1,1-support_wall_height-panelThickness])
        rotate([90,0,0]) translate([0,0,-23.8/2]) cylinder(h=1, r=1);
    
    rotate([0,0,180+18]) translate([0,support_wall_thickness+1,1-support_wall_height-panelThickness])
        rotate([90,0,0]) translate([0,0,-23.8/2]) cylinder(h=1, r=1);
}

module MainPowerIndicators(horizontal=false) {
    translate([6,0,-10]) cube([8.5,13,21], center=true);
    translate([6,0,-10]) cube([3.6,14, 21], center=true);
    translate([-6,4,0]) LedSocket5();
    translate([-6,-4,0]) LedSocket5();
}

module USBPortHole() {
    translate([0, 0, -10]) cube([14.6, 7, 21], center=true);
}

module USBSupport(PanelThickness, peg=false) {
    
    offset_to_bottom_of_hole = 3.5; // Half of the height of USBPortHole
    support_plate_below_hole = 3; // How far down below that hole do we go to get to the circuit board bottom
    support_thickness = 4;  // How thick do we want our support plate
    support_width = 19;   // How wide
    screw_hole_distance_from_front = 17.3; // How far from the front panel to the support hole
    back_support = 6.5;                     // how much behind the screwhole are we supporting with plastic
    support_depth = screw_hole_distance_from_front + back_support - PanelThickness;
    
    screw_hole_x_offset = 6;
    screw_hole_diameter = 3;
    peg_diameter = 2;
    peg_height = 3.5;
    clearance_for_solder = [16, 2, 9];  // The pocket in this shape for the USB solder connectors
    backstop_height = support_thickness+peg_height + 1;
    backstop_width = 6;
    
    translate([0, -offset_to_bottom_of_hole-support_plate_below_hole, -PanelThickness])
    union() {
        difference() {
            translate([0, -support_thickness/2,-(support_depth/2)])
                cube([support_width, support_thickness, support_depth], center=true);
            union() {
                translate([0, -clearance_for_solder[1]/2+0.01, -clearance_for_solder[2]/2])
                    cube(clearance_for_solder + [0,0.02,0], center=true);
                if (!peg) {
                    translate([0, 0.01, PanelThickness-screw_hole_distance_from_front])
                    {
                        translate([screw_hole_x_offset,0,0]) rotate([90,0,0])
                            cylinder(r=screw_hole_diameter/2+Adjustment, h = support_thickness+0.02);
                        translate([-screw_hole_x_offset,0,0]) rotate([90,0,0])
                            cylinder(r=screw_hole_diameter/2+Adjustment, h = support_thickness+0.02);
                    }
                }
            }
        }
        if (peg) {
            translate([0, 0, PanelThickness-screw_hole_distance_from_front])
            {
                translate([screw_hole_x_offset,0,0]) rotate([-90,0,0]) cylinder(r=peg_diameter/2, h = peg_height);
                translate([-screw_hole_x_offset,0,0]) rotate([-90,0,0]) cylinder(r=peg_diameter/2, h = peg_height);
            }
            translate([0,+0.25,-support_depth-(backstop_width/2)]) rotate([0,180,0])
                chamcube([support_width, backstop_height, backstop_width], 2, center=true, mode="side");
        }
    }
        
}


module Text(text) {
    translate([0,0,-0.5]) linear_extrude(height=0.5005)
            text(text=text, halign="center", valign="center", size=7, font="Liberation Mono:style=Bold");
}

module KnobIndicatorPrint(size=OutsideSize) {
    translate([0,0,-1]) {
        expansion = 10;
        translate([-2*expansion, -expansion, 0]) cylinder(h=1, r=1);
        translate([-2*expansion, expansion+size.y, 0]) cylinder(h=1, r=1);
        translate([2*expansion+size.x, expansion+size.y, 0]) cylinder(h=1, r=1);
        translate([2*expansion+size.x, -expansion, 0]) cylinder(h=1, r=1);
    }
    KnobIndicator();
}

module PanelText(size=OutsideSize) {
    translate([0,0,-1]) {
        expansion = 10;
        translate([-2*expansion, -expansion, 0]) cylinder(h=1, r=1);
        translate([-2*expansion, expansion+size.y, 0]) cylinder(h=1, r=1);
        translate([2*expansion+size.x, expansion+size.y, 0]) cylinder(h=1, r=1);
        translate([2*expansion+size.x, -expansion, 0]) cylinder(h=1, r=1);
    }
    
    LabelOffset = 17;
    switchBankLoc = [10, 116, 0];
    switchYSep = 24;
    translate(switchBankLoc) {
        translate([LabelOffset, 1-0 * switchYSep, 0]) Text("3.3V");
        translate([LabelOffset, 1-1 * switchYSep, 0]) Text("5V");
        translate([LabelOffset, 1-2 * switchYSep, 0]) Text("12V");
        translate([LabelOffset, 1-3 * switchYSep, 0]) Text("V");
    }

    negativeBankLoc = [110, 115, 0];
    negativeYSep = 15;
    translate(negativeBankLoc) {
        translate([-LabelOffset, 1-0 * negativeYSep, 0]) Text("-5V");
        translate([-LabelOffset, 1-1 * negativeYSep, 0]) Text("-12V");
    }
    
    translate([40, 140, 0]) KnobIndicator();
}


module Panel(size=OutsideSize,
             frontPanelThickness=FrontPanelLip,
             outerChamfer=OutsideChamfer,
             innerChamfer=InternalChamfer) {
    mainSwitchLoc = [90, 148, 0];
    voltmeterLoc = [40, 140, 0];
    usbLoc = [[80, 134, 0], [105, 134, 0], [24, 86, 0]];
                 
    switchBankLoc = [10, 116, 0];
    switchYSep = 24;
    selectorOffset = 20;
    negativeBankLoc = [110, 115, 0];
    negativeYSep = 15;
                 
    groundBankLoc = [45, 35, 0];
    groundBankOffsets = [[0,0,0], [15, 0, 0], [30, 0, 0], [45, 0, 0], [65,20,0]];
    extraPorts = [[67.5, 52, 0]];
    fuseBoxLoc = [20, 18, 0];
    fuseCount = 5;
                 
    cableRuns = [[35,[30, 60, 105]], [39,[77.5]], [92, [90, 110]], [100,[30, 50]]];   // [X, [Y's]]
                 
    
    module BoxLid(size, frontPanelThickness, outerChamfer, innerChamfer) {
        translate([0,0,-frontPanelThickness+PanelThickness]) {
            difference() {
                translate([0,0,-PanelThickness])
                    abox([size.x,size.y,frontPanelThickness], outerChamfer, mode="top");
                translate([WallThickness/2-Adjustment/2,WallThickness/2-Adjustment/2,-PanelThickness-0.001])
                    abox([size.x-WallThickness+Adjustment,
                            size.y-WallThickness+Adjustment,
                            frontPanelThickness-PanelThickness],
                                innerChamfer, mode="top");
            }
        }
    }
    module CableRun() {
        thick=2;
        height=3;
        radius=6;
        translate([0,0,-height]) {
            rotate([-90,0,0]) rotate_extrude(convexity = 10, angle=180) translate([radius, 0, 0]) circle(r = thick);
            translate([-radius,0,0]) cylinder(r=thick,h=height);
            translate([radius,0,0]) cylinder(r=thick,h=height);
        }
    }
    module VoltagePanelHoles (name, thickness, voltageOnly=false, reversed=false) {
        SwitchOffset = reversed?-35:35;
        PortOffset = 0;
        LedOffset = reversed?-6.3:6.3;
        LabelOffset = reversed?-17:17;
        LedOffset_Y = 5;
        
        module SwitchHole () {
            // Shape for mounting a vertical switch hole, full-depth
            // meant to be used with difference against a panel or holding block for the base
            // Center aligned with panel front-face
            translate([0,0,-4]) {
                translate([-4,-6.5,-10]) cube([8+(2*Adjustment), 13+(2*Adjustment), 10]);
                translate([0,0,-1]) cylinder(r=(5.8/2)+Adjustment,h=6);
            }
        }   
        translate([LabelOffset,1,0]) Text(name);
        translate([PortOffset,0,0]) PortHole();
        if (!voltageOnly) {
            translate([SwitchOffset,0,0]) SwitchHole();
            translate([LedOffset,LedOffset_Y,0]) LedSocket();
        }
    }
    

    
    difference () {
        BoxLid(size, frontPanelThickness, outerChamfer, innerChamfer);
        union () {
           translate(switchBankLoc) {
                translate([0, -0 * switchYSep, 0]) VoltagePanelHoles("3.3V", PanelThickness);
                translate([0, -1 * switchYSep, 0]) VoltagePanelHoles("5V", PanelThickness);
                translate([0, -2 * switchYSep, 0]) VoltagePanelHoles("12V", PanelThickness);
                translate([0, -3 * switchYSep, 0]) VoltagePanelHoles("V", PanelThickness, true);
                translate([1.5*switchYSep+selectorOffset,  -1.5*switchYSep, 0]) SelectorKnobHole(PanelThickness);
           }
           
           translate(negativeBankLoc) {
                translate([0, -0 * negativeYSep, 0]) VoltagePanelHoles("-5V", PanelThickness, false, true);
                translate([0, -1 * negativeYSep, 0]) VoltagePanelHoles("-12V", PanelThickness, false, true);
           }
            
           translate(voltmeterLoc) VoltmeterAmmeterSocket();
           for (i = extraPorts) translate(i) PortHole();
           for (i = groundBankOffsets) translate(groundBankLoc + i) PortHole();
           translate(mainSwitchLoc) MainPowerIndicators();
           for (i = usbLoc) translate(i) USBPortHole();
               
           translate([MountHoleRight(),MountHoleTop(),0]) MountScrewHole();
           translate([MountHoleRight(),MountHoleMid(),0]) MountScrewHole();
           translate([MountHoleRight(),MountHoleBot(),0]) MountScrewHole();
            
           translate([MountHoleLeft(),MountHoleTop(),0]) MountScrewHole();
           translate([MountHoleLeft(),MountHoleMid(),0]) MountScrewHole();
           translate([MountHoleLeft(),MountHoleBot(),0]) MountScrewHole();
           for (i = [0:fuseCount-1]) translate(fuseBoxLoc + [20*i,0,0]) FuseSocket();
        }
    }
    translate(switchBankLoc+[1.5*switchYSep+selectorOffset, -1.5*switchYSep, 0]) SelectorKnobSupport(PanelThickness);
    
    for (i = usbLoc) translate(i) USBSupport(PanelThickness, true);
    for (i = groundBankOffsets) translate(groundBankLoc + i) PortSupport(PanelThickness);
    for (i = extraPorts) translate(i) PortSupport(PanelThickness);
    
    for (i = [0:3]) translate(switchBankLoc +[0,-i*switchYSep,0]) PortSupport(PanelThickness);
    for (i = [0:1]) translate(negativeBankLoc + [0,-i*negativeYSep,0]) PortSupport(PanelThickness);
    
    for (i = cableRuns) for (y = i.y) translate([i.x,y,-PanelThickness]) CableRun();
    
    if (proto) {
        %translate([0,0,-PanelThickness]) {
            translate([MountHoleRight(),MountHoleTop(),0]) ScrewMount(10, "flip");
            translate([MountHoleRight(),MountHoleMid(),0]) ScrewMount(10,"side");
            translate([MountHoleRight(),MountHoleBot(),0]) ScrewMount(10);
            
            translate([MountHoleLeft(),MountHoleTop(),0]) ScrewMount(10);
            translate([MountHoleLeft(),MountHoleMid(),0]) ScrewMount(10,"side");
            translate([MountHoleLeft(),MountHoleBot(),0]) ScrewMount(10, "flip");
        }
    }
    
    translate(voltmeterLoc) Knob();
}


module Box(size, outerChamfer, innerChamfer) {
    footInset = [10,30];
    footHeight = 3;
    footFootprint = 15;
    ventOffset = 20;
            
    module BackStencil(height = 10) {
        hole_size = 3.5;
        hole_positions = [[-70,-27,0], [-70,37,0], [68,37,0], [44,-37,0]];

        for (i = hole_positions) translate(i) cylinder(h=height, r=hole_size/2+Adjustment, center=true);
        translate([-22,0,0]) chamcube([78,78,height], 2, center=true, mode="around");  // fan block
        translate([40,1.5,0]) chamcube([60,62,height], 2, center=true, mode="around");
    }
    module Foot(size, height) {
        scale([1,1,2*height/size]) intersection() {
            translate([0,0,size/2]) cube([size + 2*size, size, size], center=true);
            sphere(r=size/2);
        }
    }

    // A negative for making vent holes, the size is the hole size, so the resulting (centered) obj is wider
    module Window(size, barCount) {
        difference() {
            cube(size+[size.z,0,0.002], center=true);
            union() {
                width = size.x+size.z;
                translate([-width/2,0,0]) rotate([90,0,0]) cylinder(r=size.z/2, h=size.y, center=true);
                translate([width/2,0,0]) rotate([90,0,0]) cylinder(r=size.z/2, h=size.y, center=true);
                for (i = [1: barCount])
                   translate([i*width/(barCount+1)-width/2,0,0]) rotate([90,0,0])
                        cylinder(r=size.z/2, h=size.y, center=true);
            }
        }
    }

    difference() {
        union() {
            translate([0,0,PanelThickness])
                abox([size.x,size.y,size.z-2*PanelThickness], outerChamfer, mode="top");
            translate([size.x/2,size.y/2,PanelThickness/2])           // Main Box
                    rotate([0,180,0]) chamcube([size.x-WallThickness,size.y-WallThickness,PanelThickness],
                             innerChamfer, mode="top", center=true);  // Panel Lip
        }
        union() {
            // Main Cavity
            translate([WallThickness,WallThickness,-0.001])
               abox(size - 2*[WallThickness,WallThickness,PanelThickness], innerChamfer, mode="top");

            translate([WallThickness/2,size.y/2+ventOffset,35]) rotate([90,0,90])
                    Window([55, 25, WallThickness], 12);
            translate([size.x-WallThickness/2,size.y/2+ventOffset,35]) rotate([90,0,90])
                    Window([55, 25, WallThickness], 12);
            translate([size.x/2,WallThickness/2,35]) rotate([90,0,0]) Window([45, 30, WallThickness], 10);
            
            translate([size.x/2-10,WallThickness/2,size.z-25-PanelThickness-55]) rotate([90,0,0])
                Window([30, 45, WallThickness], 6);
            
            
            translate([size.x/2,size.y/2,size.z-PanelThickness-1]) rotate([0,0,-90]) BackStencil();
        }
    }

    translate([footInset.x,0,footInset.y]) rotate([90,0,0]) Foot(footFootprint, footHeight);
    translate([size.x-footInset.x,0,footInset.y]) rotate([90,0,0]) Foot(footFootprint, footHeight);
    translate([size.x-footInset.x,0,size.z-footInset.y]) rotate([90,0,0]) Foot(footFootprint, footHeight);
    translate([footInset.x,0,size.z-footInset.y]) rotate([90,0,0]) Foot(footFootprint, footHeight);
    
    translate([MountHoleRight(),MountHoleTop(),0]) rotate([180,0,0]) ScrewMount(10, "flip");
    translate([MountHoleRight(),MountHoleMid(),0]) rotate([180,0,0]) ScrewMount(10,"side");
    translate([MountHoleRight(),MountHoleBot(),0]) rotate([180,0,0]) ScrewMount(10);
    
    translate([MountHoleLeft(),MountHoleTop(),0]) rotate([0,180,0]) ScrewMount(10);
    translate([MountHoleLeft(),MountHoleMid(),0]) rotate([0,180,0]) ScrewMount(10,"side");
    translate([MountHoleLeft(),MountHoleBot(),0]) rotate([0,180,0]) ScrewMount(10, "flip");
}


module TestPanel() {
    USB2 = [40, 13, 0];
 difference () {
        translate([0,0,-PanelThickness]) chamcube([80,37,PanelThickness],2, mode="top");
        union () {
            translate([36, 28, 0]) VoltagePanelHoles("12V", PanelThickness);
            translate([15, 11, 0]) MainPowerIndicators(false);
            
            translate([65, 14, 0]) SelectorKnobHole(PanelThickness);
            translate(USB2) USBPortHole();
            
        }
    }
    translate(USB2) USBSupport(PanelThickness, true);
    translate([65, 14, 0]) SelectorKnobSupport(PanelThickness);
    translate([36+14, 28, 0]) PortSupport(PanelThickness);
}

module TestPanel2() {
    PortLoc = [6, 23, 0];
    USB2 = [10, 12, 0];
    TextLoc = [14,23.5,0];
    HoleLoc = [14,18,0];
    hole_size = 3.4;
 difference () {
        translate([0,0,-PanelThickness]) chamcube([20,29,PanelThickness],2, mode="top");
        union () {
            translate(TextLoc) Text("1");
            translate(PortLoc) PortHole();
            translate(USB2) USBPortHole();
            translate(HoleLoc) cylinder(h=12, r=hole_size/2+Adjustment, center=true);
        }
    }
    translate(USB2) USBSupport(PanelThickness, true);
    translate(PortLoc) PortSupport(PanelThickness);
}
module TestPanel2Text() translate([14,23.5,0]) Text("1");


rotate([180,0,0]) {
    if (target=="text") PanelText(OutsideSize);
    if (target=="panel") Panel(OutsideSize, FrontPanelLip, OutsideChamfer, InternalChamfer);
    if (target=="box") Box(OutsideSize, OutsideChamfer, InternalChamfer);
    if (target=="knobonly") Knob();
    if (target=="knobonly-indicator") KnobIndicatorPrint([0,0]);
}
