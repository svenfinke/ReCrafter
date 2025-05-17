extends CraftingTool
class_name IncreaseRarityTool


static func use(item: ItemType) -> void:
    if item.item_rarity == ItemType.ItemRarity.NORMAL:
        item.item_rarity = ItemType.ItemRarity.MAGIC
    elif item.item_rarity == ItemType.ItemRarity.MAGIC:
        item.item_rarity = ItemType.ItemRarity.RARE
    
    SignalBus.item_changed.emit()


static func can_use(item: ItemType) -> bool:
    if item.item_rarity == ItemType.ItemRarity.NORMAL:
        return true
    elif item.item_rarity == ItemType.ItemRarity.MAGIC:
        return true

    return false