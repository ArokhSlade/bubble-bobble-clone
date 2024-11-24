extends TileMapLayer
class_name TileMapLayerPlus

func get_tile_coords(_global_position : Vector2):
	var local_position = to_local(_global_position)
	var tile_coords = local_to_map(local_position)
	return tile_coords
	
func does_tile_exist(tile_coords : Vector2i):
	var result = get_cell_tile_data(tile_coords) == null 
	return result
