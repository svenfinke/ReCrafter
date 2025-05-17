extends Resource
class_name ItemAffixInstance

@export var affix: ItemAffix

@export_group("Temporary Parameters")
@export var current_tier: int = 1
@export var current_roll: float

var text: String: get = _get_text

func roll_affix() -> void:
    current_roll = randf()


func _get_concrete_value() -> int:
    var min_roll_tiered := affix.min_roll * affix.tier_multipliers[current_tier]
    var max_roll_tiered := affix.max_roll * affix.tier_multipliers[current_tier]
    var concrete_value : int = floor(lerp(min_roll_tiered, max_roll_tiered, current_roll))
    
    return concrete_value


func _get_text() -> String:
    return affix.text_template % _get_concrete_value()