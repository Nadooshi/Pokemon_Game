/// @desc Init globals
randomize()
#region Elemental

enum _ELEMENTAL {
	white,
	dark,
	flame,
	water,
	ground,
	psy,
	poison,
	electric,
	wind,
	lunar,
	solar,
	flesh, 
	ghost,
	plant,
	steel,
	rock,	
	furry,   // пушистый	
	mystic,
	ancient, // древний
	shielded,  // панцирный
	marine,  // водоплавающий
	bird,
	cosmic,
	spike,
	frozen,
	insect,
	dragon,
	robotic,
	muddy,
	woody,
	none,
	count    // чтобы узнать количество значений
}

globalvar elemental_text
var i=0
elemental_text[i++] = "white"
elemental_text[i++] = "dark"
elemental_text[i++] = "flame"
elemental_text[i++] = "water"
elemental_text[i++] = "ground"
elemental_text[i++] = "psy"
elemental_text[i++] = "poison"
elemental_text[i++] = "electric"
elemental_text[i++] = "wind"
elemental_text[i++] = "lunar"
elemental_text[i++] = "solar"
elemental_text[i++] = "flesh" 
elemental_text[i++] = "ghost"
elemental_text[i++] = "plant"
elemental_text[i++] = "steel"
elemental_text[i++] = "rock"
elemental_text[i++] = "furry"	// пушистый	
elemental_text[i++] = "mystic"
elemental_text[i++] = "ancient"	// древний
elemental_text[i++] = "shielded"	// панцирный
elemental_text[i++] = "marine"	// водоплавающий
elemental_text[i++] = "bird"
elemental_text[i++] = "cosmic"
elemental_text[i++] = "spike"
elemental_text[i++] = "frozen"
elemental_text[i++] = "insect"
elemental_text[i++] = "dragon"
elemental_text[i++] = "robotic"
elemental_text[i++] = "muddy"
elemental_text[i++] = "woody"
elemental_text[i++] = "none"

#endregion

//////////////////////////////////

#region Material
enum _MATERIAL {
	white,
	dark,
	flame,
	water,
	ground,
	psy,
	poison,
	electric,
	wind,
	lunar,
	solar,
	flesh, 
	ghost,
	plant,
	steel,
	rock,	
	furry,   // пушистый	
	mystic,
	ancient, // древний
	shielded,  // панцирный
	marine,  // водоплавающий
	bird,
	cosmic,
	spike,
	frozen,
	insect,
	dragon,
	robotic,
	muddy,
	woody,
	none,
	count    // чтобы узнать количество значений
}

globalvar material_text
var i=0
material_text[i++] = "white"
material_text[i++] = "dark"
material_text[i++] = "flame"
material_text[i++] = "water"
material_text[i++] = "ground"
material_text[i++] = "psy"
material_text[i++] = "poison"
material_text[i++] = "electric"
material_text[i++] = "wind"
material_text[i++] = "lunar"
material_text[i++] = "solar"
material_text[i++] = "flesh" 
material_text[i++] = "ghost"
material_text[i++] = "plant"
material_text[i++] = "steel"
material_text[i++] = "rock"
material_text[i++] = "furry"	// пушистый	
material_text[i++] = "mystic"
material_text[i++] = "ancient"	// древний
material_text[i++] = "shielded"	// панцирный
material_text[i++] = "marine"	// водоплавающий
material_text[i++] = "bird"
material_text[i++] = "cosmic"
material_text[i++] = "spike"
material_text[i++] = "frozen"
material_text[i++] = "insect"
material_text[i++] = "dragon"
material_text[i++] = "robotic"
material_text[i++] = "muddy"
material_text[i++] = "woody"
material_text[i++] = "none"

globalvar material_colour
var i=0

