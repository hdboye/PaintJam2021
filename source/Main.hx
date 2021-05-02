package;

import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxSprite;
import openfl.display.Sprite;

class Main extends Sprite
{
	public static var soundExt:String;

	public function new()
	{
		#if web
		soundExt = ".mp3";
		#else
		soundExt = ".ogg";
		#end
		super();
		addChild(new FlxGame(0, 0, MenuState));
	}
}
