package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

// no matter how shit this code is, i still love it cuz it works. this took me a long time cuz im a noob
class Dialogue extends FlxSpriteGroup
{
	var tex:FlxAtlasFrames;
	var dtext:FlxTypeText = new FlxTypeText(-250, 350, 1070, "");
	var dialogueBox:FlxSprite = new FlxSprite(0, 0);
	var presskey:FlxText = new FlxText(15, 15);
	var txtArray:Array<String>;
	var globalAnim:String;
	var globalAudio:Bool;
	var endShit:String;
	var dcount:Int = 0;

	public static var saddial:Bool = false;

	public function new(anim:String, ?audio:Bool, text:Array<String>, whichOne:String)
	{
		super();
		txtArray = text;
		globalAnim = anim;
		globalAudio = audio;
		endShit = whichOne;
		antialiasing = false;
		FlxG.sound.pause();
		tex = FlxAtlasFrames.fromSparrow("assets/images/inGame/dialogue.png", "assets/images/inGame/dialogue.xml");
		dialogueBox.frames = tex;
		dialogueBox.animation.addByPrefix("happy", "happy", 24, false);
		dialogueBox.animation.addByPrefix("sad", "sad", 24, false);
		dialogueBox.animation.addByPrefix("regular", "regular", 24, false);
		dialogueBox.setGraphicSize(Std.int(dialogueBox.width) * 2, Std.int(dialogueBox.height) * 2);
		dialogueBox.setPosition(-100, -30);
		dialogueBox.updateHitbox();
		dtext.setFormat("assets/fonts/vcr.ttf", 64, FlxColor.WHITE, LEFT);
		dtext.sounds = [FlxG.sound.load("assets/sounds/bap" + Main.soundExt)];
		dtext.visible = true;
		dtext.setPosition(80, 495);
		presskey.setFormat("assets/fonts/vcr.ttf", 32, FlxColor.WHITE, LEFT);
		presskey.text = "Press ANY key to continue.";
		add(dialogueBox);
		add(dtext);
		add(presskey);
		if (globalAudio == true)
		{
			FlxG.sound.playMusic("assets/music/dialogue" + Main.soundExt, 1, true);
		}
	}

	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.justPressed.ANY)
		{
			if (dcount < txtArray.length)
			{
				doText();
			}
			else
			{
				dialogueBox.visible = false;
				dtext.visible = false;
				if (endShit == "start")
				{
					PlayState.startGam = true;
				}
				else if (endShit == "lose")
				{
					FlxG.sound.pause();
					dtext.visible = false;
					presskey.visible = false;
					dialogueBox.visible = false;
					new FlxTimer().start(3, function lolDoShit(fuckingtimer:FlxTimer)
					{
						FlxG.switchState(new LoseState());
					}, 1);
					PlayState.player.doThing("sleep");
				}
				else if (endShit == "win")
				{
					PlayState.losewin = 'win';
					FlxG.switchState(new LoseState());
				}
				kill();
			}
		}
		super.update(elapsed);
	}

	public function doText()
	{
		dialogueBox.animation.play(globalAnim, true, false);
		dtext.resetText(txtArray[dcount]);
		dtext.start(0.06, true);
		dcount += 1;
	}
}