material_colour[i++] = make_colour_rgb(255,255,255)		//white
material_colour[i++] = make_colour_rgb(45,45,45)		//dark
material_colour[i++] = make_colour_rgb(255,110,10)		//flame
material_colour[i++] = make_colour_rgb(70,70,255)		//water
material_colour[i++] = make_colour_rgb(127,90,38)		//ground
material_colour[i++] = make_colour_rgb(255,100,100)		//psy
material_colour[i++] = make_colour_rgb(10,160,100)		//poison
material_colour[i++] = make_colour_rgb(255,255,0)		//electric
material_colour[i++] = make_colour_rgb(255,230,190)		//wind
material_colour[i++] = make_colour_rgb(196,200,255)		//lunar
material_colour[i++] = make_colour_rgb(255,255,150)		//solar
material_colour[i++] = make_colour_rgb(160,0,15)		//flesh
material_colour[i++] = make_colour_rgb(109,8,160)		//ghost
material_colour[i++] = make_colour_rgb(170,255,0)		//plant
material_colour[i++] = make_colour_rgb(255,246,204)		//steel
material_colour[i++] = make_colour_rgb(50,38,15)		//rock
material_colour[i++] = make_colour_rgb(127,120,102)		//furry
material_colour[i++] = make_colour_rgb(250,0,255)		//mystic
material_colour[i++] = make_colour_rgb(165,165,255)		//ancient
material_colour[i++] = make_colour_rgb(166,170,121)		//shielded
material_colour[i++] = make_colour_rgb(12,12,127)		//marine
material_colour[i++] = make_colour_rgb(127,100,100)		//bird
material_colour[i++] = make_colour_rgb(211,2,103)		//cosmic
material_colour[i++] = make_colour_rgb(97,217,229)		//spike
material_colour[i++] = make_colour_rgb(186,255,240)		//frozen
material_colour[i++] = make_colour_rgb(162,204,95)		//insect
material_colour[i++] = make_colour_rgb(225,0,0)			//dragon
material_colour[i++] = make_colour_rgb(110,121,127)		//robotic
material_colour[i++] = make_colour_rgb(127,114,94)		//muddy
material_colour[i++] = make_colour_rgb(127,55,0)		//woody
material_colour[i++] = make_colour_rgb(255,255,255)		//none

#endregion

//////////////////////////////////

#region Attack setup

enum _ATTACK_TYPE {
	melee,
	range,
	aura,
	front,
	lunge,     // выпад
	mortar,    // ballistic traectory
	pool,
	cloud,
	wave,
	barrier,
	ray,
	swoop,
	pivot		// technical (no state reaction)
}

globalvar attack_type_text
var i=0
attack_type_text[i++] = "melee"
attack_type_text[i++] = "range"
attack_type_text[i++] = "aura"
attack_type_text[i++] = "front"
attack_type_text[i++] = "lunge"
attack_type_text[i++] = "mortar"
attack_type_text[i++] = "pool"
attack_type_text[i++] = "cloud"
attack_type_text[i++] = "wave"
attack_type_text[i++] = "barrier"
attack_type_text[i++] = "ray"
attack_type_text[i++] = "swoop"

enum _ATTACK_AFFECT {
	friend	= 1,
	enemy	= 2,
	itself	= 4,
}

globalvar attack_affect_text;
attack_affect_text[_ATTACK_AFFECT.friend] = "friend"
attack_affect_text[_ATTACK_AFFECT.enemy ] = "enemy"
attack_affect_text[_ATTACK_AFFECT.itself] = "itself"

enum _ATTACK_TG {
	teleport    = 0,
	air			= 1,
	ground		= 2,
	underground = 4,
	all			= 7
}

globalvar attack_target_text;
attack_target_text[_ATTACK_TG.air	 	]  = "air"
attack_target_text[_ATTACK_TG.ground	]  = "ground"
attack_target_text[_ATTACK_TG.underground] = "underground"

enum _ATTACK_ROLE {
	debuff = 0,
	buff   = 1
}

enum _BULLET_PH {
	custom,
	soft,
	chain,
	piercer,
	bowl
}
globalvar bullet_physic_text
var i = 0
bullet_physic_text[i++] = "(Custom) Save position"
bullet_physic_text[i++] = "Blow away by wind"
bullet_physic_text[i++] = "Chain reaction"
bullet_physic_text[i++] = "No collision"
bullet_physic_text[i++] = "Push players"

#endregion

//////////////////////////////////

#region States

enum _ABILITY_STATE {
	none,
	incineration,  // горение
	burn,          // ожог
	bleed,
	leech,
	poison,
	paralyze,
	powerup,       // +1 к атаке
	weak,
	speedup,       // +1 к ОД
	slowdown,
	trap,
	random_x,	   // случайное значение урона
	lulling,       // усыпление
	stun,          // ошеломление
	terror,        // ужас
	flee,          // escape.mid
	wastetime,
	disgust,
	target,
	loser,         // неуклюжесть
	knockdown,     // отдача. толчок с падением
	blast,
	revenge,
	kamikaze,
	mindcontrol,   // гипноз
	confusion,     // смущение
	telekinesis,
	teleport,
	meleeup,
	rangeup,
	heal,
	medicine,
	cure,
	clear,         // снятие эффектов
	confidence,    // уверенность
	reflect,
	block,
	dextery,	   // уклонение
	mutual,	
	wreck,
	barrier,
	count
}

