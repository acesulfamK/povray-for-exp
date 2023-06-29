#include "textures.inc"
#include "colors.inc"
#include "Woods.inc"

camera {
    location <4.5,5,-4.5>
    look_at <0,0,0>
    angle 60
}

light_source {
    <-6,3.5,3>
    color White * 2
}
light_source {
    <6,5,-3>
    color White * 0.3
}

//glass
object{
    difference{
        union{
            cylinder{
                <0, 0, 0>, <0, 3, 0>, 1
            }
            torus{
                0.7, 0.16
                rotate<0, 0, 90>
                scale<0, 1.3, 0>
                translate<0, 1.7, -0.93>
            }
            torus{
                0.97, 0.03
                translate<0, 3, 0>
            }
        }
        cylinder{
            <0, 0.3, 0>, <0, 4, 0>, 0.94
        }
        material{M_Glass3}
    }
}

//beer & bubble
object{
    union{
        //beer
        cylinder{
            <0, 0.3, 0>, <0, 2.4, 0>, 0.94
            material{M_Orange_Glass}
        }
        //bubble
        superellipsoid{
            <1, 0.2>
            pigment{color White*5}
            rotate<90, 0, 0>
            scale<0.943, 0.44, 0.943>
            translate<0, 2.7, 0>
        }
    }
}

object{
    plane{
        y, 0
        texture {T_Wood1}
    }
}
object{
    plane{
        z, 8
        texture {T_Wood12}
    }
}
object{
    plane{
        x, -8
        texture {T_Wood12}
    }
}