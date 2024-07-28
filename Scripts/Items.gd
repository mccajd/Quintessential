class_name Items

const itemDB = {
	'gold' : { 'name' : 'Gold', 'description': 'The highest tier of metal.\nOnce coveted, it now serves a more esoteric purpose.', 'type': Item.ItemType.Metal, 'sprite' : 'res://assets/items/gold_metal.png', 'id' : 0 },
	'silver' : { 'name' : 'Silver', 'description': 'The second tier of metal.\nOnce revered, it now serves a more esoteric purpose.', 'type': Item.ItemType.Metal, 'sprite' : 'res://assets/items/silver.png', 'id' : 1 },
	'salt' : { 'name' : 'Salt', 'description': 'One of the three primes.\nUsed as a balancing agent for volatile processes, such as that of sublimation.', 'type': Item.ItemType.Prime, 'sprite' : 'res://assets/items/salt.png', 'id' : 2 },
	'sulfur' : { 'name' : 'Sulfur', 'description': 'One of the three primes.\nUsed as a combusting agent in the separation process of distillation when time is of the essence.', 'type': Item.ItemType.Prime, 'sprite' : 'res://assets/items/sulfur.png', 'id' : 3 },
	'quicksilver' : { 'name' : 'Quicksilver', 'description': 'One of the three primes.\nUsed as a catalyzing agent for the ascension of lesser elements.', 'type': Item.ItemType.Prime, 'sprite' : 'res://assets/items/quicksilver.png', 'id' : 4 },
	'water' : { 'name' : 'Water', 'description': 'One of the four elements.\nCan be ascended into Fire or sublimated into Earth.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/water.png', 'id' : 5 },
	'fire' : { 'name' : 'Fire', 'description': 'One of the four elements.\nCan be ascended into Air or sublimated into Water.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/fire.png', 'id' : 6 },
	'air' : { 'name' : 'Air', 'description': 'One of the four elements.\nCan be ascended into Earth or sublimated into Fire.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/air.png', 'id' : 7 },
	'earth' : { 'name' : 'Earth', 'description': 'One of the four elements.\nCan be ascended into Fire or sublimated into Air.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/earth.png', 'id' : 8 },
	'base_metal' : { 'name' : 'Base Metal', 'description': 'An item.', 'type': Item.ItemType.Metal, 'sprite' : 'res://assets/items/base_metal.png', 'id' : 9 },
	'seawater' : { 'name' : 'Seawater', 'description': 'Turgid seawater from the murky depths.\nIt may yield useful product under the right conditions.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/sea_water.png', 'id' : 10 },
	'water_mote' : { 'name' : 'Water Mote', 'description': 'A modicum of Water.\nOffers little of value on its own, but may yield greater when mixed with like kind.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/water_mote.png', 'id' : 11 },
	'fire_mote' : { 'name' : 'Fire Mote', 'description': 'A modicum of Fire.\nOffers little of value on its own, but may yield greater when mixed with like kind.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/fire_mote.png', 'id' : 12 },
	'air_mote' : { 'name' : 'Air Mote', 'description': 'A modicum of Air.\nOffers little of value on its own, but may yield greater when mixed with like kind.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/air_mote.png', 'id' : 13 },
	'earth_mote' : { 'name' : 'Earth Mote', 'description': 'A modicum of Earth.\nOffers little of value on its own, but may yield greater when mixed with like kind.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/earth_mote.png', 'id' : 14 },
	'ship_metal' : { 'name' : 'Ship Metal', 'description': 'Metal from a sunken ship.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/ship_metal.png', 'id' : 15 },
	'cloud_tree' : { 'name' : 'Cloud Tree', 'description': 'A tree sprouted from the surface of a cloud.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/cloud_tree.png', 'id' : 0 },
	'fruit' : { 'name' : 'Fruit', 'description': 'Fruit from a flowering tree.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/fruit.png', 'id' : 0 },
	'wood' : { 'name' : 'Wood', 'description': 'A wooden slat.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/wood.png', 'id' : 0 },
	'crystal_fountain' : { 'name' : 'Crystal Fountain', 'description': 'A brilliant crystal fountain.\nIts water shines with an otherworldly hue.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/crystal_fountain.png', 'id' : 0 },
	'crystal' : { 'name' : 'Crystal', 'description': 'A flawed crystal.\nPerhaps an alchemical art can make it whole.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/crystal.png', 'id' : 0 },
	'pure_crystal' : { 'name' : 'Pure Crystal', 'description': 'A flawless crystal.\nIt is said that all metals crystallize with time;\nonly through the esoteric arts can such crystallization be reversed.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/pure_crystal.png', 'id' : 0 },
	'coinage' : { 'name' : 'Coinage', 'description': 'Coinage from a long-dead civilization.\nIn this realm, currency has no value beyond its physical properties.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/coinage.png', 'id' : 0 },
	'alcohol' : { 'name' : 'Alcohol', 'description': 'Distilled alcohol.\nCherished by alchemists and vagabonds alike.\nAlcohol can oft be used as a substitute for quicksilver, albeit at reduced efficacy.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/alcohol.png', 'id' : 0 },
	'ash' : { 'name' : 'Ash', 'description': 'The charred remains of a burning.\nAlchemically inert. You don\'t think anything more can be done...', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/ash.png', 'id' : 0 },
	'cloud_bud' : { 'name' : 'Cloud Bud', 'description': 'A budding cloud, pulled up by its ephemeral roots.\nConcentrated and cool to the touch.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/cloud_bud.png', 'id' : 0 },
	'iron' : { 'name' : 'Iron', 'description': 'The third tier of metal.\nOnce essential, it now serves a more esoteric purpose.', 'type': Item.ItemType.Metal, 'sprite' : 'res://assets/items/tin_metal.png', 'id' : 1 },
	'lead' : { 'name' : 'Lead', 'description': 'The fourth tier of metal.\nOnce reviled, it now serves a more esoteric purpose.', 'type': Item.ItemType.Metal, 'sprite' : 'res://assets/items/lead_metal.png', 'id' : 1 },
	'quicksilver_mote' : { 'name' : 'Quicksilver Mote', 'description': 'A fragment of quicksilver.\nUsed to catalyze the ascension process, albeit with less intensity.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/quicksilver_mote.png', 'id' : 4 },
	'cloud' : { 'name' : 'Cloud', 'description': 'A full-sized cloud.\nTeeming with elemental energy.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/cloud.png', 'id' : 4 },
	
}

const solution_recipes = [
	{ "required_ingredients": ["water_mote", "water_mote"], "items": ["water"] },
	{ "required_ingredients": ["fire_mote", "fire_mote"], "items": ["fire"] },
	{ "required_ingredients": ["air_mote", "air_mote"], "items": ["air"] },
	{ "required_ingredients": ["earth_mote", "earth_mote"], "items": ["earth"] },
	{ "required_ingredients": ["quicksilver_mote", "quicksilver_mote"], "items": ["quicksilver"] },
	{ "required_ingredients": ["quicksilver_mote", "alcohol"], "items": ["quicksilver"] },
	{ "required_ingredients": ["cloud_bud", "cloud_bud"], "items": ["cloud"] },
]

const dissolution_recipes = [
	{ "required_ingredients": ["water"], "items": ["water_mote", "water_mote"] },
	{ "required_ingredients": ["fire"], "items": ["fire_mote", "fire_mote"] },
	{ "required_ingredients": ["air"], "items": ["air_mote", "air_mote"] },
	{ "required_ingredients": ["earth"], "items": ["earth_mote", "earth_mote"] },
	{ "required_ingredients": ["cloud_tree"], "items": ["fruit", "wood"] },
	{ "required_ingredients": ["crystal_fountain"], "items": ["crystal", "water_mote", "coinage"] },
	{ "required_ingredients": ["cloud_bud"], "items": ["air_mote"] },
	{ "required_ingredients": ["cloud"], "items": ["air"] },
	{ "required_ingredients": ["quicksilver"], "items": ["quicksilver_mote", "quicksilver_mote"] },
]

# NOTE.jmc - each of these will also implicitly be checked for salt as an ingredient
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
	{ "required_ingredients": ["earth_mote"], "items": ["air_mote"] },
	{ "required_ingredients": ["air_mote"], "items": ["water_mote"] },
	{ "required_ingredients": ["water_mote"], "items": ["fire_mote"] },
	{ "required_ingredients": ["fire_mote"], "items": ["earth_mote"] },
	{ "required_ingredients": ["cloud_tree"], "items": ["sulfur"] }
]

