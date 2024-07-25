extends Node

class_name ItemTransformer

func transform(type: String, item_keys):
	# TODO.jmc - implement the rest of the transformations (if we need any more)
	match type:
		"solution":
			return _transform(Items.solution_recipes, item_keys)
		"dissolution":
			return _transform(Items.dissolution_recipes, item_keys)
		"sublimation":
			return _transform(Items.sublimation_recipes, item_keys)
		"distillation":
			return _transform(Items.distillation_recipes, item_keys)
		"ascension":
			return _transform(Items.ascension_recipes, item_keys)
		_:
			return item_keys


func _transform(recipes, item_keys):
	# NOTE.jmc - the more I work in godot the less I like its "support" for typing
	# 	let's just have a gentlemans agreement to make sure dictionary items
	#	have "required_ingredients" and "items" arrays
	for recipe in recipes:
		if find_match(recipe, item_keys):
			return recipe.items
	return null


func find_match(recipe, item_keys):
	# if any ingredients haven't been used, treat as a failure condition
	# prevents brute forcing puzzles by adding everything as an input at once
	# NOTE.jmc - if the game proves too obtuse, perhaps introduce this as either
	# 		a difficulty option or a consequence of the shadows in late game
	return Helpers.compare_arrays(recipe.required_ingredients, item_keys)
