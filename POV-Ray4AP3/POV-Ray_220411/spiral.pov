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

object{
    box{
        <0, 0, 0>, <10, 2, 5>
        texture{T_Wood12}
    }
}



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