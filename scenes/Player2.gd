extends StaticBody2D

var win_height : int
var p_height : int

# Called when the node enters the scene tree for the first time.
func _ready():
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Obtém a posição do mouse na viewport
	var mouse_position = get_viewport().get_mouse_position()

	# Atualiza a posição do paddle para seguir o mouse na direção Y
	position.y = mouse_position.x

	# Limitar o movimento do paddle dentro da tela
	position.y = clamp(position.y, 0, get_viewport().get_size().y)
