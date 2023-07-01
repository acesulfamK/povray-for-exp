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


// 光源の設定
light_source { <5, 50, -10> color rgb <1,1,1> } // 光源の位置と色

// start triarrows ============


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

//  end  triarrows  ===========


triarrows(1,0,0,5)

// 床の定義
box {
    <-5, -0.01, -5>, // 床の一角（x, y, z）※床の厚みを0.01ユニットとした
    <5, 0, 5> // 床の対角線上の角
    texture {
        pigment { color rgb <1, 1, 1> } // 床の色を白に設定
    }
}


camera { location <0,1,-3> look_at <0,0.5,0> }
light_source { <100,500,-1000> color rgb 1 }
#include "tree01.inc"
object { TREE }
