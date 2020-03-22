/// @description Insert description here
// You can write your code in this editor

elements = layer_get_all_elements("Zones_2");
for (var i = 0; i < array_length_1d(elements); i++){
	if (layer_get_element_type(elements[i]) == layerelementtype_instance){
		var inst = layer_instance_get_instance(elements[i]);
		inst.x--
		//instance_create_layer(inst.x,inst.y,"Instances",obj_bubbles)
		//instance_destroy(inst)
	}
}
elements = layer_get_all_elements("Instances_2");
for (var i = 0; i < array_length_1d(elements); i++){
	if (layer_get_element_type(elements[i]) == layerelementtype_instance){
		var inst = layer_instance_get_instance(elements[i]);
		inst.x--
		//instance_create_layer(inst.x,inst.y,"Instances",obj_bubbles)
		//instance_destroy(inst)
	}
}
//layer_x("Zones_2",layer_get_x("Zones_2")-1)
layer_x("BackTiles_2",layer_get_x("BackTiles_2")-1)
//layer_x("Instances_2",layer_get_x("Instances_2")-1)