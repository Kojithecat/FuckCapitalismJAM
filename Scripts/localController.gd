extends Node2D

@export var isNegoci = false;
@export var negociId: int

@export var isParc = false
@export var parcId: int

@export var nameOg: String = "nom placeholder"
@export var descriptionOg: String = "descripcio placeholder"
@export var preu: int = 10

@export var purchased: bool = false
@export var purchasedTexturePath: String

@export var nameNew: String
@export var descriptionNew: String
@export var revenue: int = 0

func _ready():
	if(isNegoci && negociId!=null):
		var texture_normal_path = "res://assets/ILLES_OK/Locals/localBottom_icons_" + str(negociId) + "_brown.png"
		var texture_hover_path = "res://assets/ILLES_OK/Locals/localBottom_icons_" + str(negociId) + "_white.png"
		
		var normal_texture = load(texture_normal_path)
		var hover_texture = load(texture_hover_path)
		
		$TextureButton.texture_normal = normal_texture
		$TextureButton.texture_hover = hover_texture 
		$TextureButton.texture_pressed = hover_texture
		
		var file_path = "res://assets/NegocisTxts/" + str(negociId) + ".json"
		var json_as_text = FileAccess.get_file_as_string(file_path)
		var json_as_dict = JSON.parse_string(json_as_text)
		load_init_data(json_as_dict["nameENG"], json_as_dict["descENG"], json_as_dict["preu"])
	
	elif(isParc && parcId!=null):
		var file_path = "res://assets/ParcsTxts/" + str(parcId) + ".json"
		var json_as_text = FileAccess.get_file_as_string(file_path)
		var json_as_dict = JSON.parse_string(json_as_text)
		load_init_data(json_as_dict["name"], json_as_dict["descENG"], json_as_dict["preu"])

func load_init_data(nameInit: String, descriptionInit: String, preuInit: int):
	nameOg = nameInit
	descriptionOg = descriptionInit
	preu = preuInit

func on_local_pressed() -> void:
	if !purchased:
		get_tree().call_group("gameController", "handle_local_selected", self)
	else:
		#TODO s'hauria de mostrar una altra pantalla amb la nova info, que sigui només de consulta
		print("El local ja ha estat desnonat")	

func purchase_local(newName: String, newDesc: String, newRevenue: int, newIconNegoci: CompressedTexture2D, newSpriteParc: CompressedTexture2D):
	nameNew = newName
	descriptionNew = newDesc
	revenue = newRevenue
	purchased = true
	$TextureButton.disabled = true
	if(isNegoci):
		$negociIcon.texture = newIconNegoci
		$negociIcon.visible = true
	if(isParc):
		$TextureButton.texture_disabled = newSpriteParc
