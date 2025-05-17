extends CraftingTool
class_name RerollTool


static func use(item: ItemType) -> void:
    for affix in item.suffixes:
        affix.roll_affix()
    for affix in item.prefixes:
        affix.roll_affix()
    for affix in item.implicits:
        affix.roll_affix()

    SignalBus.item_changed.emit()