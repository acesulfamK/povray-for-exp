#include "textures.inc"
#include "colors.inc"
#include "Woods.inc"

camera {
    location <50, 70, -50>
    look_at <0, 20, 0>
}

light_source {
    <-60, 35, 30>
    color White * 2
}
light_source {
    <60, 50, -30>
    color White * 0.3
}

// ------------------------------------




#declare Index = 1;
#while(Index <=24)
    #declare p = 5*x+(-2.5)*z;

    object{
        box{
            p, <15, 2, 2.5>
            texture{T_Wood12}
        }
        rotate 30*Index*y
        translate Index*1.5*y
    } 

  #declare Index = Index + 1;
#end

// ------------------------------------

object{
    plane{
        y, 0
        texture {T_Wood1}
    }
}
object{
    plane{
        z, 80
        texture {T_Wood12}
    }
}
object{
    plane{
        x, -80
        texture {T_Wood12}
    }
}