#include "textures.inc"
#include "colors.inc"
#include "Woods.inc"
#include "glass.inc"

global_settings{   
    photons{
        spacing 0.005
        count 50000 
        radius 0.5
    }
}               


camera {
    location <4,4,-4>
    look_at <0,0,0>
    angle 60
}

light_source {
    <-6,4,3>
    color White * 1.5
}

object{
    sphere{
        <0, 1, 0>, 1
        material{M_Glass3}
            photons {
            target
            collect off
            reflection on
           refraction on
	    }
    }
}

object{
    plane{
        y, 0
        texture {T_Wood1}
        photons{
            collect on    
        }

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