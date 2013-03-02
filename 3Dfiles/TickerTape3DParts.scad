tickerTapeW = 13.5;
tickerTapeHubR = 11.5/2;

tickerTapeFlangeT = 3;
tickerTapeFlangeR = 110/2;
tickerTapeFlangeReliefR = 5;
tickerTapeScrewR = 4.1/2;
tickerTapeCutR = 14;


printGuideHoleSpacing = 42;
printGuideLength = 68;
printGuideT = 4;
printGuideFlangeH = 2;
printRollerR = 5.5/2;
printIdlerR = 9.8/2;
printIdlerRollerSpacing = 33;
printHeadWidth = 24;


mTapeHolderBody();
translate([0,0,tickerTapeFlangeT+tickerTapeW])
	mTapeHolderWasher();
mPrintGuide();
!mTapeHolderWasherNEW();
mTapeHolderWasherNEW2();

//mCountersink(7.6/2,tickerTapeScrewR,10);

module mTapeHolderWasherNEW(){
	difference(){
		cylinder(r=tickerTapeFlangeR, h = tickerTapeFlangeT);
		cylinder(r=printIdlerR, h = 4*tickerTapeW,center=true);
		mTapeHolderCuts();
	}
}

module mTapeHolderWasherNEW2(){
	difference(){
		union(){
			cylinder(r=tickerTapeFlangeR, h = tickerTapeFlangeT);
			cylinder(r=2*printIdlerR, h = 2*12.6-tickerTapeFlangeT-tickerTapeW);
		}
		cylinder(r=printIdlerR, h = 4*tickerTapeW,center=true);
		mTapeHolderCuts();
	}
}


module mTapeHolderBody(){
	difference(){
		union(){
			cylinder(r=tickerTapeFlangeR, h = tickerTapeFlangeT);
			translate([0,0,tickerTapeFlangeT])
				cylinder(r=tickerTapeHubR, h = tickerTapeW);
		}
		cylinder(r=tickerTapeFlangeReliefR, h = 2*tickerTapeFlangeT,center=true);
		translate([0,0,tickerTapeFlangeT+0.5])
			cylinder(r=tickerTapeScrewR, h = 2*tickerTapeW);
		mTapeHolderCuts();
	}
}

module mTapeHolderWasher(){
	difference(){
		cylinder(r=tickerTapeFlangeR, h = tickerTapeFlangeT);
		cylinder(r=tickerTapeScrewR, h = 4*tickerTapeW,center=true);
		mTapeHolderCuts();
	}
}

module mTapeHolderCuts(){
	for(i=[0:6]){
		rotate([0,0,360/6*i])translate([3*tickerTapeFlangeR/5,0,0])
		cylinder(r=tickerTapeCutR, h = 4*tickerTapeW,center=true);
	}
}

module mPrintGuide(){
	difference(){
		union(){
			difference(){
				translate([0,0,printGuideT/2])
					cube([tickerTapeW,printGuideLength,printGuideT],center=true);
				translate([0,-printGuideLength/2,printGuideT])rotate([30,0,0])
					cube([tickerTapeW,printGuideLength,printGuideT],center=true);
			}
			difference(){
				for(i=[-1,1]){
					translate([i*(tickerTapeFlangeT+tickerTapeW)/2,0,(printGuideT+printGuideFlangeH)/2])
						cube([tickerTapeFlangeT,printGuideLength,printGuideT+printGuideFlangeH],center=true);
				}

				translate([0,printIdlerR-printGuideLength/2+printIdlerRollerSpacing,printGuideT+printRollerR-0.1])rotate([0,90,0])
					cylinder(r=printRollerR, h = tickerTapeW+2*tickerTapeFlangeT+2,center =true,$fn=20);
				translate([-(tickerTapeFlangeT+tickerTapeW)/2,printIdlerR-printGuideLength/2+printIdlerRollerSpacing-printHeadWidth/2,printGuideT+10/2])
					cube([tickerTapeFlangeT+0.1,printHeadWidth,10],center=true);
				translate([0,printIdlerR-printGuideLength/2,printGuideT+printIdlerR-0.1])rotate([0,90,0])
					cylinder(r=printIdlerR, h = tickerTapeW+2*tickerTapeFlangeT+2,center =true,$fn=20);
			}
		}
		for(i=[-1,1]){
			translate([0,i*printGuideHoleSpacing/2,printGuideT])
				mCountersink(7.6/2,tickerTapeScrewR,10);
		}

	}
}

module mCountersink(headRadius, holeRadius, holeDepth,csAngle = 82){
	union(){
		translate([0,0,-0.1])
		cylinder(r=headRadius, h = holeDepth,$fn=20);
		rotate([180,0,0]){
			cylinder(r1=headRadius, r2 = 0, h = tan(csAngle/2)*headRadius,$fn=20);
			cylinder(r=holeRadius, h = holeDepth,$fn=20);
		}
	}

}