globalvar ability_text;
i=1
ability_text[i++] = "incineration"  // горение*
ability_text[i++] = "burn"          // ожог - шрам*
ability_text[i++] = "bleed"			//*
ability_text[i++] = "leech"			//*
ability_text[i++] = "poison"		//*
ability_text[i++] = "paralyze"		//*
ability_text[i++] = "powerup"       // +1 к атаке *
ability_text[i++] = "weak"			//*
ability_text[i++] = "speedup"       // +1 к ОД*
ability_text[i++] = "slowdown"		//*
ability_text[i++] = "trap"			//*
ability_text[i++] = "random"		//*
ability_text[i++] = "lulling"       // усыпление*
ability_text[i++] = "stun"          // ошеломление*
ability_text[i++] = "terror"        // ужас*
ability_text[i++] = "flee"          // escape.mid *
ability_text[i++] = "wastetime"		// *
ability_text[i++] = "disgust"		// отвращение*
ability_text[i++] = "target"		//*
ability_text[i++] = "loser"         // неуклюжесть*
ability_text[i++] = "knockdown"     // отдача. толчок с падением*
ability_text[i++] = "blast"			// урон с отбрасыванием*
ability_text[i++] = "revenge"		//*
ability_text[i++] = "kamikaze"		//*
ability_text[i++] = "mindcontrol"   // гипноз
ability_text[i++] = "confusion"     // смущение*
ability_text[i++] = "telekinesis"	//*
ability_text[i++] = "teleport"		//*
ability_text[i++] = "meleeup"		//*
ability_text[i++] = "rangeup"		//*
ability_text[i++] = "heal"			//*
ability_text[i++] = "medicine"		//*
ability_text[i++] = "cure"			//*
ability_text[i++] = "clear"         // снятие эффектов*
ability_text[i++] = "confidence"    // уверенность*
ability_text[i++] = "reflect"		// рикошет*
ability_text[i++] = "block"			//*
ability_text[i++] = "dextery"		// уклонение*
ability_text[i++] = "mutual"		//*
ability_text[i++] = "wreck"			//*
ability_text[i++] = "barrier"		//*

globalvar state_object;
for (var i=0; i<_ABILITY_STATE.count-1; i++)
   state_object[i] = noone;

state_object[_ABILITY_STATE.incineration] = ob_state_incineration;  
state_object[_ABILITY_STATE.poison		] = ob_state_infestation;
state_object[_ABILITY_STATE.bleed		] = ob_state_bleeding;
state_object[_ABILITY_STATE.leech		] = ob_state_leech;
state_object[_ABILITY_STATE.paralyze	] = ob_state_paralyze;
state_object[_ABILITY_STATE.mutual		] = ob_state_mutual;
state_object[_ABILITY_STATE.barrier		] = ob_state_barrier;
state_object[_ABILITY_STATE.block		] = ob_state_blok;
state_object[_ABILITY_STATE.powerup		] = ob_state_powerup;
state_object[_ABILITY_STATE.weak		] = ob_state_weak;
state_object[_ABILITY_STATE.speedup		] = ob_state_speedup;
state_object[_ABILITY_STATE.slowdown	] = ob_state_slowdown;
state_object[_ABILITY_STATE.target		] = ob_state_target;
state_object[_ABILITY_STATE.loser		] = ob_state_loser;
state_object[_ABILITY_STATE.knockdown	] = ob_state_knockdown;
state_object[_ABILITY_STATE.blast		] = ob_state_blast;
state_object[_ABILITY_STATE.trap		] = ob_state_trap;
state_object[_ABILITY_STATE.wreck		] = ob_state_wreck;
state_object[_ABILITY_STATE.confusion	] = ob_state_confusion;
state_object[_ABILITY_STATE.dextery		] = ob_state_dextery;
state_object[_ABILITY_STATE.stun		] = ob_state_stun;
state_object[_ABILITY_STATE.terror		] = ob_state_terror;
state_object[_ABILITY_STATE.meleeup		] = ob_state_meleeup;
state_object[_ABILITY_STATE.rangeup		] = ob_state_rangeup;
state_object[_ABILITY_STATE.reflect		] = ob_state_reflect;
state_object[_ABILITY_STATE.disgust		] = ob_state_disgust;
state_object[_ABILITY_STATE.burn		] = ob_state_burn;
state_object[_ABILITY_STATE.heal		] = ob_state_heal;
state_object[_ABILITY_STATE.clear		] = ob_state_clear;
state_object[_ABILITY_STATE.confidence	] = ob_state_confidance;
state_object[_ABILITY_STATE.medicine	] = ob_state_medicine;
state_object[_ABILITY_STATE.cure		] = ob_state_cure;
state_object[_ABILITY_STATE.kamikaze	] = ob_state_kamikaze;
state_object[_ABILITY_STATE.lulling		] = ob_state_lulling;
state_object[_ABILITY_STATE.revenge		] = ob_state_revenge;
state_object[_ABILITY_STATE.flee		] = ob_state_flee;
state_object[_ABILITY_STATE.wastetime	] = ob_state_wastetime;
state_object[_ABILITY_STATE.teleport	] = ob_state_teleport;
state_object[_ABILITY_STATE.telekinesis	] = ob_state_telekinesis;
state_object[_ABILITY_STATE.mindcontrol	] = ob_state_mindcontrol;


