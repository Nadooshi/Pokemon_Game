/// @desc 

trainer_loser = -1

globalvar selected_id;
selected_id = noone

globalvar dTime;
globalvar minFPS;
dTime = 0
minFPS = 30

watching = ds_list_create()
globalvar fx_system_damage;
fx_system_damage = part_system_create_layer("Effect_damage", false)

enum poke_exp {
	damage,
	dodge,
	kill,
	win,
	count
}

enum act_exp {
	use		= poke_exp.count,
	success = poke_exp.count+1,
}

globalvar exps;
exps[poke_exp.damage] = 2
exps[poke_exp.dodge	] = 1
exps[poke_exp.kill	] = 750 // based on level difference between attacking and killed
exps[poke_exp.win	] = 2// multiply for accumulated exp. per battle
exps[act_exp.use	] = 1
exps[act_exp.success] = 6


