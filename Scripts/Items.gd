class_name Items

const itemDB = {
	'gold' : { 'name' : 'Gold', 'description': 'The highest tier of metal.\nOnce coveted, it now serves a more esoteric purpose.', 'type': Item.ItemType.Metal, 'sprite' : 'res://assets/items/gold_metal.png', 'id' : 0 },
	'silver' : { 'name' : 'Silver', 'description': 'The second tier of metal.\nOnce revered, it now serves a more esoteric purpose.', 'type': Item.ItemType.Metal, 'sprite' : 'res://assets/items/silver_metal.png', 'id' : 1 },
	'salt' : { 'name' : 'Salt', 'description': 'One of the three primes.\nUsed as a balancing agent for volatile processes, such as that of sublimation.', 'type': Item.ItemType.Prime, 'sprite' : 'res://assets/items/salt.png', 'id' : 2 },
	'sulfur' : { 'name' : 'Sulfur', 'description': 'One of the three primes.\nUsed as a combusting agent in the separation process of distillation when time is of the essence.', 'type': Item.ItemType.Prime, 'sprite' : 'res://assets/items/sulfur.png', 'id' : 3 },
	'quicksilver' : { 'name' : 'Quicksilver', 'description': 'One of the three primes.\nUsed as a catalyzing agent for the ascension of lesser elements.', 'type': Item.ItemType.Prime, 'sprite' : 'res://assets/items/quicksilver.png', 'id' : 4 },
	'water' : { 'name' : 'Water', 'description': 'One of the four elements.\nAscends into Air.\nSublimates into Fire.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/water.png', 'id' : 5 },
	'fire' : { 'name' : 'Fire', 'description': 'One of the four elements.\nAscends into Water.\nSublimates into Earth.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/fire.png', 'id' : 6 },
	'air' : { 'name' : 'Air', 'description': 'One of the four elements.\nAscends into Earth.\nSublimates into Water.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/air.png', 'id' : 7 },
	'earth' : { 'name' : 'Earth', 'description': 'One of the four elements.\nAscends into Fire.\nSublimates into Air.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/earth.png', 'id' : 8 },
	'base_metal' : { 'name' : 'Base Metal', 'description': 'Reclaimed metal of unknown consistency.\nCan be ascended with the right catalyst.', 'type': Item.ItemType.Metal, 'sprite' : 'res://assets/items/base_metal.png', 'id' : 9 },
	'seawater' : { 'name' : 'Seawater', 'description': 'Turgid seawater from the murky depths.\nIt may yield useful product under the right conditions.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/sea_water.png', 'id' : 10 },
	'water_mote' : { 'name' : 'Water Mote', 'description': 'A modicum of Water.\nAscends into Air.\nSublimates into Fire.\nOffers little of value on its own, but may yield greater when mixed with like kind.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/water_mote.png', 'id' : 11 },
	'fire_mote' : { 'name' : 'Fire Mote', 'description': 'A modicum of Fire.\nAscends into Water.\nSublimates into Earth.\nOffers little of value on its own, but may yield greater when mixed with like kind.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/fire_mote.png', 'id' : 12 },
	'air_mote' : { 'name' : 'Air Mote', 'description': 'A modicum of Air.\nAscends into Earth.\nSublimates into Water.\nOffers little of value on its own, but may yield greater when mixed with like kind.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/air_mote.png', 'id' : 13 },
	'earth_mote' : { 'name' : 'Earth Mote', 'description': 'A modicum of Earth.\nAscends into Fire.\nSublimates into Air.\nOffers little of value on its own, but may yield greater when mixed with like kind.', 'type': Item.ItemType.Element, 'sprite' : 'res://assets/items/earth_mote.png', 'id' : 14 },
	'scrap_metal' : { 'name' : 'Scrap Metal', 'description': 'Metal scrap.\nImperfect, but can be ascended with the right catalyst.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/ship_metal.png', 'id' : 15 },
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
	'meat_sack' : { 'name' : 'Sack of Cured Meats', 'description': 'A sack of meats cured in salt.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/sack_of_meat_token.png', 'id' : 4 },
	'cacti' : { 'name' : 'Cacti', 'description': 'A prickly plant found in the desert.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/cacti_token.png', 'id' : 4 },
	'bones' : { 'name' : 'Bones', 'description': 'Sun bleached pile of bones.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/bones_token.png', 'id' : 4 },
	'frankincense' : { 'name' : 'Frankincense', 'description': 'An aromatic resin.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/frankincense_token.png', 'id' : 4 },
	'myrrh' : { 'name' : 'Myrrh', 'description': 'A sap-like resin.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/myrrh_token.png', 'id' : 4 },
	'cacti_husk' : { 'name' : 'Cacti Husk', 'description': 'Freshly harvested cacti husk.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/cacti_husk_token.png', 'id' : 4 },
	'cured_meat' : { 'name' : 'Cured Meat', 'description': 'Salted and preserved meats, necessary for crossing the harsh desert climate.\nAlchemically inert but a tasty snack.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/cured_meat_token.png', 'id' : 4 },
	'barrel' : { 'name' : 'Barrel', 'description': 'An old wooden barrel.\nIts metal rivets and hoops have very little value,\nbut perhaps its wooden body could be useful?', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/barrel.png', 'id' : 0 },
	'wine' : { 'name' : 'Wine', 'description': 'An antique bottle of wine.\nAlways celebrated for its excellence, it now serves a different purpose.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/wine.png', 'id' : 0 },
	'sea_creature' : { 'name' : 'Sea Creature', 'description': 'A gargantuan creature from depths untold.\nIts massive carcass must have once teemed with body and soul.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/creature.png', 'id' : 0 },
	'coral' : { 'name' : 'Coral', 'description': 'A large decaying coral.\nThis pitiful sight appears to be the only sign of life in this place.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/coral.png', 'id' : 0 },
	'anchor' : { 'name' : 'Anchor', 'description': 'A metal ship anchor found embedded in the bowels of a sea creature.\nWhether its placement there were incidental or deliberate may never be known.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/anchor.png', 'id' : 0 },
	'raw_meat' : { 'name' : 'Raw Meat', 'description': 'Meat from a sea creature.\nLikely inedible unless one is wrought with desperation.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/raw_meat.png', 'id' : 0 },
	
	# NOTE.Kei for sanity
	'fallen_alchemist' : { 'name' : 'Fallen Alchemist', 'description': 'One Alchemist\'s failure is another\'s reagents.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/unknown.png', 'id' : 4 },
	'ancient_monolith' : { 'name' : 'Ancient Monolith', 'description': 'A monolith teeming with raw elemental power.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/unknown.png', 'id' : 4 },
	'lamp' : { 'name' : 'Lamp', 'description': 'A surprisingly well preserved lamp, smells faintly of oil and ash.\n[i]Got a light?[/i]', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/unknown.png', 'id' : 4 },
	'dagger' : { 'name' : 'Dagger', 'description': 'A worn and dull dagger.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/unknown.png', 'id' : 4 },
	'iron_vein' : { 'name' : 'Iron Vein', 'description': 'An untapped vein of raw Iron.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/unknown.png', 'id' : 4 },
	'iron_scrap' : { 'name' : 'Iron Scraps', 'description': 'Small pieces of Iron.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/unknown.png', 'id' : 4 },
	'note' : { 'name' : 'Note', 'description': 'Dude, lore...', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/unknown.png', 'id' : 4 },
	'rock' : { 'name' : 'Rock', 'description': 'Frequently kicked by adversaries.', 'type': Item.ItemType.World, 'sprite' : 'res://assets/items/unknown.png', 'id' : 4 },
}

const solution_recipes = [
	{ "required_ingredients": ["water_mote", "water_mote"], "items": ["water"] },
	{ "required_ingredients": ["fire_mote", "fire_mote"], "items": ["fire"] },
	{ "required_ingredients": ["air_mote", "air_mote"], "items": ["air"] },
	{ "required_ingredients": ["earth_mote", "earth_mote"], "items": ["earth"] },
	{ "required_ingredients": ["quicksilver_mote", "quicksilver_mote"], "items": ["quicksilver"] },
	{ "required_ingredients": ["quicksilver_mote", "alcohol"], "items": ["quicksilver"] },
	{ "required_ingredients": ["cloud_bud", "cloud_bud"], "items": ["cloud"] },
	{ "required_ingredients": ["seawater", "water"], "items": ["seawater", "seawater"] },
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
	{ "required_ingredients": ["meat_sack"], "items": ["cured_meat", "salt", "salt"] },
	{ "required_ingredients": ["barrel"], "items": ["wood"] },
	{ "required_ingredients": ["coral"], "items": ["air_mote", "water_mote"] },
	{ "required_ingredients": ["sea_creature"], "items": ["earth", "fire_mote", "water", "raw_meat"] },
	# manually added dupes (may do this programmatically later
	{ "required_ingredients": ["barrel", "barrel" ], "items": ["wood", "wood"] },

	# NOTE.Kei for sanity
	{ "required_ingredients": ["fallen_alchemist"], "items": ["bones", "bones", "dagger", "alcohol", "note"] },
	{ "required_ingredients": ["dagger"], "items": ["iron_scrap"] },
	{ "required_ingredients": ["iron_vein"], "items": ["iron_scrap", "rock", "rock"] },
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
	{ "required_ingredients": ["cloud_tree"], "items": ["sulfur"] },
	{ "required_ingredients": ["cacti_husk"], "items": ["sulfur"] },
	{ "required_ingredients": ["barrel"], "items": ["earth_mote", "air_mote"] },
	{ "required_ingredients": ["barrel", "barrel", "salt"], "items": ["earth", "air"] },
	{ "required_ingredients": ["coral"], "items": ["sulfur"] },
	{ "required_ingredients": ["raw_meat"], "items": ["sulfur"] },

	# NOTE.Kei for sanity
	{ "required_ingredients": ["rock"], "items": ["earth_mote"] },
	{ "required_ingredients": ["ancient_monolith"], "items": ["earth_mote", "water_mote", "fire_mote", "air_mote"] },
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
	{ "required_ingredients": ["cacti"], "items": ["water_mote", "salt", "cacti_husk"] },
	{ "required_ingredients": ["bones"], "items": ["sulfur", "salt"] },
	{ "required_ingredients": ["frankincense"], "items": ["earth_mote", "water_mote", 'sulfur'] },
	{ "required_ingredients": ["myrrh"], "items": ["earth_mote", "water_mote", 'sulfur'] },
	{ "required_ingredients": ["sand"], "items": ["earth_mote", "crystal", 'salt'] },
	{ "required_ingredients": ["barrel"], "items": ["ash", "salt"] },
	{ "required_ingredients": ["barrel", "barrel"], "items": ["ash", "salt"] },
	{ "required_ingredients": ["wine"], "items": ["alcohol", "alcohol", "water_mote", "salt"] },
	{ "required_ingredients": ["coral"], "items": ["salt", "salt"] },
	{ "required_ingredients": ["anchor"], "items": ["scrap_metal", "quicksilver"] },
	{ "required_ingredients": ["sea_creature"], "items": ["salt", "salt", "sulfur", "sulfur"] },

	# NOTE.Kei for sanity
	{ "required_ingredients": ["lamp"], "items": ["earth_mote", "fire_mote", "iron_scrap", "ash"] },
]

const ascension_recipes = [
	{ "required_ingredients": ["quicksilver", "base_metal"], "items": ["gold"] },
	{ "required_ingredients": ["quicksilver_mote", "base_metal"], "items": ["lead"] },
	{ "required_ingredients": ["quicksilver", "scrap_metal"], "items": ["lead"] },
	{ "required_ingredients": ["quicksilver_mote", "scrap_metal"], "items": ["lead"] },
	{ "required_ingredients": ["quicksilver_mote", "lead"], "items": ["iron"] },
	{ "required_ingredients": ["quicksilver_mote", "iron"], "items": ["silver"] },
	{ "required_ingredients": ["quicksilver_mote", "silver"], "items": ["gold"] },
	{ "required_ingredients": ["quicksilver_mote", "quicksilver_mote", "lead"], "items": ["silver"] },
	{ "required_ingredients": ["quicksilver_mote", "quicksilver_mote", "quicksilver_mote", "lead"], "items": ["gold"] },
	{ "required_ingredients": ["quicksilver_mote", "quicksilver_mote", "iron"], "items": ["gold"] },
	{ "required_ingredients": ["quicksilver", "lead"], "items": ["gold"] },
	{ "required_ingredients": ["quicksilver", "iron"], "items": ["gold"] },
	{ "required_ingredients": ["quicksilver", "silver"], "items": ["gold"] },
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
	{ "required_ingredients": ["alcohol", "scrap_metal"], "items": ["lead"] },
	{ "required_ingredients": ["alcohol", "lead"], "items": ["iron"] },
	{ "required_ingredients": ["alcohol", "alcohol", "lead"], "items": ["silver"] },
	{ "required_ingredients": ["alcohol", "alcohol", "alcohol", "lead"], "items": ["gold"] },
	{ "required_ingredients": ["alcohol", "iron"], "items": ["silver"] },
	{ "required_ingredients": ["alcohol", "alcohol", "iron"], "items": ["gold"] },
	{ "required_ingredients": ["alcohol", "silver"], "items": ["gold"] },
	{ "required_ingredients": ["alcohol", "crystal"], "items": ["pure_crystal"] },

	{ "required_ingredients": ["alcohol", "frankincense"], "items": ["wood"] },
	{ "required_ingredients": ["quicksilver_mote", "frankincense"], "items": ["wood"] },
	{ "required_ingredients": ["alcohol", "myrrh"], "items": ["wood"] },
	{ "required_ingredients": ["quicksilver_mote", "myrrh"], "items": ["wood"] },
	{ "required_ingredients": ["alcohol", "cacti_husk"], "items": ["cacti"] },
	{ "required_ingredients": ["quicksilver_mote", "cacti_husk"], "items": ["cacti"] },

	# NOTE.Kei for sanity
	{ "required_ingredients": ["alcohol", "scrap_iron"], "items": ["iron"] },
	{ "required_ingredients": ["quicksilver_mote", "scrap_iron"], "items": ["iron"] },
]
