with (obj_item) {
	obj_currency.currencies.gold += obj_item.calculate_value()
	obj_item.reroll_item()
}