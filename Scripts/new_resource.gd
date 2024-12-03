extends Resource

@export var x : int = 3
enum ResourceEnum{
	A,B,C
}

@export var my_dict : Dictionary = {
	"first" 	: 1,
	"second" 	: 2
}

func hello():
	print("hello")

func _init(p_x:int=0):
	x = p_x
