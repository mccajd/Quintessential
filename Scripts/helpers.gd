class_name Helpers

static func compare_arrays(arr1, arr2):
	if arr1 == null && arr2 == null:
		return true
	if arr1 == null || arr2 == null:
		return false
	
	# reference types OMEGALUL
	var deep_copy1 = arr1.duplicate()
	var deep_copy2 = arr2.duplicate()
	
	for item in deep_copy1:
		var ix = deep_copy2.find(item)
		if ix > -1:
			deep_copy2.remove_at(ix)
		else:
			return false

	return deep_copy2.size() == 0

# stolen from https://forum.godotengine.org/t/how-to-get-all-children-from-a-node/18587/3
static func get_all_children(in_node,arr:=[]):
	arr.push_back(in_node)
	for child in in_node.get_children():
		arr = get_all_children(child, arr)
	return arr
