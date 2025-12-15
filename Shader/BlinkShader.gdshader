shader_type canvas_item;

uniform bool branco;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	if(branco){
		if (COLOR.a != 0.0){
			COLOR.rgb = vec3(1.0);
		}
			
	}
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
