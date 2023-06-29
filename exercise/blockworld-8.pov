#include "colors.inc" 
#include "shapes.inc"
#include "woods.inc"
#include "metals.inc"
#include "stones.inc"
#include "textures.inc"
 
camera{
  location <-10,10,-20> 
  look_at<0,0.5,0>
  angle 30
} 
 
light_source{<-8,20,-20> color 2*White}

object{ 
  Plane_XZ
    pigment{ color Wheat}     
    translate<0,-3,0>
}
 
object{ 
  cylinder{<0,0,0>,<0,0,-2>,1}
    pigment{color White}
    rotate 90*x
    translate<0,1,0>

}

object{ 
  Cone_Y
    translate <0,4,0>
 
    texture{Brass_Texture}

}                                  


difference{
  object{
    Cube
      pigment{MediumBlue}
      rotate 45*y      
      texture{pigment{Cherry_Wood}}
  }

  object{
    sphere{<0,0,0>,1.1}
      pigment{color White}            
      scale 1.2 
  }

}

object{
  Sphere
    pigment{color Cyan}
    translate<-4,-2,0>   
}
 
object{
  Cube
    texture{pigment{Jade}}
    rotate 45*y 
    translate<0,-2,0>
}

object{
  box{<1,-4,-1>,<5,-1,1>}
    pigment{YellowGreen}
    rotate 45*y
} 
 
object{
  Cube
    pigment{color Yellow}
    rotate 45*y 
    translate<0,-2,8>
}    

object{
  Disk_X
    pigment{Orchid}
    translate<-2,-2,7> 
}  

object{
  Disk_Z
    pigment{color ForestGreen}
    translate<7,-2,6>
} 



superellipsoid{<0.25,0.25> 
    material{M_Dark_Green_Glass}
    translate<7,-2,3>
}
