local version = "0.0.12"


local cow_groups = {
						not_in_creative_inventory=1
					}

local selectionbox_cow = {-1.5, -1.5, -0.75, 1.5, 0.6, 0.75}
local selectionbox_steer = {-1.5*1.1, -1.5*1.1, -0.75*1.1, 1.5*1.1, 0.6*1.1, 0.75*1.1}
local selectionbox_baby_calf = {-0.8, -0.8, -0.5, 0.8, 0.8, 0.5}

local modpath = minetest.get_modpath("animal_cow")

--include debug trace functions
dofile (modpath .. "/model.lua")

cow_prototype = {   
		name="cow",
		modname="animal_cow",
	
		generic = {
					description="Cow",
					base_health=40,
					kill_result="animalmaterials:meat_raw 5",
					armor_groups= {
						fleshy=2,
					},
					groups = cow_groups,
					envid = "meadow"
				},				
		movement =  {
					default_gen="probab_mov_gen",
					min_accel=0.05,
					max_accel=0.1,
					max_speed=0.3,
					min_speed=0.025,
					pattern="stop_and_go",
					canfly=false,
					},		
		harvest = {	
					tool="animalmaterials:glass",
					tool_consumed=true,
					result="animalmaterials:milk", 
					transforms_to="",
					min_delay=60,
				  	},
		catching = {
					tool="animalmaterials:lasso",
					consumed=true,
					},
		random_drop    = nil,
		auto_transform = nil,
		graphics = {
					sprite_scale={x=4,y=4},
					sprite_div = {x=6,y=1},
					visible_height = 2,
					},
		graphics_3d = {
					visual = "wielditem",
					textures = {"animal_cow:box_cow"},
					collisionbox = selectionbox_cow,
					visual_size= {x=2,y=2,z=2},
					},
		combat         = nil,
	
		spawning = {
					rate=0.001,
					density=200,
					algorithm="willow_mapgen",
					height=2
					},
		sound = {
					random = {
								name="Mudchute_cow_1",
								min_delta = 30,
								chance = 0.5,
								gain = 1,
								max_hear_distance = 10,
								},
					},	
		}
		
steer_prototype = {   
        name="steer",
        modname="animal_cow",
    
        generic = {
                    description="Steer",
                    base_health=40,
                    kill_result="animalmaterials:meat_raw 5",
                    armor_groups= {
                        fleshy=2,
                    },
                    groups = cow_groups,
                    envid = "meadow"
                },              
        movement =  {
                    default_gen="probab_mov_gen",
                    min_accel=0.05,
                    max_accel=0.1,
                    max_speed=0.3,
                    min_speed=0.025,
                    pattern="stop_and_go",
                    canfly=false,
                    },      
        harvest = nil,
        catching = {
                    tool="animalmaterials:lasso",
                    consumed=true,
                    },
        random_drop    = nil,
        auto_transform = nil,
        graphics = {
                    sprite_scale={x=4,y=4},
                    sprite_div = {x=6,y=1},
                    visible_height = 2,
                    },
        graphics_3d = {
                    visual = "wielditem",
                    textures = {"animal_cow:box_steer"},
                    collisionbox = selectionbox_steer,
                    visual_size= {x=2.2,y=2.2,z=2.2},
                    },
        combat         = nil,
    
        spawning = {
                    rate=0.001,
                    density=200,
                    algorithm="willow_mapgen",
                    height=2
                    },
        sound = {
                    random = {
                                name="Mudchute_cow_1",
                                min_delta = 30,
                                chance = 0.5,
                                gain = 1,
                                max_hear_distance = 10,
                                },
                    },  
        }
        
baby_calf_f_prototype = {   
        name="baby_calf_f",
        modname="animal_cow",
    
        generic = {
                    description="Baby Calf female",
                    base_health=40,
                    kill_result="animalmaterials:meat_raw 2",
                    armor_groups= {
                        fleshy=2,
                    },
                    groups = cow_groups,
                    envid = "meadow"
                },              
        movement =  {
                    default_gen="probab_mov_gen",
                    min_accel=0.025,
                    max_accel=0.15,
                    max_speed=0.2,
                    min_speed=0.025,
                    pattern="stop_and_go",
                    canfly=false,
                    },      
        harvest = nil,
        catching = {
                    tool="animalmaterials:lasso",
                    consumed=true,
                    },
        random_drop    = nil,
        auto_transform = {
                    result="animal_cow:cow",
                    delay=7200,
                    },
        graphics = {
                    sprite_scale={x=2,y=2},
                    sprite_div = {x=6,y=1},
                    visible_height = 1,
                    },
        graphics_3d = {
                    visual = "wielditem",
                    textures = {"animal_cow:box_baby_calf"},
                    collisionbox = selectionbox_baby_calf,
                    visual_size= {x=1,y=1,z=1},
                    },
        combat         = nil,
    
        spawning = {
                    rate=0.001,
                    density=200,
                    algorithm="none",
                    height=2
                    },
        sound = {
                    random = {
                                name="Mudchute_cow_1",
                                min_delta = 30,
                                chance = 0.5,
                                gain = 1,
                                max_hear_distance = 10,
                                },
                    },  
        }
        
baby_calf_m_prototype = {   
        name="baby_calf_m",
        modname="animal_cow",
    
        generic = {
                    description="Baby Calf male",
                    base_health=40,
                    kill_result="animalmaterials:meat_raw 2",
                    armor_groups= {
                        fleshy=2,
                    },
                    groups = cow_groups,
                    envid = "meadow"
                },              
        movement =  {
                    default_gen="probab_mov_gen",
                    min_accel=0.025,
                    max_accel=0.15,
                    max_speed=0.2,
                    min_speed=0.025,
                    pattern="stop_and_go",
                    canfly=false,
                    },      
        harvest = nil,
        catching = {
                    tool="animalmaterials:lasso",
                    consumed=true,
                    },
        random_drop    = nil,
        auto_transform = {
                    result="animal_cow:steer",
                    delay=7200,
                    },
        graphics = {
                    sprite_scale={x=2,y=2},
                    sprite_div = {x=6,y=1},
                    visible_height = 1,
                    },
        graphics_3d = {
                    visual = "wielditem",
                    textures = {"animal_cow:box_baby_calf"},
                    collisionbox = selectionbox_baby_calf,
                    visual_size= {x=1,y=1,z=1},
                    },
        combat         = nil,
    
        spawning = {
                    rate=0.001,
                    density=200,
                    algorithm="none",
                    height=2
                    },
        sound = {
                    random = {
                                name="Mudchute_cow_1",
                                min_delta = 30,
                                chance = 0.5,
                                gain = 1,
                                max_hear_distance = 10,
                                },
                    },  
        }

minetest.register_craft({
	output = "animalmaterials:glass 5",
	recipe = {
		{'', "default:glass",''},
		{'', "default:glass",''}
	}
})

--register with animals mod
print ("Adding animal "..baby_calf_f_prototype.name)
animals_add_animal(baby_calf_f_prototype)
print ("Adding animal "..baby_calf_m_prototype.name)
animals_add_animal(baby_calf_m_prototype)
print ("Adding animal "..cow_prototype.name)
animals_add_animal(cow_prototype)
print ("Adding animal "..steer_prototype.name)
animals_add_animal(steer_prototype)
print ("animal_cow mod version " .. version .. " loaded")