package;


import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_fipps_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_vcr_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_fipps_ttf1);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_vcr_ttf1);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:pathy34:assets%2Fdata%2Fdata-goes-here.txty4:sizezy4:typey4:TEXTy2:idR1y7:preloadtgoR0y57:assets%2Fdata%2Flol%20haha%20funny%20idea%20go%20brrr.txtR2i89R3R4R5R7R6tgoR2i10080R3y4:FONTy9:classNamey31:__ASSET__assets_fonts_fipps_ttfR5y26:assets%2Ffonts%2Ffipps.ttfR6tgoR0y34:assets%2Ffonts%2Ffonts-go-here.txtR2zR3R4R5R12R6tgoR2i75864R3R8R9y29:__ASSET__assets_fonts_vcr_ttfR5y24:assets%2Ffonts%2Fvcr.ttfR6tgoR0y24:assets%2Fimages%2Fbg.pngR2i343267R3y5:IMAGER5R15R6tgoR0y28:assets%2Fimages%2Fcursor.pngR2i396R3R16R5R17R6tgoR0y36:assets%2Fimages%2Fimages-go-here.txtR2zR3R4R5R18R6tgoR0y41:assets%2Fimages%2FinGame%2Fbackground.pngR2i54537R3R16R5R19R6tgoR0y37:assets%2Fimages%2FinGame%2Fbarcan.pngR2i3316R3R16R5R20R6tgoR0y38:assets%2Fimages%2FinGame%2Fbarshit.pngR2i14273R3R16R5R21R6tgoR0y40:assets%2Fimages%2FinGame%2FcampyShit.pngR2i132307R3R16R5R22R6tgoR0y40:assets%2Fimages%2FinGame%2FcampyShit.xmlR2i6606R3R4R5R23R6tgoR0y39:assets%2Fimages%2FinGame%2Fdialogue.pngR2i99727R3R16R5R24R6tgoR0y39:assets%2Fimages%2FinGame%2Fdialogue.xmlR2i1069R3R4R5R25R6tgoR0y37:assets%2Fimages%2FinGame%2Fdollar.pngR2i2136R3R16R5R26R6tgoR0y37:assets%2Fimages%2FinGame%2Fenergy.pngR2i1815R3R16R5R27R6tgoR0y33:assets%2Fimages%2FinGame%2Fgo.pngR2i18370R3R16R5R28R6tgoR0y42:assets%2Fimages%2FinGame%2Fhappyreplay.pngR2i14694R3R16R5R29R6tgoR0y47:assets%2Fimages%2FinGame%2Fhappyreplaytouch.pngR2i14691R3R16R5R30R6tgoR0y53:assets%2Fimages%2FinGame%2Fhitboxes%2FpaintHitbox.pngR2i427R3R16R5R31R6tgoR0y50:assets%2Fimages%2FinGame%2Fhitboxes%2FpcHitbox.pngR2i670R3R16R5R32R6tgoR0y50:assets%2Fimages%2FinGame%2Fhitboxes%2FREADTHIS.txtR2i88R3R4R5R33R6tgoR0y39:assets%2Fimages%2FinGame%2Fpainting.pngR2i6240R3R16R5R34R6tgoR0y37:assets%2Fimages%2FinGame%2Freplay.pngR2i22079R3R16R5R35R6tgoR0y42:assets%2Fimages%2FinGame%2Freplaytouch.pngR2i20764R3R16R5R36R6tgoR0y38:assets%2Fimages%2FinGame%2Fsoupbtn.pngR2i1688R3R16R5R37R6tgoR0y36:assets%2Fimages%2FinGame%2Ftimer.pngR2i2910R3R16R5R38R6tgoR0y26:assets%2Fimages%2Flose.pngR2i33411R3R16R5R39R6tgoR0y29:assets%2Fimages%2Fnumbers.pngR2i34371R3R16R5R40R6tgoR0y34:assets%2Fimages%2Fnumbers_gold.pngR2i34371R3R16R5R41R6tgoR0y29:assets%2Fimages%2Fplaybtn.pngR2i8594R3R16R5R42R6tgoR0y31:assets%2Fimages%2Fplaytouch.pngR2i10875R3R16R5R43R6tgoR0y25:assets%2Fimages%2Fwin.pngR2i46353R3R16R5R44R6tgoR2i269627R3y5:MUSICR5y29:assets%2Fmusic%2Fdialogue.mp3y9:pathGroupaR46y29:assets%2Fmusic%2Fdialogue.oggR46hR6tgoR2i193690R3y5:SOUNDR5R48R47aR46R48R46hgoR2i839515R3R45R5y27:assets%2Fmusic%2Fingame.mp3R47aR50y27:assets%2Fmusic%2Fingame.oggR50hR6tgoR2i654547R3R49R5R51R47aR50R51R50hgoR2i275897R3R45R5y25:assets%2Fmusic%2Flose.mp3R47aR52y25:assets%2Fmusic%2Flose.oggR52hR6tgoR2i189244R3R49R5R53R47aR52R53R52hgoR2i420093R3R45R5y25:assets%2Fmusic%2Fmenu.mp3R47aR54y25:assets%2Fmusic%2Fmenu.oggR54hR6tgoR2i212116R3R49R5R55R47aR54R55R54hgoR0y36:assets%2Fmusic%2Fmusic-goes-here.txtR2zR3R4R5R56R6tgoR2i201918R3R45R5y24:assets%2Fmusic%2Fwin.mp3R47aR57y24:assets%2Fmusic%2Fwin.oggR57hR6tgoR2i159805R3R49R5R58R47aR57R58R57hgoR2i5223R3R45R5y25:assets%2Fsounds%2Fbap.mp3R47aR59y25:assets%2Fsounds%2Fbap.oggR59hR6tgoR2i5471R3R49R5R60R47aR59R60R59hgoR2i8491R3R45R5y28:assets%2Fsounds%2Fclicky.mp3R47aR61y28:assets%2Fsounds%2Fclicky.oggR61hR6tgoR2i7811R3R49R5R62R47aR61R62R61hgoR2i41280R3R45R5y24:assets%2Fsounds%2Fgo.mp3R47aR63y24:assets%2Fsounds%2Fgo.oggR63hR6tgoR2i14300R3R49R5R64R47aR63R64R63hgoR2i16717R3R45R5y26:assets%2Fsounds%2Fnope.mp3R47aR65y26:assets%2Fsounds%2Fnope.oggR65hR6tgoR2i9624R3R49R5R66R47aR65R66R65hgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R67R6tgoR0R1R2zR3R4R5R1R6tgoR0R7R2i89R3R4R5R7R6tgoR2i10080R3R8R9y32:__ASSET__assets_fonts_fipps_ttf1R5R11R6tgoR0R12R2zR3R4R5R12R6tgoR2i75864R3R8R9y30:__ASSET__assets_fonts_vcr_ttf1R5R14R6tgoR0R15R2i343267R3R16R5R15R6tgoR0R17R2i396R3R16R5R17R6tgoR0R18R2zR3R4R5R18R6tgoR0R19R2i54537R3R16R5R19R6tgoR0R20R2i3316R3R16R5R20R6tgoR0R21R2i14273R3R16R5R21R6tgoR0R22R2i132307R3R16R5R22R6tgoR0R23R2i6606R3R4R5R23R6tgoR0R24R2i99727R3R16R5R24R6tgoR0R25R2i1069R3R4R5R25R6tgoR0R26R2i2136R3R16R5R26R6tgoR0R27R2i1815R3R16R5R27R6tgoR0R28R2i18370R3R16R5R28R6tgoR0R29R2i14694R3R16R5R29R6tgoR0R30R2i14691R3R16R5R30R6tgoR0R31R2i427R3R16R5R31R6tgoR0R32R2i670R3R16R5R32R6tgoR0R33R2i88R3R4R5R33R6tgoR0R34R2i6240R3R16R5R34R6tgoR0R35R2i22079R3R16R5R35R6tgoR0R36R2i20764R3R16R5R36R6tgoR0R37R2i1688R3R16R5R37R6tgoR0R38R2i2910R3R16R5R38R6tgoR0R39R2i33411R3R16R5R39R6tgoR0R40R2i34371R3R16R5R40R6tgoR0R41R2i34371R3R16R5R41R6tgoR0R42R2i8594R3R16R5R42R6tgoR0R43R2i10875R3R16R5R43R6tgoR0R44R2i46353R3R16R5R44R6tgoR2i269627R3R45R5R46R47aR46R48R46hgoR2i839515R3R45R5R50R47aR50R51R50hgoR2i275897R3R45R5R52R47aR52R53R52hgoR2i420093R3R45R5R54R47aR54R55R54hgoR0R56R2zR3R4R5R56R6tgoR2i201918R3R45R5R57R47aR57R58R57hgoR2i5223R3R45R5R59R47aR59R60R59hgoR2i8491R3R45R5R61R47aR61R62R61hgoR2i41280R3R45R5R63R47aR63R64R63hgoR2i16717R3R45R5R65R47aR65R66R65hgoR0R67R2zR3R4R5R67R6tgoR2i2114R3R45R5y26:flixel%2Fsounds%2Fbeep.mp3R47aR70y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R45R5y28:flixel%2Fsounds%2Fflixel.mp3R47aR72y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i5794R3R49R5R71R47aR70R71hgoR2i33629R3R49R5R73R47aR72R73hgoR2i15744R3R8R9y35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R8R9y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R16R5R78R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R16R5R79R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_lol_haha_funny_idea_go_brrr_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_fipps_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_fonts_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_vcr_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_cursor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_background_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_barcan_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_barshit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_campyshit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_campyshit_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_dialogue_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_dialogue_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_dollar_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_energy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_go_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_happyreplay_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_happyreplaytouch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_hitboxes_painthitbox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_hitboxes_pchitbox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_hitboxes_readthis_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_painting_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_replay_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_replaytouch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_soupbtn_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_timer_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_lose_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_numbers_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_numbers_gold_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_playbtn_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_playtouch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_win_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_dialogue_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_dialogue_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_ingame_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_ingame_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_lose_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_lose_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_menu_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_menu_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_win_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_win_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_bap_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_bap_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_clicky_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_clicky_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_go_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_go_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_nope_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_nope_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt1 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_lol_haha_funny_idea_go_brrr_txt1 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_fipps_ttf1 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_fonts_go_here_txt1 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_vcr_ttf1 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bg_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_cursor_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt1 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_background_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_barcan_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_barshit_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_campyshit_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_campyshit_xml1 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_dialogue_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_dialogue_xml1 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_dollar_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_energy_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_go_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_happyreplay_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_happyreplaytouch_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_hitboxes_painthitbox_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_hitboxes_pchitbox_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_hitboxes_readthis_txt1 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_painting_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_replay_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_replaytouch_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_soupbtn_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ingame_timer_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_lose_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_numbers_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_numbers_gold_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_playbtn_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_playtouch_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_win_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_dialogue_mp4 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_ingame_mp4 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_lose_mp4 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_menu_mp4 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt1 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_win_mp4 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_bap_mp4 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_clicky_mp4 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_go_mp4 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_nope_mp4 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt1 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/data/lol haha funny idea go brrr.txt") @:noCompletion #if display private #end class __ASSET__assets_data_lol_haha_funny_idea_go_brrr_txt extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/fipps.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_fipps_ttf extends lime.text.Font {}
@:keep @:file("assets/fonts/fonts-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_fonts_fonts_go_here_txt extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/vcr.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_vcr_ttf extends lime.text.Font {}
@:keep @:image("assets/images/bg.png") @:noCompletion #if display private #end class __ASSET__assets_images_bg_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cursor.png") @:noCompletion #if display private #end class __ASSET__assets_images_cursor_png extends lime.graphics.Image {}
@:keep @:file("assets/images/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/inGame/background.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_background_png extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/barcan.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_barcan_png extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/barshit.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_barshit_png extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/campyShit.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_campyshit_png extends lime.graphics.Image {}
@:keep @:file("assets/images/inGame/campyShit.xml") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_campyshit_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/inGame/dialogue.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_dialogue_png extends lime.graphics.Image {}
@:keep @:file("assets/images/inGame/dialogue.xml") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_dialogue_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/inGame/dollar.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_dollar_png extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/energy.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_energy_png extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/go.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_go_png extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/happyreplay.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_happyreplay_png extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/happyreplaytouch.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_happyreplaytouch_png extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/hitboxes/paintHitbox.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_hitboxes_painthitbox_png extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/hitboxes/pcHitbox.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_hitboxes_pchitbox_png extends lime.graphics.Image {}
@:keep @:file("assets/images/inGame/hitboxes/READTHIS.txt") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_hitboxes_readthis_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/inGame/painting.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_painting_png extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/replay.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_replay_png extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/replaytouch.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_replaytouch_png extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/soupbtn.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_soupbtn_png extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/timer.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_timer_png extends lime.graphics.Image {}
@:keep @:image("assets/images/lose.png") @:noCompletion #if display private #end class __ASSET__assets_images_lose_png extends lime.graphics.Image {}
@:keep @:image("assets/images/numbers.png") @:noCompletion #if display private #end class __ASSET__assets_images_numbers_png extends lime.graphics.Image {}
@:keep @:image("assets/images/numbers_gold.png") @:noCompletion #if display private #end class __ASSET__assets_images_numbers_gold_png extends lime.graphics.Image {}
@:keep @:image("assets/images/playbtn.png") @:noCompletion #if display private #end class __ASSET__assets_images_playbtn_png extends lime.graphics.Image {}
@:keep @:image("assets/images/playtouch.png") @:noCompletion #if display private #end class __ASSET__assets_images_playtouch_png extends lime.graphics.Image {}
@:keep @:image("assets/images/win.png") @:noCompletion #if display private #end class __ASSET__assets_images_win_png extends lime.graphics.Image {}
@:keep @:file("assets/music/dialogue.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_dialogue_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/music/dialogue.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_dialogue_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/music/ingame.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_ingame_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/music/ingame.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_ingame_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/music/lose.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_lose_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/music/lose.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_lose_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/music/menu.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_menu_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/music/menu.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_menu_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/music/win.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_win_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/music/win.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_win_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/bap.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_bap_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/bap.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_bap_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/clicky.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_clicky_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/clicky.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_clicky_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/go.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_go_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/go.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_go_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/nope.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_nope_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/nope.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_nope_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt1 extends haxe.io.Bytes {}
@:keep @:file("assets/data/lol haha funny idea go brrr.txt") @:noCompletion #if display private #end class __ASSET__assets_data_lol_haha_funny_idea_go_brrr_txt1 extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/fipps.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_fipps_ttf1 extends lime.text.Font {}
@:keep @:file("assets/fonts/fonts-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_fonts_fonts_go_here_txt1 extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/vcr.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_vcr_ttf1 extends lime.text.Font {}
@:keep @:image("assets/images/bg.png") @:noCompletion #if display private #end class __ASSET__assets_images_bg_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/cursor.png") @:noCompletion #if display private #end class __ASSET__assets_images_cursor_png1 extends lime.graphics.Image {}
@:keep @:file("assets/images/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt1 extends haxe.io.Bytes {}
@:keep @:image("assets/images/inGame/background.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_background_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/barcan.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_barcan_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/barshit.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_barshit_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/campyShit.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_campyshit_png1 extends lime.graphics.Image {}
@:keep @:file("assets/images/inGame/campyShit.xml") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_campyshit_xml1 extends haxe.io.Bytes {}
@:keep @:image("assets/images/inGame/dialogue.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_dialogue_png1 extends lime.graphics.Image {}
@:keep @:file("assets/images/inGame/dialogue.xml") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_dialogue_xml1 extends haxe.io.Bytes {}
@:keep @:image("assets/images/inGame/dollar.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_dollar_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/energy.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_energy_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/go.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_go_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/happyreplay.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_happyreplay_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/happyreplaytouch.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_happyreplaytouch_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/hitboxes/paintHitbox.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_hitboxes_painthitbox_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/hitboxes/pcHitbox.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_hitboxes_pchitbox_png1 extends lime.graphics.Image {}
@:keep @:file("assets/images/inGame/hitboxes/READTHIS.txt") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_hitboxes_readthis_txt1 extends haxe.io.Bytes {}
@:keep @:image("assets/images/inGame/painting.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_painting_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/replay.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_replay_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/replaytouch.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_replaytouch_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/soupbtn.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_soupbtn_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/inGame/timer.png") @:noCompletion #if display private #end class __ASSET__assets_images_ingame_timer_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/lose.png") @:noCompletion #if display private #end class __ASSET__assets_images_lose_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/numbers.png") @:noCompletion #if display private #end class __ASSET__assets_images_numbers_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/numbers_gold.png") @:noCompletion #if display private #end class __ASSET__assets_images_numbers_gold_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/playbtn.png") @:noCompletion #if display private #end class __ASSET__assets_images_playbtn_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/playtouch.png") @:noCompletion #if display private #end class __ASSET__assets_images_playtouch_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/win.png") @:noCompletion #if display private #end class __ASSET__assets_images_win_png1 extends lime.graphics.Image {}
@:keep @:file("assets/music/dialogue.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_dialogue_mp4 extends haxe.io.Bytes {}
@:keep @:file("assets/music/ingame.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_ingame_mp4 extends haxe.io.Bytes {}
@:keep @:file("assets/music/lose.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_lose_mp4 extends haxe.io.Bytes {}
@:keep @:file("assets/music/menu.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_menu_mp4 extends haxe.io.Bytes {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt1 extends haxe.io.Bytes {}
@:keep @:file("assets/music/win.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_win_mp4 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/bap.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_bap_mp4 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/clicky.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_clicky_mp4 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/go.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_go_mp4 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/nope.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_nope_mp4 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt1 extends haxe.io.Bytes {}
@:keep @:file("C:/Users/Tariq/Downloads/haxe libs/HAXE LIBS/flixel/4,8,1/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/Users/Tariq/Downloads/haxe libs/HAXE LIBS/flixel/4,8,1/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/Users/Tariq/Downloads/haxe libs/HAXE LIBS/flixel/4,8,1/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/Users/Tariq/Downloads/haxe libs/HAXE LIBS/flixel/4,8,1/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/Users/Tariq/Downloads/haxe libs/HAXE LIBS/flixel/4,8,1/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/Users/Tariq/Downloads/haxe libs/HAXE LIBS/flixel/4,8,1/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__assets_fonts_fipps_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_fipps_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/fipps"; #else ascender = 682; descender = -256; height = 1030; numGlyphs = 109; underlinePosition = -153; underlineThickness = 51; unitsPerEM = 1024; #end name = "ThaleahFat"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_vcr_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_vcr_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/vcr"; #else ascender = 1800; descender = 0; height = 2000; numGlyphs = 204; underlinePosition = -292; underlineThickness = 150; unitsPerEM = 2048; #end name = "VCR OSD Mono"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_fipps_ttf1') @:noCompletion #if display private #end class __ASSET__assets_fonts_fipps_ttf1 extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/fipps"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "ThaleahFat"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_vcr_ttf1') @:noCompletion #if display private #end class __ASSET__assets_fonts_vcr_ttf1 extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/vcr"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "VCR OSD Mono"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__assets_fonts_fipps_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_fipps_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_fipps_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_vcr_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_vcr_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_vcr_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_fipps_ttf1') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_fipps_ttf1 extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_fipps_ttf1 ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_vcr_ttf1') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_vcr_ttf1 extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_vcr_ttf1 ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__assets_fonts_fipps_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_fipps_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_fipps_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_vcr_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_vcr_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_vcr_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_fipps_ttf1') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_fipps_ttf1 extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_fipps_ttf1 ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_vcr_ttf1') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_vcr_ttf1 extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_vcr_ttf1 ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
