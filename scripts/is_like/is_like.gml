function is_like(_child_object_index, _parent_object_index) {
	return (
		object_is_ancestor(_child_object_index, _parent_object_index) 
		or (_child_object_index == _parent_object_index)
	) 
}
