enum rarity {
	normal,
	rare,
	epic,
	legendary,
	artifact
}

rarity_strings = []
rarity_strings[rarity.normal] = "Normal"

items = {}

items.base = {}
items.base.item_name = "Base"
items.base.item_level = 1
items.base.implicits = []
items.base.prefixes = []
items.base.suffixes = []
items.base.base_price = 0
items.base.rarity = rarity.normal

items.sword = variable_clone(items.base)
items.sword.item_name = "Sword"
items.sword.item_level = 10
items.sword.implicits = ["+5% Physical Damage"]
items.sword.base_price = 50

items.shield = variable_clone(items.base)
items.shield.item_name = "Shield"
items.shield.item_level = 5
items.shield.implicits = ["+50 Armor"]
items.shield.base_price = 20

current_item = variable_clone(items.sword)
available_items = [ items.sword, items.shield ]

function reroll_item() {
	current_item = variable_clone(available_items[irandom(array_length(available_items) - 1)])
}

function calculate_value(){
	return current_item.base_price
}