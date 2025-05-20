/* Scalable Braille Slate for 6 dot braille, 8 dot braille and dot graphics
Copyright (C) 2025 Jaewon Kim
LICENSE: GPL-3.0-or-later
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 3.
This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
*/
// For the fast 3d rendering, use OpenSCAD Developer Snapshot version with Manifold and turn off Automatic Preview from Customizer.
// sample slate
//color("white",1/4) translate([0,0,0]) slatebottom();
color("red",1/2) translate([0,0,t]) slatetop();
//color("green",1/2) translate([0,ysize+uy1,0]) slatetop();

$fn=16;
unit=1.6;
scale=0.95; // 1 basic // 0.95 compressed // 1.25 jumbo dot // 3 lego
cellcol=2; // column in a cell // 6 dot braille = 2 column * 3 row
cellrow=4; // row in a cell // 8 dot braille = 2 column * 4 row
dot=unit*scale; dotr=dot/2; //1.5~1.6 //use 1.6 for jumbo dot
dotx_spacing=unit*1.5*scale; ux1=dotx_spacing; //2.3~2.5
doty_spacing=unit*1.5*scale; uy1=doty_spacing; //2.3~2.5
cellgap=ux1; //1.0~2.4
linegap=uy1; //2.4~
slate_width=215; // letter paper width 215.9 // a4 203
repeat_row=20; // multiple of (cellrow+1) 20=least common multiple of 4 & 5
repeat=1; //1=50 basic // 3=150 half letter size // 6=300 letter size
dot_height_adjust=0.8; // dullness of dot tip
slate_thickness=2.4; t=slate_thickness; //unit*1.5;
cellsize=ux1*cellcol+cellgap; //column width with spacing for a cell
linesize=uy1*cellrow+linegap; //line height with spacing
xframe=ux1*3; yframe=uy1*2; //frame size
cellnum=round((slate_width-xframe)/cellsize);
linenum=repeat_row/(cellrow+1);
xwork=cellsize*cellnum; //x workspace for dots
ywork=linesize*linenum;  // y workspace for dots
xsize=xwork+xframe*2; //slate x size 
ysize=ywork*repeat+yframe*2; //slate y size

///* slate bottom
module slatebottom() {
    difference() {
        framebottom();
        for (rpt=[0:repeat-1]) {
            translate([ux1/2,rpt*ywork+uy1/2,t]) bottomcut();}}}
module framebottom() {
    translate([-xframe,-yframe,0]) cube([xsize-ux1,ysize,t]);
    for (rpt=[0:repeat-1]) {
        translate([-ux1/2,ywork*rpt,t]) paperhole(t/2,dotr,dotr);
        translate([-ux1/2,ywork*rpt,t*1.5]) paperhole(t/2,dotr,dotr/8);}}
module paperhole(t1,r1,r2) {
    x0=0; y0=-uy1/2; x1=xwork+ux1; y1=ywork-uy1/2;
    translate([x0,y0,0]) cylinder(t1,r1,r2);
    translate([x0,y1,0]) cylinder(t1,r1,r2);
    translate([x1,y0,0]) cylinder(t1,r1,r2);
    translate([x1,y1,0]) cylinder(t1,r1,r2);}
module bottomcut() {
    if (cellgap==ux1 && linegap==uy1)
        for (c1=[0:cellnum-1]) { for(l1=[0:linenum-1]) {
        translate([c1*cellsize,l1*linesize,0]) bottomcellall();}}
    else
        for (c1=[0:cellnum-1]) { for(l1=[0:linenum-1]) {
        translate([c1*cellsize,l1*linesize+linegap,0]) bottomcell();}}}
module bottomcell() {
    for (c1=[0:cellcol-1]) { for(r1=[0:cellrow-1]) {
    translate([c1*ux1,r1*uy1,0]) onedot();}}}
module bottomcellall() {
    for (c1=[0:cellcol]) { for(r1=[0:cellrow]) {
    translate([c1*ux1,r1*uy1,0]) onedot();}}}
module onedot() {
    translate([0,0,-0.1]) cylinder(0.1,dotr,dotr*1.1);
    scale([1,1,dot_height_adjust]) sphere(dotr);}
//*/
///* slate top
module slatetop() {
    difference() { frametop(); frametopcut();}
    for (rpt=[0:repeat-1]) { difference() {
        translate([0,rpt*ywork,0]) cube([xwork-cellgap,ywork,t]);
        translate([ux1/2,rpt*ywork+uy1*1.5,0]) topcut();}}}
module frametop() {
    difference() {
        translate([-xframe,-yframe,0]) cube([xsize-ux1,ysize,t]);
        translate([0,0,-0.1]) cube([xwork-cellgap,ywork*repeat,t+0.2]);}}
module frametopcut() {
    for (rpt=[0:repeat-1]) {
        translate([-ux1/2,rpt*ywork,-0.1]) paperhole(t+0.2,dotr+0.1,dotr+0.1);
        if (cellgap==ux1 && linegap==uy1)
            translate([-ux1*1.5,rpt*ywork+uy1,-0.1])
            paperhole(t+0.2,dotr+0.1, dotr+0.1);}}
module topcut() {
    for (c1=[0:cellnum-1]) { for(l1=[0:linenum-1]) {
    translate([c1*cellsize,l1*linesize+linegap,0]) topcell();}}}
module topcell() {
    translate([-ux1*0.15,-uy1*1.15,-0.1]) cube([ux1*(cellcol-0.7),uy1*(cellrow-0.7),t+0.2]);
    for (c1=[0:cellcol-1]) { for(r1=[0:cellrow-1]) {
        translate([c1*ux1,(r1-1)*uy1,-0.1]) cylinder(t+0.2,dotr,uy1/2);}}}
//*/