# NOTE.jmc - hidden feature. sublimation should allow doubling up for double the results.
static func get_double_sublimation_recipes():
	var rtn = []
	for recipe in sublimation_recipes:
		rtn += [{ "required_ingredients": recipe.required_ingredients + recipe.required_ingredients, "items": recipe.items + recipe.items }]
	return rtn

# NOTE.jmc - each of these will also implicitly be checked for sulfur as an ingredient
const distillation_recipes = [
	{ "required_ingredients": ["seawater"], "items": ["water", "salt"] },
	{ "required_ingredients": ["seawater", "seawater"], "items": ["water", "water", "salt"] },
	{ "required_ingredients": ["fruit"], "items": ["water_mote", "salt", "alcohol"] },
	{ "required_ingredients": ["fruit", "fruit"], "items": ["water", "salt", "alcohol"] },
	{ "required_ingredients": ["wood"], "items": ["ash", "salt"] },
	{ "required_ingredients": ["wood", "wood"], "items": ["ash", "salt"] },
	{ "required_ingredients": ["alcohol"], "items": ["quicksilver"] },
	{ "required_ingredients": ["cloud_bud"], "items": ["water_mote", "air_mote", "salt"] },
	{ "required_ingredients": ["cloud_bud", "cloud_bud"], "items": ["water", "air", "salt"] },
	{ "required_ingredients": ["cloud"], "items": ["water", "air", "salt"] },
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
	
	{ "required_ingredients": ["quicksilver_mote", "fire_mote"], "items": ["water_mote"] },
	{ "required_ingredients": ["quicksilver_mote", "water_mote"], "items": ["air_mote"] },
	{ "required_ingredients": ["quicksilver_mote", "air_mote"], "items": ["earth_mote"] },
	{ "required_ingredients": ["quicksilver_mote", "earth_mote"], "items": ["fire_mote"] },
	
	{ "required_ingredients": ["quicksilver", "fire_mote"], "items": ["water_mote"] },
	{ "required_ingredients": ["quicksilver", "water_mote"], "items": ["air_mote"] },
	{ "required_ingredients": ["quicksilver", "air_mote"], "items": ["earth_mote"] },
	{ "required_ingredients": ["quicksilver", "earth_mote"], "items": ["fire_mote"] },
	
	# TODO.jmc - codify this relationship better
	{ "required_ingredients": ["alcohol", "fire_mote"], "items": ["water_mote"] },
	{ "required_ingredients": ["alcohol", "water_mote"], "items": ["air_mote"] },
	{ "required_ingredients": ["alcohol", "air_mote"], "items": ["earth_mote"] },
	{ "required_ingredients": ["alcohol", "earth_mote"], "items": ["fire_mote"] },
	{ "required_ingredients": ["alcohol", "base_metal"], "items": ["lead"] },
	{ "required_ingredients": ["alcohol", "lead"], "items": ["iron"] },
	{ "required_ingredients": ["alcohol", "iron"], "items": ["silver"] },
	{ "required_ingredients": ["alcohol", "silver"], "items": ["gold"] },
	{ "required_ingredients": ["alcohol", "crystal"], "items": ["pure_crystal"] },
]
