extends PanelContainer


var item: ItemType


func _ready() -> void:
	SignalBus.item_loaded.connect(_on_item_loaded)
	SignalBus.item_changed.connect(_on_item_changed)


func _on_item_loaded(new_item: ItemType) -> void:
	item = new_item
	_update()


func _on_item_changed() -> void:
	_update()


func _update() -> void:
	if item == null:
		return

	$%ItemName.text = item.id
	_load_affixes($%Prefixes, item.prefixes)
	_load_affixes($%Suffixes, item.suffixes)
	_load_affixes($%Implicits, item.implicits)


func _load_affixes(target: Node, affixes: Array[ItemAffixInstance]) -> void:
	for child in target.get_children():
		child.queue_free()

	for affix in affixes:
		var label = Label.new()
		label.text = affix.text
		target.add_child(label)