#endregion

#region Level coefficients

enum _FORCE {
	paltry,
	frail,
	helpless,
	preferred,
	reliable,
	strong,
	selective,
	elite,
	legendary,
	incredible
}

globalvar force_text;
force_text[_FORCE.paltry	] = "Feeble"
force_text[_FORCE.frail		] = "Poor"
force_text[_FORCE.helpless	] = "Fragile"
force_text[_FORCE.preferred	] = "Wrothy"
force_text[_FORCE.reliable	] = "Stocky"
force_text[_FORCE.strong	] = "Strong"
force_text[_FORCE.selective	] = "Campion"
force_text[_FORCE.elite		] = "Elite"
force_text[_FORCE.legendary	] = "Legendary"
force_text[_FORCE.incredible] = "Incredible"

globalvar coef_force;
coef_force[_FORCE.paltry	] = 0.91
coef_force[_FORCE.frail		] = 0.95 
coef_force[_FORCE.helpless	] = 0.98 
coef_force[_FORCE.preferred	] = 1	
coef_force[_FORCE.reliable	] = 1.03 
coef_force[_FORCE.strong	] = 1.07 
coef_force[_FORCE.selective	] = 1.12 
coef_force[_FORCE.elite		] = 1.18 
coef_force[_FORCE.legendary	] = 1.25
coef_force[_FORCE.incredible] = 1.33

globalvar coef_level;
coef_level[_FORCE.paltry	] = 0.045
coef_level[_FORCE.frail		] = 0.043
coef_level[_FORCE.helpless	] = 0.0418
coef_level[_FORCE.preferred	] = 0.041
coef_level[_FORCE.reliable	] = 0.04
coef_level[_FORCE.strong	] = 0.039
coef_level[_FORCE.selective	] = 0.038	
coef_level[_FORCE.elite		] = 0.0358
coef_level[_FORCE.legendary	] = 0.0343
coef_level[_FORCE.incredible] = 0.032

globalvar coef_lvlup;
coef_lvlup[_FORCE.paltry	] = 0.80
coef_lvlup[_FORCE.frail		] = 0.85 
coef_lvlup[_FORCE.helpless	] = 0.98 
coef_lvlup[_FORCE.preferred	] = 1.01
coef_lvlup[_FORCE.reliable	] = 1.05 
coef_lvlup[_FORCE.strong	] = 1.12 
coef_lvlup[_FORCE.selective	] = 1.23 
coef_lvlup[_FORCE.elite		] = 1.46 
coef_lvlup[_FORCE.legendary	] = 1.68
coef_lvlup[_FORCE.incredible] = 1.86

enum custom {
	_health = 150, //custom 1st healt proferred force
	_dmg = 100,
}

#endregion
//////////////////////////////////
enum _SIZE {
	tiny,
	normal,
	big,
	giant,
	immobile
}
globalvar size_text;
size_text[_SIZE.tiny	] = "tiny"
size_text[_SIZE.normal	] = "normal"
size_text[_SIZE.big		] = "big"
size_text[_SIZE.giant	] = "giant"
size_text[_SIZE.immobile] = "immobile"
//////////////////////////////////
enum _POSITION {
	underground,
	ground,
	fly
}
//////////////////////////////////
enum _HABITAT{
	amphibian,
	ground,
	water
}
enum _SURF_TYPE{
	surf_solid, // for ground
	surf_liquid, // for simple water
	surf_deepLiquid, // for ocean
	surf_abbyss // for hole
}
//////////////////////////////////
#region WEATHER
enum _WEATHER{
	none,
	clear,
	foggy,
	cloudy,
	rainy,
	stormy
}
//weather = irandom_range(_WEATHER.none, _WEATHER.stormy)
enum _FALLOUT_TYPE { //вид осадков: дождь снег ...
	none,
	rain,
	snow, // запрограммировано, но негде использовать
	ember
}
globalvar weather, fallout, is_pmTime;;
weather = _WEATHER.stormy //irandom_range(1,5)
fallout = _FALLOUT_TYPE.rain //irandom(1)
is_pmTime = false//irandom(1)

