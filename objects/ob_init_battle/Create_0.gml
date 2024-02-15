/// @desc 

trainer_loser = -1

globalvar selected_id;
selected_id = noone

globalvar dTime;
globalvar minFPS;
globalvar debug;
dTime = 0
minFPS = 30
debug = false

watching = ds_list_create()
globalvar fx_system_damage;
fx_system_damage = part_system_create_layer("Effect_damage", false)

enum poke_exp {
	damage,
	dodge,
	kill,
	count
}

enum act_exp {
	use		= poke_exp.count,
	success = poke_exp.count+1,
}

globalvar exps;
exps[poke_exp.damage] = 1
exps[poke_exp.dodge	] = 2
exps[poke_exp.kill	] = 3 // mod force value of dead pokemon and changed lvl killer pokemon.
exps[act_exp.use	] = 1
exps[act_exp.success] = 8

#macro base_lvlup_value_action 1000
#macro base_lvlup_value 1000 // for pokemon
