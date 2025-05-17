extends Node


var _inventory : Array[ItemType] = []


func add_item(item: ItemType, make_unique: bool = true) -> void:
    if make_unique:
        _inventory.append(item.duplicate())
    else:
        _inventory.append(item)
    
    SignalBus.inventory_changed.emit()


func remove_item(item: ItemType) -> void:
    if item in _inventory:
        _inventory.erase(item)
        SignalBus.inventory_changed.emit()
    else:
        print("Item not found in inventory")


func get_inventory() -> Array[ItemType]:
    return _inventory


func get_random_item_type() -> ItemType:
    var dir = DirAccess.open("res://resources/items")
    if dir == null:
        push_error("Could not open items directory.")
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
        push_error("No item files found.")
        return null
    var random_file = files[randi() % files.size()]
    var item_type = load("res://resources/items/" + random_file)
    if item_type is ItemType:
        return item_type
    return null