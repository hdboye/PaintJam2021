package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

class Player extends FlxSprite
{
	public function new(x:Int, y:Int)
	{
		super(x, y);
		frames = FlxAtlasFrames.fromSparrow("assets/images/inGame/campyShit.png", "assets/images/inGame/campyShit.xml");
		animation.addByPrefix("idle", "campyIdle", 24, true);
		animation.addByPrefix("pc", "campyPC", 24, true);
		animation.addByPrefix("paint", "campyPaint", 24, true);
		animation.addByPrefix("sleep", "campySleep", 24, false);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	public function doThing(thing:String)
	{
		if (thing == "pc")
			setPosition(200, 250);
		else if (thing == "paint")
			setPosition(520, 200);
		else
			setPosition(450, 400);
		if (thing != "sleep")
		{
			PlayState.doingSum = true;
		}
		animation.play(thing, true);
		if (thing != "sleep")
		{
			new FlxTimer().start(1, function fartshitlol(ugh:FlxTimer)
			{
				animation.play("idle");
				setPosition(450, 400);
				PlayState.doingSum = false;
			});
		}
	}
}
