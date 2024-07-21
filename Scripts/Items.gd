class_name Items

const itemDB = {
	'gold' : { 'name' : 'Gold', 'description': 'An item.', 'type': Item.ItemType.Metal, 'sprite' : 'res://assets/items/gold.png', 'id' : 0 },
	'silver' : { 'name' : 'Silver', 'description': 'An item.', 'type': Item.ItemType.Metal, 'sprite' : 'res://assets/items/silver.png', 'id' : 1 },
	'salt' : { 'name' : 'Salt', 'description': 'An item.', 'type': Item.ItemType.Prime, 'sprite' : 'res://assets/items/silver.png', 'id' : 2 },
	'sulfur' : { 'name' : 'Sulfur', 'description': 'An item.', 'type': Item.ItemType.Prime, 'sprite' : 'res://assets/items/silver.png', 'id' : 3 },
	'quicksilver' : { 'name' : 'Quicksilver', 'description': 'An item.', 'type': Item.ItemType.Prime, 'sprite' : 'res://assets/items/silver.png', 'id' : 4 },
	'water' : { 'name' : 'Water', 'description': 'An item.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/silver.png', 'id' : 5 },
	'fire' : { 'name' : 'Fire', 'description': 'An item.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/silver.png', 'id' : 6 },
	'air' : { 'name' : 'Air', 'description': 'An item.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/silver.png', 'id' : 7 },
	'earth' : { 'name' : 'Earth', 'description': 'An item.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/silver.png', 'id' : 8 },
	'base_metal' : { 'name' : 'Base Metal', 'description': 'An item.', 'type': Item.ItemType.Metal, 'sprite' : 'res://assets/items/silver.png', 'id' : 9 },
	'seawater' : { 'name' : 'Seawater', 'description': 'An item.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/silver.png', 'id' : 10 },
	'water_mote' : { 'name' : 'Water Mote', 'description': 'An item.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/silver.png', 'id' : 11 },
	'fire_mote' : { 'name' : 'Fire Mote', 'description': 'An item.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/silver.png', 'id' : 12 },
	'air_mote' : { 'name' : 'Air Mote', 'description': 'An item.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/silver.png', 'id' : 13 },
	'earth_mote' : { 'name' : 'Earth Mote', 'description': 'An item.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/silver.png', 'id' : 14 },
}

const solution_recipes = [
	{ "required_ingredients": ["water_mote", "water_mote"], "items": ["water"] },
	{ "required_ingredients": ["fire_mote", "fire_mote"], "items": ["fire"] },
	{ "required_ingredients": ["air_mote", "air_mote"], "items": ["air"] },
	{ "required_ingredients": ["earth_mote", "earth_mote"], "items": ["earth"] },
]
