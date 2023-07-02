#include "colors.inc" 
#include "shapes.inc"
#include "woods.inc"
#include "metals.inc"
#include "textures.inc" 
#include "skies.inc"    
#include "tree01.inc"

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
            angle 40
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


 
light_source{<1000,2000,-1000> color 4*White}  

object{
    TREE
    scale 200
    translate <200,400,50>
}

object{
    TREE    
    scale 200
    translate <200,400,150>
}

object{
    TREE    
    scale 200
    translate <200,400,100>
}


// 光源の設定
//light_source { <5, 50, -10> color rgb <1,1,1> } // 光源の位置と色

// start triarrows,axis ============


#declare axis_diamiter = 2;

#declare show = 0;

#if (show >= 1)
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
#else
#end

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

#if (show>=1)
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




// make poles

#macro pole(bx,bz,h)
object{
    cylinder{<bx,0,bz>,<bx,h,bz>,5}
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

#macro myrand_flat(rnd)
    #declare rnd = rand(seed(int(rnd*100)));
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
        pigment{
            image_map{
                jpeg "./wood.jpeg"
            }
            scale <100,100,1>
        }
    }
#end



//make poles

#declare gap = 50;
#declare oppression = 3; //／どれだけz軸によっていくか

// grass pole

#declare i = 0;
myrand(rnd)
#declare r1 = rnd;
myrand(rnd)
#declare r2 = rnd;
myrand(rnd)
#declare r3 = rnd;
myrand(rnd)
#declare r4 = rnd;

#declare shift = 12;
#declare shiftz = 20;
object{
    cylinder{<30-oppression*i+r1-shift,30+r2*3,100+gap*i-shiftz>,<30-oppression*(i+1)+r3,30+r4*3,100+gap*(i+1)>,5}
    material{M_Glass3}
}

#declare bx = 30-oppression*i;
#declare bz = 100+gap*i;
#declare h = 40;
object{
    cylinder{<bx-shift,0,bz-shiftz>,<bx-shift,h,bz-shiftz>,8}
    material{M_Glass3}
}


#declare i = 1;
myrand(rnd)
#declare r1 = rnd;
myrand(rnd)
#declare r2 = rnd;
myrand(rnd)
#declare r3 = rnd;
myrand(rnd)
#declare r4 = rnd;
#declare shift = 3;
object{
    cylinder{<30-oppression*i+r1-shift,30+r2*3,100+gap*i>,<30-oppression*(i+1)+r3-shift,30+r4*3,100+gap*(i+1)>,5}
    pigment{
        image_map{
            jpeg "./wood.jpeg"
        }
        scale <100,100,1>
    }
}

#declare bx = 30-oppression*i;
#declare bz = 100+gap*i;
#declare h = 40;
object{
    cylinder{<bx-shift,0,bz>,<bx-shift,h,bz>,6}
    material{M_Orange_Glass}
}

// wood poles

#declare i = 2;
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
        pigment{
            image_map{
                jpeg "./wood.jpeg"
            }
            scale <100,100,1>
        }
    }
    #declare i = i+1;
#end

#declare oppression = -1;
#while(i<10)
    pole(10-oppression*i,100+gap*i,40)
    object{
        cylinder{<10-oppression*i,30,100+gap*i>,<10-oppression*(i+1),30,100+gap*(i+1)>,5}
        pigment{
            image_map{
                jpeg "./wood.jpeg"
            }
            scale <100,100,1>
        }
    }
    #declare i=i+1;
#end



//make grass

#declare WEED = union { #include "weed.pov" };

// Weed

#macro weed(p,scl)
#if (rand(r)>0.8)
object {
	WEED
    translate p 
	pigment { 
        image_map{
            png "weed.png"
        }
        rotate 180*z
    }
    scale scl
}
#else
#declare r1 = rand(r);
object {
	WEED
    translate p 
	pigment { 
        rgb <0.1+0.5*(sqrt(r1)),0.3+0.6*r1,0.05>
    }
    scale scl
}
#end
#end

#macro paper_weed(p,scl)
    object {
    	WEED
        translate p 
        pigment{color White}
        scale scl
    }
#end





#declare r = seed (1);
#declare i = 0;
#while (i<500)
    object{
        weed(<0,0,0>,0.7)
        rotate (60*rand(r))*z
        rotate 30-60*rand(r)*x
        rotate 360*rand(r)*y
        scale 1.5*rand(r)
        translate <-200*rand(r),0,150+100*rand(r)>
        rotate -60*z
        translate <-30,0,0>
    }
    #declare i = i + 1;
#end




#declare r = seed (2);
#declare i = 0;
#while (i<100)
    object{
        paper_weed(<0,0,0>,0.7)
        rotate (60*rand(r))*z
        rotate 30-60*rand(r)*x
        rotate 360*rand(r)*y
        scale 2*rand(r)
        translate <-100*rand(r),0,100+50*rand(r)>
        rotate -60*z
        translate <-30,0,0>
    }
    #declare i = i + 1;
#end

#declare r = seed (2);
#declare i = 0;
#while (i<10)
    object{
        paper_weed(<0,0,0>,0.7)
        rotate (60*rand(r))*z
        rotate 30-60*rand(r)*x
        rotate 360*rand(r)*y
        scale 2*rand(r)
        translate <-50*rand(r),0,125+25*rand(r)>
        rotate -60*z
        translate <-30,0,0>
    }
    #declare i = i + 1;
#end


object{

    box{<0,0,0>,<-300,1,200>
        //texture {Brown}
        pigment{
            image_map{
                png"./weed.png"
            }
            scale <1000,1,1000>
        }

    }
    rotate -60*z
    translate <-30,0,0>
}


//back ground
object{
    box{<-1000,-1000,2000>,<1000,1000,2001>
      pigment{
          image_map{
              jpeg "./background2_flip.jpg"
              once
          }
      }
      scale  <1000,1000,1>
      translate <-500,-500,0>
    }
}


//make tree
object { 
    TREE 
    scale 200
    translate <100,-50,150 >
}

object { 
    TREE 
    scale 200
    translate <100,-50,500 >
}

object { 
    TREE 
    scale 200
    translate <100,-50,700 >
}

// left side tree

object { 
    TREE 
    scale 200
    translate <-100,-50,500>
}

// fallen tree

object { 
    TREE 
    scale 300
    translate <0,0,700>
    rotate -85*z
    translate <-100,0,0>
}

// floor 

box {
    <-70, -0.01, -700>, // 床の一角（x, y, z）※床の厚みを0.01ユニットとした
    <100, 0, 700> // 床の対角線上の角
    texture {
        pigment { 
            image_map{
                jpeg "terra.jpg"
            } 
            scale <100,100,1>
            rotate 90*x
        } 
    }
}

#declare r = seed(12);
#declare r1 = seed(11);
#declare i = 0;
#while (i<100)
    object{
        weed(<0,0,0>,0.1)

        translate <-50+100*rand(r1),0,500*rand(r)>
    }
    #declare i = i + 1;
#end
