/// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
/// !!!!!!!!!!HEY LISTEN!!!!!!!!!!!!!!!!!!!!!!!!
/// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

// If you modify this file you ALSO need to modify tgui/packages/tgui-panel/styles/tgchat/chat-light.scss and chat-dark.scss
// BUT you have to use PX font sizes with are on a x8 scale of these font sizes
// Sample font-size: DM: 8 CSS: 64px

/client/script = {"<style>
body					{font-family: Verdana, sans-serif;}

h1, h2, h3, h4, h5, h6	{color: #0000ff;	font-family: Georgia, Verdana, sans-serif;}

em						{font-style: normal;	font-weight: bold;}

.motd					{color: #638500;	font-family: Verdana, sans-serif;}
.motd h1, .motd h2, .motd h3, .motd h4, .motd h5, .motd h6
	{color: #638500;	text-decoration: underline;}
.motd a, .motd a:link, .motd a:visited, .motd a:active, .motd a:hover
	{color: #638500;}

.italics				{					font-style: italic;}

.bold					{					font-weight: bold;}

.prefix					{					font-weight: bold;}

.ooc					{					font-weight: bold;}
.dooc					{color: #830094;	font-weight: bold;}
.adminobserverooc		{color: #0099cc;	font-weight: bold;}
.adminooc				{color: #700038;	font-weight: bold;}

.adminsay				{color:	#FF4500;	font-weight: bold;}
.admin					{color: #386aff;	font-weight: bold;}

.name					{					font-weight: bold;}

.say					{}
.deadsay				{color: #5c00e6;}
.binarysay    			{color: #20c20e; background-color: #000000; display: block;}
.binarysay a  			{color: #00ff00;}
.binarysay a:active, .binarysay a:visited {color: #88ff88;}
.radio					{color: #008000;}
.sciradio				{color: #993399;}
.explradio				{color: #7ed4c2;}
.comradio				{color: #948f02;}
.secradio				{color: #a30000;}
.medradio				{color: #337296;}
.engradio				{color: #fb5613;}
.suppradio				{color: #a8732b;}
.servradio				{color: #6eaa2c;}
.syndradio				{color: #6d3f40;}
.centcomradio			{color: #686868;}
.aiprivradio			{color: #ff00ff;}
.redteamradio           {color: #ff0000;}
.blueteamradio          {color: #0000ff;}

.yell					{					font-weight: bold;}

.alert					{color: #ff0000;}
h1.alert, h2.alert		{color: #000000;}

.emote					{					font-style: italic;}
.selecteddna			{color: #ffffff; 	background-color: #001B1B}

.examine 				{font-size: 8pt;}

.attack					{color: #ff0000;}
.disarm					{color: #990000;}
.passive				{color: #660000;}

.userdanger				{color: #ff0000;	font-weight: bold; font-size: 3;}
.danger					{color: #ff0000;}
.warning				{color: #ff0000;	font-style: italic;}
.boldwarning			{color: #ff0000;	font-style: italic;	font-weight: bold}
.announce 				{color: #228b22;	font-weight: bold;}
.boldannounce			{color: #ff0000;	font-weight: bold;}
.greenannounce			{color: #00ff00;	font-weight: bold;}
.rose					{color: #ff5050;}
.info					{color: #0000CC;}
.notice					{color: #000099;}
.boldnotice				{color: #000099;	font-weight: bold;}
.usernotice				{color: #000099;	font-weight: bold; font-size: 3;}
.adminnotice			{color: #0000ff;}
.adminhelp              {color: #ff0000;    font-weight: bold;}
.adminhelp_conclusion {
	display: block;
	color: white;
	text-align: center;
	background-color: black;
	border: 2px solid red;
	border-radius: 10px;
	padding: 10px;
	margin: 10px 20px;
}
.death_message {
	display: block;
	color: white;
	text-align: center;
	background-color: black;
	border: 2px solid rgb(240, 62, 225);
	border-radius: 10px;
	padding: 10px;
	margin: 10px 20px;
}
.unconscious			{color: #0000ff;	font-weight: bold;}
.suicide				{color: #ff5050;	font-style: italic;}
.green					{color: #03ff39;}
.nicegreen					{color: #14a833;}
.shadowling				{color: #3b2769;}
.cult					{color: #973e3b;}
.cultlarge				{color: #973e3b; font-weight: bold; font-size: 3;}
.narsie					{color: #973e3b; font-weight: bold; font-size: 15;}
.narsiesmall			{color: #973e3b; font-weight: bold; font-size: 6;}
.narsiesmaller			{color: #973e3b; font-weight: bold; font-size: 3;}
.colossus				{color: #7F282A; font-size: 5;}
.hierophant				{color: #660099; font-weight: bold; font-style: italic;}
.hierophant_warning		{color: #660099; font-style: italic;}
.purple					{color: #5e2d79;}
.holoparasite			{color: #35333a;}

.revennotice			{color: #1d2953;}
.revenboldnotice		{color: #1d2953;	font-weight: bold;}
.revenbignotice			{color: #1d2953;	font-weight: bold; font-size: 3;}
.revenminor				{color: #823abb}
.revenwarning			{color: #760fbb;	font-style: italic;}
.revendanger			{color: #760fbb;	font-weight: bold; font-size: 3;}
.umbra					{color: #5000A0;}
.umbra_emphasis			{color: #5000A0;	font-weight: bold;	font-style: italic;}
.umbra_large			{color: #5000A0; font-size: 3; font-weight: bold; font-style: italic;}

.deconversion_message	{color: #5000A0; font-size: 3; font-style: italic;}

.brass					{color: #BE8700;}
.heavy_brass			{color: #BE8700; font-weight: bold; font-style: italic;}
.large_brass			{color: #BE8700; font-size: 3;}
.leader_brass			{color: #BE8700; font-size: 16px;}
.big_brass				{color: #BE8700; font-size: 3; font-weight: bold; font-style: italic;}
.ratvar					{color: #BE8700; font-size: 6; font-weight: bold; font-style: italic; animation: ratvarcolor 5000ms infinite;}
.ratvarsmall			{color: #BE8700; font-size: 3; font-weight: bold; font-style: italic; animation: ratvarcolor 5000ms infinite;}
.alloy					{color: #42474D;}
.heavy_alloy			{color: #42474D; font-weight: bold; font-style: italic;}
.nezbere_large			{color: #42474D; font-size: 3; font-weight: bold; font-style: italic;}
.nezbere				{color: #42474D; font-weight: bold; font-style: italic;}
.nezbere_small			{color: #42474D;}
.sevtug_large			{color: #AF0AAF; font-size: 3; font-weight: bold; font-style: italic;}
.sevtug					{color: #AF0AAF; font-weight: bold; font-style: italic;}
.sevtug_small			{color: #AF0AAF;}
.inathneq_large			{color: #1E8CE1; font-size: 3; font-weight: bold; font-style: italic;}
.inathneq				{color: #1E8CE1; font-weight: bold; font-style: italic;}
.inathneq_small			{color: #1E8CE1;}
.nzcrentr_large			{color: #DAAA18; font-size: 3; font-weight: bold; font-style: italic;}
.nzcrentr				{color: #DAAA18; font-weight: bold; font-style: italic;}
.nzcrentr_small			{color: #DAAA18;}
.neovgre_large			{color: #6E001A; font-size: 3; font-weight: bold; font-style: italic;}
.neovgre				{color: #6E001A; font-weight: bold; font-style: italic;}
.neovgre_small			{color: #6E001A;}

@keyframes ratvarcolor {
	0% { color: #0d0d0d; }
	9% { color: #BE8700; }
	18% { color: #0d0d0d; }
	27% { color: #42474D; }
	36% { color: #0d0d0d; }
	45% { color: #AF0AAF; }
	54% { color: #0d0d0d; }
	63% { color: #1E8CE1; }
	72% { color: #0d0d0d; }
	81% { color: #DAAA18; }
	90% { color: #0d0d0d; }
	100% { color: #6E001A; }
}

.newscaster				{color: #800000;}
.ghostalert				{color: #5c00e6;	font-style: italic; font-weight: bold;}

.alien					{color: #543354;}
.noticealien			{color: #00c000;}
.alertalien				{color: #00c000;	font-weight: bold;}
.changeling				{color: #800080;	font-style: italic;}
.assimilator			{color: #800080;	font-size: 2 ; font-weight: bold;}
.bigassimilator			{color: #800080;	font-size: 4 ; font-weight: bold;}

.spider					{color: #4d004d;}
.spiderlarge			{color: #4d004d;	font-size: 3 ; font-weight: bold;}

.interface				{color: #330033;}

.sans					{font-family: "Comic Sans MS", cursive, sans-serif;}
.papyrus				{font-family: "Papyrus", cursive, sans-serif;}
.robot					{font-family: "Courier New", cursive, sans-serif;}

.command_headset		{font-weight: bold; font-size: 3;}
.megaphone				{font-weight: bold; font-size: 3;}
.small					{font-size: 1;}
.big					{font-size: 3;}
.reallybig				{font-size: 4;}
.extremelybig			{font-size: 5;}
.greentext				{color: #00FF00;	font-size: 3;}
.infotext				{color: #36f1e2;	font-size: 3;}
.redtext				{color: #FF0000;	font-size: 3;}
.clown					{color: #FF69Bf;	font-size: 3; font-family: "Comic Sans MS", cursive, sans-serif; font-weight: bold;}
.singing				{font-family: "Trebuchet MS", cursive, sans-serif; font-style: italic;}
.his_grace				{color: #15D512;	font-family: "Courier New", cursive, sans-serif; font-style: italic;}
.hypnophrase			{color: #3bb5d3;	font-weight: bold; animation: hypnocolor 1500ms infinite;}
@keyframes hypnocolor {
	0% { color: #0d0d0d; }
	25% { color: #410194; }
	50% { color: #7f17d8; }
	75% { color: #410194; }
	100% { color: #3bb5d3; }
}

.phobia			{color: #dd0000;	font-weight: bold; animation: phobia 750ms infinite;}
	@keyframes phobia {
		0% { color: #0d0d0d; }
		50% { color: #dd0000; }
		100% { color: #0d0d0d; }
}

.icon 					{height: 1em;	width: auto;}

.memo					{color: #638500;	text-align: center;}
.memoedit				{text-align: center;	font-size: 2;}
.abductor				{color: #800080; font-style: italic;}
.mind_control			{color: #A00D6F; font-size: 3; font-weight: bold; font-style: italic;}
.slime					{color: #00CED1;}
.drone					{color: #848482;}
.monkey					{color: #975032;}
.swarmer				{color: #2C75FF;}
.resonate				{color: #298F85;}

.monkeyhive				{color: #774704;}
.monkeylead				{color: #774704;	font-size: 2;}
.tape_recorder			{color: #ff0000;	font-family: 'Courier New', cursive, sans-serif;}
</style>"}
