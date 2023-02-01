/// @desc 

if debug {
	gpu_set_blendmode_ext_sepalpha(bm_one, bm_one, bm_src_alpha, bm_inv_src_alpha)
	draw_self()
	gpu_set_blendmode(bm_normal)
	draw_text_transformed(x, y + db_caption_y, object_get_name(object_index), 0.15, 0.15, 0)
}// else
//	draw_self()





