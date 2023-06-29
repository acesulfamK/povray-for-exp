sky_sphere { pigment { color rgb 0.7 } }
camera { location <0,1,-3> look_at <0,0.5,0> }
light_source { <100,500,-1000> color rgb 1 }
#include "tree01.inc"
object { TREE }
