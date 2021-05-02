package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.mouse.FlxMouseButton.FlxMouseButtonID;
import flixel.input.mouse.FlxMouseEventManager;

class LoseState extends FlxState
{
	var winImg:FlxSprite = new FlxSprite();
	var replay:FlxSprite = new FlxSprite(770, 415);

	override public function create():Void
	{
		if (PlayState.losewin == 'win')
			win();
		else
			lose();
		add(winImg);
		add(replay);
		FlxMouseEventManager.add(replay, function playshit(ugh:FlxSprite)
		{
			FlxG.switchState(new MenuState());
		}, null, null, null, false, true, false, [FlxMouseButtonID.LEFT]);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		if (FlxG.mouse.overlaps(replay))
		{
			if (PlayState.losewin == 'win')
			{
				replay.loadGraphic("assets/images/inGame/happyreplaytouch.png");
			}
			else
			{
				replay.loadGraphic("assets/images/inGame/replaytouch.png");
			}
		}
		else
		{
			if (PlayState.losewin == 'win')
			{
				replay.loadGraphic("assets/images/inGame/happyreplay.png");
			}
			else
			{
				replay.loadGraphic("assets/images/inGame/replay.png");
			}
		}
		super.update(elapsed);
	}

	function lose()
	{
		winImg.loadGraphic("assets/images/lose.png");
		FlxG.sound.playMusic("assets/music/lose" + Main.soundExt);
	}

	function win()
	{
		winImg.loadGraphic("assets/images/win.png");
		FlxG.sound.playMusic("assets/music/win" + Main.soundExt);
	}
}
