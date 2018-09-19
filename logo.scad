$fn = 200;

/* 
 Main logo module
 
 Params:
 - size (float) defines size of logo (diameter of ring) in milimeters
 _ keychain (bool) add hole for keychain if true
*/ 
module logo(size=10, keychain=false) {
    scale([size/10, size/10, size/10]) {
        color([0.94,0.44,0,1]) {
            linear_extrude(2.5) {
                union () {
                    // Ring 
                    difference() {
                        circle(10.5);
                        circle(7.5);
                    }
                    
                    // Inner mark
                    rotate([0, 0, 148]) {
                        translate([-1.7, -3, 0]) {
                            minkowski() {
                                circle(1.4);
                                square([0.0001, 11.1], true);
                            }
                        }
                    }
                    
                    rotate([0, 0, -142]) {
                        translate([2, 0, 0]) {
                            minkowski() {
                                circle(1.4);
                                square([0.0001, 4.8], true);
                            }
                        }
                    }
                   
                    // Tail
                    difference() {
                        rotate([0, 0, -136]) {
                            translate([1, 13, 0]) {
                                minkowski() {
                                    circle(1.8);
                                    square([0.0001, 6], true);  
                                }
                            }  
                        };
                        
                        // Keychain hole
                        if (keychain) {
                            translate([10, -11.75, 0]) {
                                circle(1.29);
                            }
                        }
                    }
                }
            }
        }
    }
}


// Demo time ;)
logo();
translate([30, 0, 0]) {
    logo(size=11.666, keychain=true);
}