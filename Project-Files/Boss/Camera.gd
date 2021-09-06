extends Camera2D


onready var p1 = get_parent().get_node("Player")
onready var p2 = get_parent().get_node("Boss")

var zoomin = 0.3
var zoomax = 1.3


# Called when the node enters the scene tree for the first time.
func _ready():
	make_current()


func _physics_process(delta):
	position = (p1.position + p2.position)/Vector2(2,2)
	zoom.x = max(zoomin , abs ((p1.position.x - p2.position.x)/50))
	zoom.y = max(zoomin , abs ((p1.position.x - p2.position.x)/50))

	if zoom.x > zoomax:
		zoom.y = zoomax
		zoom.x = zoomax
