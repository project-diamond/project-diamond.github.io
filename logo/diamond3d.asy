import tube;
import three;

import graph;

pen  golden = hsv(46,0.80,0.7); // metalic gold
pen  silver = hsv(0,0,0.6);     // metalic silver

path  sec = (1,0)--(-1,0)--(-1,-0.5)--(1,-0.5)--cycle;
path3 circle3(real r) { return path3(Circle((0,0),r)); }

currentprojection=perspective(0,0,1);
currentlight=light(1,1,0.1);

material mat;

material mat(pen p){ return material(p,diffusepen=p,emissivepen=p,specularpen=white, shininess=1); }

draw(tube(circle3(1.2), scale(0.1)  * sec),surfacepen=mat(golden));
draw(tube(circle3(0.5), yscale(0.05) * xscale(0.7)  * sec), surfacepen=mat(silver));

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

draw(tube(engraving, scale(0.07) * sec ), surfacepen=mat(golden));