globalvar part_system_wind;
part_system_wind = part_system_create()
#endregion
//////////////////////////////////
globalvar trainer_inv_size; trainer_inv_size = 16;

globalvar popup_appeared; popup_appeared = false

//////////////////////////////////

globalvar trainer_preset; trainer_preset = sc_new_trainer()
trainer_preset[? "avatar"]	= irandom(sprite_get_number(sp_trainer_avatar))   // image_index from sp_trainer_avatar

globalvar current_trainer;	current_trainer = ds_map_create()

globalvar trainer_fnames;	trainer_fnames = [] 
globalvar trainer_count;	trainer_count = 0


sc_load_trainer_fnames()

globalvar pokemon_path;		pokemon_path = "pokedex.ini"
globalvar pokemon_list;		pokemon_list = ds_map_create()
globalvar pokemon_list_count
globalvar evolution_tree;	evolution_tree = ds_map_create()

var _arr = 0
globalvar element_table;
element_table = array_create(_ELEMENTAL.count-1)
for (var i=0; i<array_length_1d(element_table); i++)
	element_table[i] = array_create(3, _ELEMENTAL.none)
_arr = 0
globalvar aura_table;
aura_table = array_create(_ELEMENTAL.count-1)
for (var i=0; i<array_length_1d(aura_table); i++)
	aura_table[i] = array_create(3, _ELEMENTAL.none)

ini_open(pokemon_path)
	ds_map_read(pokemon_list, ini_read_string("pokemons", "pokemon_list", ""))
	pokemon_list_count = ds_map_size(pokemon_list)
	// load element table =========================================================
	for (var i=0; i<array_length_1d(element_table); i++) {
		_arr = array_from_string( ini_read_string("element_table", string(i), "0"))
		element_table[i] = _arr
	}
	for (var i=0; i<array_length_1d(aura_table); i++) {
		_arr = array_from_string( ini_read_string("aura_table", string(i), "0"))
		aura_table[i] = _arr
	}
	//=============================================================================
	
	var _n = ds_map_find_first(pokemon_list)
	var _s = "", e
	while not is_undefined(_n) {
		_s = ini_read_string("evolution_tree", _n, "")
		if _s = "" 
			show_message(_n + " has no evolution info!")
		else {
			try {
				evolution_tree[? _n] = json_parse(_s)
			} catch(e) {
				show_message("Evolution info is corrupted for "+_n)
				//evolution_tree[? _n] = {children: []}
			} 
		}
		_n = ds_map_find_next(pokemon_list, _n);
	}
ini_close()

globalvar current_pokemon;	current_pokemon = ds_map_create()

//////////////////////////////////
// saved slots

globalvar action_slot;
globalvar trainer_slot; 

globalvar player1_trainer;
globalvar player2_trainer;
//globalvar neutral_trainer;
player1_trainer = noone; //sc_new_trainer()
player2_trainer = noone; //sc_new_trainer()
//neutral_trainer = sc_new_trainer()
//neutral_trainer[? "name"] = "Mad pokemon"


globalvar log_battle; log_battle = ds_list_create()

globalvar maxchannel;
maxchannel = 5

audio_channel_num(maxchannel)
var _n = audio_get_listener_count()
var _info
for (var i=0; i<_n; i++) {
	_info = audio_get_listener_info(i)
	audio_set_master_gain(_info[? "index"], 0.2)
	ds_map_destroy(_info)
}

application_surface_enable(true)
gpu_set_texrepeat(true)

//gesture_drag_time(0.075)
//gesture_drag_distance()

#macro retreat_dist 200
#macro t_process_courage 10 // frames
#macro courage_max_regen 2 // 12 in 60 framerate
#macro max_distance_attack 180
#macro disposable_action_cooldown 60
#macro PixPerDist 18 // distance // 60 * 0.1 * 3

#macro frames_rate 60