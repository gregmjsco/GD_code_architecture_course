@tool

extends EditorScenePostImport

func _post_import(scene: Node) -> Object:
	recursive_create_collision(scene)
	return scene
	
func recursive_create_collision(object: Node) -> void:
	if object is MeshInstance3D:
		object.create_trimesh_collision()
	for child in object.get_children():
			recursive_create_collision(child)
