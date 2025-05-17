extends PanelContainer


var _item: ItemType


func _ready() -> void:
	SignalBus.item_loaded.connect(_on_item_loaded)
	SignalBus.item_changed.connect(_on_item_changed)
	$%Reroll.pressed.connect(_on_reroll)
	$"%Add Affix".pressed.connect(_on_add_affix)
	$"%Increase Rarity".pressed.connect(_on_increase_rarity)
	$"%Add Item".pressed.connect(_on_add_item)


func _on_item_loaded(new_item: ItemType) -> void:
	_item = new_item
	_on_item_changed()


func _on_item_changed() -> void:
	$%Reroll.disabled = not RerollTool.can_use(_item)
	$"%Add Affix".disabled = not AddAffixTool.can_use(_item)
	$"%Increase Rarity".disabled = not IncreaseRarityTool.can_use(_item)


func _on_reroll() -> void:
	RerollTool.use(_item)


func _on_add_affix() -> void:
	AddAffixTool.use(_item)


func _on_increase_rarity() -> void:
	IncreaseRarityTool.use(_item)


func _on_add_item() -> void:
	InventoryManager.add_item(InventoryManager.get_random_item_type(), true)
