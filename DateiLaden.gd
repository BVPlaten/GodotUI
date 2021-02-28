extends Node2D
var commandlineargs = OS.get_cmdline_args()

# you can set a filename with a commandline-parameter
func _ready():
	if(commandlineargs.size() > 0) : 
		$GridContainer/TextEdit.text = commandlineargs[0]
		_on_btn_LoadPict_pressed()
	return
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var projectResolution=get_viewport().size
	$TextureRect.rect_size = projectResolution
	return

# textedit can get the path. 
# if nothing useable found then the file-dialog is opened
func _on_btn_LoadPict_pressed():
	var imageFile : String = $GridContainer/TextEdit.text.strip_edges()
	if( imageFile.empty() ):
		$FileDialog.show()
	else:
		load_image(imageFile)
	return

func _on_FileDialog_file_selected(path):
	var bildDatei = path + $FileDialog.filename
	$GridContainer/TextEdit.text = bildDatei
	load_image(bildDatei)
	return

func load_image(file):
	var image = Image.new()
	var err = image.load(file)
	if err != OK:
		print("Texture falsch !")
		return false
	else:
		var txtre = ImageTexture.new()
		txtre.create_from_image(image, 0)
		$TextureRect.texture = txtre
	return
