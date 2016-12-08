import tube;
import three;

import graph;

// Colours and material to make the logo.

//pen  goldenPenOld = hsv(51, .37, .47);
pen goldenPenOld = hsv(49, 0.71, 0.81);
pen goldenPen  = hsv(46,0.80,0.7);     // metalic gold

pen silverPenOld = hsv(60,.2,.52);
pen silverPen  = hsv(0,0,0.6);     // metalic silver

material gold   = material(goldenPenOld, specularpen=goldenPen, shininess=0);
material silver = material(silverPenOld, specularpen=silverPen, shininess=0);

currentprojection=perspective(1,0,1);
currentlight=light(0.5,0.5,0.1);




// Section used for engraving in gold.
path  sec = (1,0)--(-1,0)--(-1,-0.5)--(1,-0.5)--cycle;

// path used to build the circular coin.
path3 circle3(real r) { return path3(Circle((0,0),r)); }


// engrave the edge of the coin with gold
draw(tube(circle3(1.2), scale(0.1)  * sec),surfacepen=gold);

// engrave the inside of the coin with silver.
draw(tube(circle3(0.5), yscale(0.05) * xscale(0.7)  * sec), surfacepen=silver);



// The edward curve  x^2 + y^2 = 1 - d x^2 y^2 representing the diamond.
real d      = 42;

pair edwardsCurve(real t) {
     real x   = cos(t);
     real sgn = t <= pi ? 1 : -1;
     real y   = sgn * sqrt( (1 - x^2)/(1 + d * x^2) );
     return (x,y);
}

real mid=0.01;
real extreem=1 - mid;

path3 edwardsPath = path3(graph(edwardsCurve, 0 , 2 * pi));
path3 engraving   = roundedpath(edwardsPath, 0.05);

// engrave the edward's curve in the middle of the coin.
draw(tube(engraving, scale(0.07) * sec ), surfacepen=gold);
