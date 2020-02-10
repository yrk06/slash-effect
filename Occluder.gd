tool
extends Spatial

export var ABC = Vector2() setget set_abc #ac = abc.x // b = abc.y 
export (float) var speed = 1
export var Magnitude = 2
var time = 0


func set_abc(value):
	ABC = value
	var MMesh = $MeshInstance
	if MMesh:
		MMesh.mesh.radius = ABC.x
		MMesh.mesh.height = ABC.y
func get_abc():
	var R = Vector3()
	R.x = ABC.x
	R.z = ABC.x
	R.y = ABC.y/2
	return R
	
func GetCenter():
	return translation
	
func get_basis():
	return transform.basis
	
func _process(delta):
	time += delta
	var Wt = Vector3(0,0,Magnitude*sin(time*speed))
	var Wn = Vector3(0,0,translation.z)
	translate(Wt-Wn)