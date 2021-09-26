extends TileMap


export(String) var tile_name := "Props" # Atlas Tile name used for generation
export(int) var clear_chance := 0.25 # The percentage of empty tiles


func _ready():
	Main.connect("burnt",self,"burnt")
	var viewport_size := get_viewport().get_visible_rect().size
	generate_ground(viewport_size)


func burnt(pos : Vector2) -> void:
	set_cellv(world_to_map(pos),-1)


func generate_ground(var viewport_rect : Vector2 = Vector2.ZERO) -> void:
	var camera_pos : Vector2 = get_node("../Camera2D").get_position()
	var start := camera_pos - viewport_rect / 2
	
	var map_start := world_to_map(start)
	var map_end := world_to_map(start + viewport_rect) + Vector2(1,1)
	
	var tile_id : int = tile_set.find_tile_by_name(tile_name)
	var tile_number := tile_set.tile_get_region(tile_id).size/tile_set.autotile_get_size(tile_id) - Vector2(1,1)
	
	for x in range(map_start.x,map_end.x):
		for y in range(map_start.y,map_end.y):
			if Main.rng.randf() <  clear_chance: # Generate empty tiles
				set_cell(x,y,-1)
			else: # Generate occupied tiles
				var random_tile : Vector2 = Vector2(Main.rng.randi_range(0,int(tile_number.x)),Main.rng.randi_range(0,int(tile_number.y)))
				set_cell(x,y,tile_id,false,false,false,random_tile)
