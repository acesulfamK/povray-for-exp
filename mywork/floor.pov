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


// start camera mode
#declare camera_mode = 2;

#switch(camera_mode)
    #case(0)
        camera{
            location <0,1000,-1>
            look_at<0,0,0>
            angle 90
        }
    #break
    #case(1)
        camera{
            location <0,70,10>
            look_at<0,70,30>
            angle 60
        }
    #break
    #case(2)
        camera{
            location <300,300,-200>
            look_at<0,0,100>
            angle 60
        }
    #break
#end

// end mode


 
light_source{<4000,2000,-4000> color 5*White}  


// 光源の設定
//light_source { <5, 50, -10> color rgb <1,1,1> } // 光源の位置と色

// start triarrows,axis ============


#declare axis_diamiter = 2;

object{ //x-axis
    cylinder{<-5000,0,0>,<5000,0,0>,axis_diamiter}
    pigment{color White}
}      
object{ //y-axis
    cylinder{<0,-5000,0>,<0,500,0>,axis_diamiter}
    pigment{color White}
}
object{ //z-axis
    cylinder{<0,0,-5000>,<0,0,5000>,axis_diamiter}
    pigment{color White}
}

// start grid

#declare colors = #array[10]{
    Black,
    Brown,
    Red,
    MandarinOrange,
    Yellow,
    Green,
    SlateBlue,
    NavyBlue,
    DarkOrchid,
    Gray65,
};

#macro axline(p,axis,clr_num)
object{
    cylinder{p+1000*axis,p-1000*axis,1}
    pigment{color colors[clr_num]}
}
#end


#declare i = 0;
#while (i<=8)
    axline(<0,0,100*i>,x,i)
    axline(<100*i,0,0>,z,i)
    axline(<0,0,-100*i>,x,i)
    axline(<-100*i,0,0>,z,i)
    #declare i = i + 1;
#end

//end grid



#macro arrow(px,py,pz,dx,dy,dz,col)  
union{
    object{
        cylinder{<px,py,pz>,<px+dx/2,py+dy/2,pz+dz/2>,0.25*length/5}
        pigment{color col}
    }
    object{
     cone{<px+dx/2,py+dy/2,pz+dz/2>,0.5*length/5,<px+dx,py+dy,pz+dz>,0}
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


triarrows(100,10,100,100)

// 床の定義
box {
    <-1000, -0.01, -1000>, // 床の一角（x, y, z）※床の厚みを0.01ユニットとした
    <1000, 0, 1000> // 床の対角線上の角
    texture {
        pigment { color rgb <1, 1, 1> } // 床の色を白に設定
    }
}
