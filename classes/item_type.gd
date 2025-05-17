extends Resource
class_name ItemType

enum ItemRarity{  
    NORMAL,
    MAGIC,
    RARE,
    UNIQUE,
    LEGENDARY,
    SET,
    ARTIFACT,
}

enum AffixType{
    PREFIX,
    SUFFIX
}


@export var id: String
@export var base_item_id: String
@export var suffixes: Array[ItemAffixInstance]
@export var prefixes: Array[ItemAffixInstance]
@export var implicits: Array[ItemAffixInstance]
@export var item_rarity: ItemRarity = ItemRarity.NORMAL