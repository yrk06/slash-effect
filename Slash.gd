tool
extends Spatial

export (NodePath) var Occluder ## Godot Lack support for Arrays in Shaders
## With this in mind, the limitation is only one, but the principles are the 
## Same if you want more Occluders

export (bool) var isLocal

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Occluder:
		var OC = get_node(Occluder)
		var Mat = $MeshInstance.get_surface_material(0)
		var Center = OC.GetCenter()
		var Bsis = OC.get_basis()
		var abc = OC.get_abc()
		Mat.set_shader_param("Center",Center)
		Mat.set_shader_param("up",Bsis[1])
		Mat.set_shader_param("side",Bsis[0])
		Mat.set_shader_param("front",Bsis[2])
		Mat.set_shader_param("abc",abc)
		Mat.set_shader_param("bUseLocalPos",isLocal)
	pass
