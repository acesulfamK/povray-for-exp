#include "colors.inc" 
#include "shapes.inc"
 
camera{
  location <40,20,-40>  
  look_at<0,0.0,0>
  angle 30
} 
 
light_source{<40,20,-40> color 2*White}

object{ //x-axis
   cylinder{<-50,0,0>,<50,0,0>,0.05}
   pigment{color White}
}

object{ //y-axis
   cylinder{<0,-50,0>,<0,50,0>,0.05}
   pigment{color White}
}

object{ //z-axis
   cylinder{<0,0,-50>,<0,0,50>,0.05}
   pigment{color White}
} 

//triarrows(0,0,0)

background{Gray40}