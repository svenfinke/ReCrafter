extends CraftingTool
class_name AddAffixTool


static func use(item: ItemType) -> void:
	if not can_use(item):
		return

	var affix_types = ItemType.AffixType.values()
	var random_affix_type = affix_types[randi() % affix_types.size()]
	_add_random_affix(item, random_affix_type)

	SignalBus.item_changed.emit()

static func can_use(item: ItemType) -> bool:
	var sum_affixes = item.suffixes.size() + item.prefixes.size()
	if item.item_rarity == ItemType.ItemRarity.NORMAL:
		if sum_affixes >= 1:
			return false
	elif item.item_rarity == ItemType.ItemRarity.MAGIC:
		if sum_affixes >= 2:
			return false
	elif item.item_rarity == ItemType.ItemRarity.RARE:
		if sum_affixes >= 3:
			return false
	elif item.item_rarity == ItemType.ItemRarity.UNIQUE:
		if sum_affixes >= 4:
			return false
	elif item.item_rarity == ItemType.ItemRarity.LEGENDARY:
		if sum_affixes >= 5:
			return false
	elif item.item_rarity == ItemType.ItemRarity.SET:
		if sum_affixes >= 6:
			return false
	elif item.item_rarity == ItemType.ItemRarity.ARTIFACT:
		if sum_affixes >= 7:
			return false

	return true


static func _add_random_affix(item: ItemType, affix_type: ItemType.AffixType) -> void:
	var affix = _get_random_affix()
	var affix_instance = ItemAffixInstance.new()

	affix_instance.affix = affix
	affix_instance.roll_affix()

	if affix_type == ItemType.AffixType.SUFFIX:
		item.suffixes.append(affix_instance)
	elif affix_type == ItemType.AffixType.PREFIX:
		item.prefixes.append(affix_instance)


static func _get_random_affix() -> ItemAffix:
	var dir = DirAccess.open("res://resources/affixes")
	if dir == null:
		push_error("Could not open affix directory.")
		return null
	var files = []
	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		if not dir.current_is_dir() and file_name.ends_with(".tres"):
			files.append(file_name)
		file_name = dir.get_next()
	dir.list_dir_end()
	if files.size() == 0:
		push_error("No affix files found.")
		return null
	var random_file = files[randi() % files.size()]
	var affix = load("res://resources/affixes/" + random_file)
	if affix is ItemAffix:
		return affix
	return null
