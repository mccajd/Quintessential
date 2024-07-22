class_name Items

const itemDB = {
	'gold' : { 'name' : 'Gold', 'description': 'An item.', 'type': Item.ItemType.Metal, 'sprite' : 'res://assets/items/gold.png', 'id' : 0 },
	'silver' : { 'name' : 'Silver', 'description': 'An item.', 'type': Item.ItemType.Metal, 'sprite' : 'res://assets/items/silver.png', 'id' : 1 },
	'salt' : { 'name' : 'Salt', 'description': 'An item.', 'type': Item.ItemType.Prime, 'sprite' : 'res://assets/items/unknown.png', 'id' : 2 },
	'sulfur' : { 'name' : 'Sulfur', 'description': 'An item.', 'type': Item.ItemType.Prime, 'sprite' : 'res://assets/items/unknown.png', 'id' : 3 },
	'quicksilver' : { 'name' : 'Quicksilver', 'description': 'An item.', 'type': Item.ItemType.Prime, 'sprite' : 'res://assets/items/unknown.png', 'id' : 4 },
	'water' : { 'name' : 'Water', 'description': 'An item.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/water.png', 'id' : 5 },
	'fire' : { 'name' : 'Fire', 'description': 'An item.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/fire.png', 'id' : 6 },
	'air' : { 'name' : 'Air', 'description': 'An item.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/air.png', 'id' : 7 },
	'earth' : { 'name' : 'Earth', 'description': 'An item.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/earth.png', 'id' : 8 },
	'base_metal' : { 'name' : 'Base Metal', 'description': 'An item.', 'type': Item.ItemType.Metal, 'sprite' : 'res://assets/items/unknown.png', 'id' : 9 },
	'seawater' : { 'name' : 'Seawater', 'description': 'An item.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/unknown.png', 'id' : 10 },
	'water_mote' : { 'name' : 'Water Mote', 'description': 'An item.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/water_mote.png', 'id' : 11 },
	'fire_mote' : { 'name' : 'Fire Mote', 'description': 'An item.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/fire_mote.png', 'id' : 12 },
	'air_mote' : { 'name' : 'Air Mote', 'description': 'An item.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/air_mote.png', 'id' : 13 },
	'earth_mote' : { 'name' : 'Earth Mote', 'description': 'An item.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/earth_mote.png', 'id' : 14 },
	'ship_metal' : { 'name' : 'Ship Metal', 'description': 'Metal from a sunken ship.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/unknown.png', 'id' : 15 },
}

const solution_recipes = [
	{ "required_ingredients": ["water_mote", "water_mote"], "items": ["water"] },
	{ "required_ingredients": ["water"], "items": ["water_mote", "water_mote"] },
	{ "required_ingredients": ["fire_mote", "fire_mote"], "items": ["fire"] },
	{ "required_ingredients": ["fire"], "items": ["fire_mote", "fire_mote"] },
	{ "required_ingredients": ["air_mote", "air_mote"], "items": ["air"] },
	{ "required_ingredients": ["air"], "items": ["air_mote", "air_mote"] },
	{ "required_ingredients": ["earth_mote", "earth_mote"], "items": ["earth"] },
	{ "required_ingredients": ["earth"], "items": ["earth_mote", "earth_mote"] },
]

const dissolution_recipes = [
	{ "required_ingredients": ["sulfur", "seawater"], "items": ["water", "salt"] },
	{ "required_ingredients": ["sulfur", "seawater"], "items": ["water", "salt"] },
]

const sublimation_recipes = [
	{ "required_ingredients": ["salt", "gold"], "items": ["silver"] },
]

const distillation_recipes = [
	
]

const ascension_recipes = [
	{ "required_ingredients": ["quicksilver", "base_metal"], "items": ["gold"] },
]
