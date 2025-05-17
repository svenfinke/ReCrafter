extends PanelContainer


func _ready() -> void:
	SignalBus.inventory_changed.connect(_on_inventory_changed)


func _on_inventory_changed() -> void:
	for child in $%Items.get_children():
		child.queue_free()

	var items = InventoryManager.get_inventory()
	for item in items:
		var item_label = Button.new()
		item_label.text = item.id
		$%Items.add_child(item_label)
		item_label.pressed.connect( func(): SignalBus.item_loaded.emit(item) )
