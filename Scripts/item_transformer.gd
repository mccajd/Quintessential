extends Node

class_name ItemTransformer


func transform(type: String, item_keys):
	match type:
		"solution":
			return _transform(Items.solution_recipes, item_keys)
		"dissolution":
			return _transform(Items.dissolution_recipes, item_keys)
		"sublimation":
			var round = _transform(Items.get_double_sublimation_recipes(), item_keys, ["salt", "salt"])
			return round if round != null else _transform(Items.sublimation_recipes, item_keys, ["salt"])
		"distillation":
			return _transform(Items.distillation_recipes, item_keys, ["sulfur"])
		"ascension":
			return _transform(Items.ascension_recipes, item_keys)
		_:
			return item_keys


func _transform(recipes, item_keys, additional_items = []):
	# NOTE.jmc - the more I work in godot the less I like its "support" for typing
	# 	let's just have a gentlemans agreement to make sure dictionary items
	#	have "required_ingredients" and "items" arrays
	for recipe in recipes:
		if find_match(recipe, item_keys, additional_items):
			return recipe.items
	return null


func find_match(recipe, item_keys, additional_items):
	# if any ingredients haven't been used, treat as a failure condition
	# prevents brute forcing puzzles by adding everything as an input at once
	# NOTE.jmc - if the game proves too obtuse, perhaps introduce this as either
	# 		a difficulty option or a consequence of the shadows in late game
	return Helpers.compare_arrays(recipe.required_ingredients + additional_items, item_keys)
