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
#declare camera_mode = 1;

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
            location <0,50,10>
            look_at<0,47,30>
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

// make poles

#macro pole(bx,bz,h)
object{
    cylinder{<bx,0,bz>,<bx,h,bz>,5}
    pigment{color Brown}
}
#end

// generate random numbers

#declare num_pole = 30;
#declare rands = array[10][num_pole]
#declare r1 = seed(12345);

#local i = 0;
#while (i < num_pole)
    #declare j = 0;
    #while (j<10)
        #declare rands[j][i] = rand(r1);
        #declare j = j+1;
    #end
    #declare i = i + 1;
#end
    
// make recur rand
    
#declare rnd = 1;

#macro myrand(rnd)
#declare a = rand(seed(int(rnd*1000)));
#declare rnd = pow(a,2)*pow(-1,int(a*10));
#end
// make pole

#macro pole(bx,bz,h)
myrand(rnd)
#declare r1 = rnd;
myrand(rnd)
#declare r2 = rnd;
myrand(rnd)
#declare r3 = rnd;
myrand(rnd)
#declare r4 = rnd;
myrand(rnd)
#declare r5 = rnd;
object{
    cylinder{<bx+r1,0,bz+r2>,<bx+r3,h+r4,bz+r5>,5}
    pigment{color Brown}
}
#end


//make poles

#declare i = 0;
#declare gap = 50;
#declare oppression = 3; //／どれだけz軸によっていくか
#while(i<6)
    pole(30-oppression*i,100+gap*i,40)
    myrand(rnd)
    #declare r1 = rnd;
    myrand(rnd)
    #declare r2 = rnd;
    myrand(rnd)
    #declare r3 = rnd;
    myrand(rnd)
    #declare r4 = rnd;
    object{
        cylinder{<30-oppression*i+r1,30+r2*3,100+gap*i>,<30-oppression*(i+1)+r3,30+r4*3,100+gap*(i+1)>,5}
        pigment{color Brown}
    }
    #declare i = i+1;
#end

#declare oppression = -1;
#while(i<10)
    pole(10-oppression*i,100+gap*i,40)
    object{
        cylinder{<10-oppression*i,30,100+gap*i>,<10-oppression*(i+1),30,100+gap*(i+1)>,5}
        pigment{color Brown}
    }
    #declare i=i+1;
#end


//make grass

#declare YourObject = mesh {
  #include "LoliumPerenne_a2cxi_Big_lod0_OL.fbx.obj";
}

newmtl materialname
map_Kd yourtexture.png


object {
  MyObject
  texture { MyTexture }
}

