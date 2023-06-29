#include "textures.inc"
#include "colors.inc"
#include "Woods.inc"
#include "glass.inc"
#include "stones.inc"
#include "metals.inc"

camera {
    location <13,17,-13>
    look_at <0,0,0>
    angle 60
}

light_source{
    <0, 50, 0>
    color White * 1
}

//frame
object{
    union{
        torus {
            3.6, 0.2
        }
        cylinder{
            <0, 0, 0>, <0, 0, -5>, 0.7
            translate<0,0,-5>
        }
        cylinder{
            <0, 0, 0>, <0, 0, -2>, 0.4
            translate<0,0,-3.6>
        }
        texture{T_Silver_5E}
        translate<0,5.3,0>
    }
}

//lens
object{
    intersection{
        sphere{
            <0 , -4.8 , 0> , 5    
        }
        sphere{
            <0 , 4.8 , 0> , 5    
        }
        material { M_Glass3 }
        scale <0, 2, 0>
        scale 2.5
        translate<0, 5.3, 0>
    }
}

//floor
object{
    plane{
        y, 0
        texture {T_Grnt29}
    }
}

//sky
sky_sphere{
    pigment{
        gradient z
        color_map{
            [ 0.0 White*0.9 ]
            [ 1.0 color rgb<0.3,0.4,1.2>]
        }
    }
}