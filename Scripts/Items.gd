class_name Items

const itemDB = {
	'gold' : { 'name' : 'Gold', 'description': 'Pure gold, the highest tier of metal. Once coveted, it now serves a more esoteric purpose.', 'type': Item.ItemType.Metal, 'sprite' : 'res://assets/items/gold.png', 'id' : 0 },
	'silver' : { 'name' : 'Silver', 'description': 'Pure silver, the second tier of metal. Once revered, it now serves a more esoteric purpose.', 'type': Item.ItemType.Metal, 'sprite' : 'res://assets/items/silver.png', 'id' : 1 },
	'salt' : { 'name' : 'Salt', 'description': 'One of the three primes. Used as a balancing agent for volatile processes, such as that of sublimation.', 'type': Item.ItemType.Prime, 'sprite' : 'res://assets/items/salt.png', 'id' : 2 },
	'sulfur' : { 'name' : 'Sulfur', 'description': 'One of the three primes. Used as a combusting agent in the separation process of distillation when time is not enough.', 'type': Item.ItemType.Prime, 'sprite' : 'res://assets/items/sulfur.png', 'id' : 3 },
	'quicksilver' : { 'name' : 'Quicksilver', 'description': 'One of the three primes. Used as a catalyzing agent for the ascension of lesser elements.', 'type': Item.ItemType.Prime, 'sprite' : 'res://assets/items/quicksilver.png', 'id' : 4 },
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
	'cloud_tree' : { 'name' : 'Cloud Tree', 'description': 'A tree sprouted from the surface of a cloud.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/unknown.png', 'id' : 0 },
	'fruit' : { 'name' : 'Fruit', 'description': 'Fruit from a flowering tree.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/unknown.png', 'id' : 0 },
	'wood' : { 'name' : 'Wood', 'description': 'A wooden slat.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/unknown.png', 'id' : 0 },
	'crystal_fountain' : { 'name' : 'Crystal Fountain', 'description': 'A brilliant crystal fountain. Its water shines with an otherworldly hue.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/unknown.png', 'id' : 0 },
	'crystal' : { 'name' : 'Crystal', 'description': 'A flawed crystal. Perhaps an alchemical art can make it whole.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/unknown.png', 'id' : 0 },
	'pure_crystal' : { 'name' : 'Pure Crystal', 'description': 'A flawless crystal. It is said that all metals may crystallize with time.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/unknown.png', 'id' : 0 },
	'coinage' : { 'name' : 'Coinage', 'description': 'Coinage from a long-dead civilization. In this realm, currency has no value beyond its physical properties.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/unknown.png', 'id' : 0 },
	'alcohol' : { 'name' : 'Alcohol', 'description': 'Distilled alcohol, cherished by alchemists and vagabonds alike. The relationship between alcohol and quicksilver has oft been supposed.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/unknown.png', 'id' : 0 },
	'ash' : { 'name' : 'Ash', 'description': 'The charred remains of a burning. Alchemically inert. You don\'t think anything more can be done...', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/unknown.png', 'id' : 0 },
	'cloud_bud' : { 'name' : 'Cloud Bud', 'description': 'A budding cloud, picked from its ephemeral ground. Concentrated and cool to the touch.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/unknown.png', 'id' : 0 },
	'iron' : { 'name' : 'Iron', 'description': 'Iron, the third tier of metal. Once essential, it now serves a more esoteric purpose.', 'type': Item.ItemType.Metal, 'sprite' : 'res://assets/items/silver.png', 'id' : 1 },
	'lead' : { 'name' : 'Lead', 'description': 'Lead, the fourth tier of metal. Once reviled, it now serves a more esoteric purpose.', 'type': Item.ItemType.Metal, 'sprite' : 'res://assets/items/silver.png', 'id' : 1 },
	'quicksilver_mote' : { 'name' : 'Quicksilver Mote', 'description': 'A fragment of quicksilver. Used to catalyze the ascension process, albeit with less intensity.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/quicksilver.png', 'id' : 4 },
	
}

const solution_recipes = [
	{ "required_ingredients": ["water_mote", "water_mote"], "items": ["water"] },
	{ "required_ingredients": ["fire_mote", "fire_mote"], "items": ["fire"] },
	{ "required_ingredients": ["air_mote", "air_mote"], "items": ["air"] },
	{ "required_ingredients": ["earth_mote", "earth_mote"], "items": ["earth"] },
	{ "required_ingredients": ["quicksilver_mote", "quicksilver_mote"], "items": ["quicksilver"] },
]

const dissolution_recipes = [
	{ "required_ingredients": ["water"], "items": ["water_mote", "water_mote"] },
	{ "required_ingredients": ["fire"], "items": ["fire_mote", "fire_mote"] },
	{ "required_ingredients": ["air"], "items": ["air_mote", "air_mote"] },
	{ "required_ingredients": ["earth"], "items": ["earth_mote", "earth_mote"] },
	{ "required_ingredients": ["cloud_tree"], "items": ["fruit", "wood"] },
	{ "required_ingredients": ["crystal_fountain"], "items": ["crystal", "water_mote", "coinage"] },
]

const sublimation_recipes = [
	{ "required_ingredients": ["gold"], "items": ["silver"] },
	{ "required_ingredients": ["silver"], "items": ["iron"] },
	{ "required_ingredients": ["iron"], "items": ["lead"] },
	{ "required_ingredients": ["earth"], "items": ["air"] },
	{ "required_ingredients": ["air"], "items": ["water"] },
	{ "required_ingredients": ["water"], "items": ["fire"] },
	{ "required_ingredients": ["fire"], "items": ["earth"] },
	{ "required_ingredients": ["pure_crystal"], "items": ["gold"] },
	{ "required_ingredients": ["wood"], "items": ["earth_mote", "air_mote"] },
]

const distillation_recipes = [
	{ "required_ingredients": ["seawater"], "items": ["water", "salt"] },
	{ "required_ingredients": ["fruit"], "items": ["water_mote", "salt", "alcohol"] },
	{ "required_ingredients": ["wood"], "items": ["ash", "salt"] },
	{ "required_ingredients": ["alcohol"], "items": ["quicksilver"] },
	{ "required_ingredients": ["cloud_bud"], "items": ["water_mote", "air_mote", "salt"] },
	{ "required_ingredients": ["coinage"], "items": ["base_metal", "salt"] },
]

const ascension_recipes = [
	{ "required_ingredients": ["quicksilver", "base_metal"], "items": ["gold"] },
	{ "required_ingredients": ["quicksilver_mote", "base_metal"], "items": ["lead"] },
	{ "required_ingredients": ["quicksilver_mote", "lead"], "items": ["iron"] },
	{ "required_ingredients": ["quicksilver_mote", "iron"], "items": ["silver"] },
	{ "required_ingredients": ["quicksilver_mote", "silver"], "items": ["gold"] },
	{ "required_ingredients": ["quicksilver", "crystal"], "items": ["pure_crystal"] },
	{ "required_ingredients": ["quicksilver_mote", "crystal"], "items": ["pure_crystal"] },
	{ "required_ingredients": ["quicksilver", "fire"], "items": ["water"] },
	{ "required_ingredients": ["quicksilver", "water"], "items": ["air"] },
	{ "required_ingredients": ["quicksilver", "air"], "items": ["earth"] },
	{ "required_ingredients": ["quicksilver", "earth"], "items": ["fire"] },
]
