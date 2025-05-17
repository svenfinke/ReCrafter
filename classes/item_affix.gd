extends Resource
class_name ItemAffix

@export var id: String

@export_group("Affix Parameters")
@export var text_template: String
@export var min_roll: int
@export var max_roll: int
@export var tier_multipliers: Array[float] = [
    1.0, # Tier 1
    2.0, # Tier 2
    4.0, # Tier 3
    8.0, # Tier 4
    16.0, # Tier 5
    32.0, # Tier 6
    64.0, # Tier 7
]

@export_group("Seasonal Parameters")
@export var relevance: float = 1.0