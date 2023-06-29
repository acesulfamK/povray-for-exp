#include "colors.inc" 
#include "shapes.inc"
#include "woods.inc"
#include "metals.inc"
#include "stones.inc"
#include "textures.inc" 
#include "skies.inc"    


sky_sphere {
  S_Cloud5
}

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




background{Gray40}
 
#macro arrow(px,py,pz,dx,dy,dz,col)  
union{
    object{
        cylinder{<px,py,pz>,<px+dx/2,py+dy/2,pz+dz/2>,0.25}
        pigment{color col}
    }
    object{
     cone{<px+dx/2,py+dy/2,pz+dz/2>,0.5,<px+dx,py+dy,pz+dz>,0}
        pigment{color col}
    }
}

#end

#macro triarrows(px,py,pz,length)   
object{
    sphere{<px,py,pz>,length/10}
    pigment{color White}
}
arrow(px,py,pz,length,0,0,Red)    
arrow(px,py,pz,0,length,0,Green)
arrow(px,py,pz,0,0,length,Blue)
#end

triarrows(1,0,0,5)