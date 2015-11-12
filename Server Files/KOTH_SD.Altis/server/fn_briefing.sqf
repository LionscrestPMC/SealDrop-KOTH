/*
	File: briefing.sqf
	Author: DeadP4xel

	Description:
	Buttons for the Map Navbar
*/
waitUntil {!isNull player && player isEqualTo player};

/*
player createDiaryRecord ["header",
	[
		"NAME_BUTTON",
		"
			HERE SOME TEXT<br/>
			HERE SOME TEXT<br/>
			HERE SOME TEXT<br/>
			HERE SOME TEXT<br/>
		"
	]
];
*/
///////////////////// SUBJECTS \\\\\\\\\\\\\\\\\\\\\\\\\\\\
player createDiarySubject ["serverrules","Server Rules"];
player createDiarySubject ["controls","Controls"];
///////////////////// SUBJECTS \\\\\\\\\\\\\\\\\\\\\\\\\\\\

///////////////////////////////////////////////////////////// RECORDS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
player createDiaryRecord ["serverrules",
	[
		"Server Rules",
		"
			HERE SOME RULES<br/>
		"
	]
];
player createDiaryRecord ["controls",
	[
		"KOTH Controls",
		"
			PAGE UP: Sound +10%<br/>
			PAGE DOWN: Sound -10%<br/>
			^: Show personal player stats<br/>
			SPACE: TO JUMP<br/>
		"
	]
];
///////////////////////////////////////////////////////////// RECORDS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\