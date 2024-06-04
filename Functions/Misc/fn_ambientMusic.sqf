//déclarez une variable music = true
//executez avec if(isServer) then {execVM "music.sqf"};
//pour arreter la musique, mettre music = false dans un déclencheur ou un script côté server
//pour arreter la music sans attendre la fin du morceau -> "" remoteExec["playmusic",0]; hors d'un déclencheur et playMusic ""; dans un déclencheur
music = true;

sleep 30;

while {music} do {	
	//liste de classname de musique (à trouver outils/utilitaire/jukebox dans l'éditeur)
	//à modifier à votre guise
	private _music_list = GDGM_musicList;

	while {count _music_list != 0 && music} do {
		music_played = false;
		private _music = selectRandom _music_list;
		_music remoteExec["playmusic",0];
		systemChat ("Playing : " + _music); //seulement affiché en solo
		addMusicEventHandler ["MusicStop", { music_played = true}];
		_music_list = _music_list - [_music];
		waitUntil { music_played };

		sleep (300 + random 720); //100 = temps maximum en seconde avant la prochaine musique
	};
};