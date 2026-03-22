extends Node

var tamanyo_textura : int = 512
var mi_textura := DrawableTexture2D.new()
var mi_material_dibujar := load("res://materiales/mi_material_dibujar.tres")

func _ready() -> void:
	# inicializamos la textura dibujable
	mi_textura.setup(
		tamanyo_textura, # ancho
		tamanyo_textura, # alto
		DrawableTexture2D.DRAWABLE_FORMAT_RGBA8, # formato
		Color.BLACK,     # color inicial
		false            # usar mipmaps
	)
	# asignamos al material del objeto 3D (como textura albedo)
	$MeshInstance3D.material_override.albedo_texture = mi_textura	
	
func _process(delta: float) -> void:
	# rotamos el objeto
	$MeshInstance3D.rotate_y(delta * 0.1)
	# actualizamos nuestra textura dibujable
	mi_textura.blit_rect_multi(
		Rect2i(0,0,tamanyo_textura,tamanyo_textura),      # zona de la textura en la que vamos a dibujar
		[load("res://icon.svg")],                         # texturas de origen (para el shader de dibujado)
		[],                                               # texturas de destino adicionales
		Color.WHITE,                                      # modulate (color para modular el blit)
		0,                                                # nivel de mipmap
		mi_material_dibujar                               # material (shader) de dibujado (si no es valido se usa uno por defecto)
	)
