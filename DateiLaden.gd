extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var projectResolution=get_viewport().size
	$TextureRect.rect_size = projectResolution

func _on_FileDialog_file_selected(path):
	var bildDatei = path + $FileDialog.filename
	$GridContainer/TextEdit.text = bildDatei
	var image = Image.new()
	var err = image.load(bildDatei)
	if err != OK:
		print("Texture falsch !")
		return
	else:
		var txtre = ImageTexture.new()
		txtre.create_from_image(image, 0)
		$TextureRect.texture = txtre

func _on_btn_LoadPict_pressed():
	$FileDialog.show()
