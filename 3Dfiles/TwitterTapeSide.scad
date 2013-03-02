holeR = 0.167*25.4/2;
$fn=20;

!side();
carriageHolder();

module carriageHolder(){
	mirror([1,0,0]){
		translate([163-84+6.5,85-41.3+2,0]){
			%cube([30.67,56.19,30.65]);
			%translate([-12,9,0])cube([12,28,12]);
		
		}
	difference(){
		union(){
			translate([163-84, 90-15])cylinder(r=6.5, h = 12+10);
			translate([163-84, 90-15-12])cylinder(r=6.5, h = 12+10);
			//translate([163-84+6.5,85-41.3+2,0])translate([0,10,12])//cube([30.67,31.75-2.3,10]);
			translate([0,0,12])
				linear_extrude(height=10){
					hull(){
					translate([163-84+6.5,85-41.3+2+9,0])
						square([30.67,31.75-3]);
					translate([163-84, 90-15])circle(6.5);
					translate([163-84, 90-15-12])circle(6.5);
					}
				}
		}
		translate([163-84, 90-15])cylinder(r=holeR+1, h = 100, center = true);
		translate([163-84, 90-15-12])cylinder(r=holeR+1, h = 100, center = true);
		//carriage holes
		translate([163-84+6.5,85-41.3+2,0]){
			translate([(30.67-19.58)/2,(31.75-2.3-21.59)/2+10,0])cylinder(r=3/2, h = 100, center = true);
			translate([(30.67-19.58)/2+19.58,(31.75-2.3-21.59)/2+10,0])cylinder(r=3/2, h = 100, center = true);
		}
	}
		%hull(){
			translate([229.5-84, 85+2-41.3])circle(5.39/2);
			translate([163-84, 88.5+2-41.3])circle(5.39/2);
		}
	
	}
}


module side(){
	mirror([1,0,0])difference(){
		union(){
			square([150, 85-41.3]);
			hull(){
				square([170-85,10]);
				translate([10, 80])circle(15,$fn=60);
				translate([163-84, 90-15])circle(6.5,$fn=60);
			}
			hull(){
				translate([80,0])square([150-80,10]);
				translate([229.5-84, 85+2-41.3])circle(10,$fn=60);
			}
			%cube([150,25.4*0.75,10]);
		}
		translate([10, 80])circle(holeR);
		translate([163-84, 90-15])circle(holeR);
		translate([163-84, 90-15-12])circle(holeR);
		translate([229.5-84, 85+2-41.3])circle(holeR);
		translate([163-84, 88.5+2-41.3])circle(holeR);
		translate([10, 25.4*0.75/2])circle(holeR);
		translate([150/2, 25.4*0.75/2])circle(holeR);
		translate([150-10, 25.4*0.75/2])circle(holeR);
		translate([150/4, 5])led5mm();
		translate([150*3/4-5, 5])led5mm();
	}
	
}


module led5mm(){
	translate([5/2,9-5/2])circle(5/2);
	square([5,9-5/2]);
	square([5.6,1.1]);
	translate([1,-2])square([1,5]);
	translate([3.3,-2])square([1,5]);
}


